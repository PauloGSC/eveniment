import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:eveniment/models/event.dart';
import 'package:eveniment/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:http/http.dart' show get, post, put, delete;

class ReportClient {
  static final storage = new FlutterSecureStorage();
  static final _host = 'http://192.168.0.118:8000/api';

  Future<dynamic> getHeaders() async {
    return {
      "Content-Type": "application/json",
      "Authorization": await storage.read(key: 'jwt'),
    };
  }

  Future<bool> login(String email, String password) async {
    try {
      dynamic _response = await get(
        Uri.parse(
            _host + '/user/login?email=' + email + '&password=' + password),
        headers: await this.getHeaders(),
      );

      final result = json.decode(_response.body);

      if (result['message'] == 'Login realizado com sucesso!') {
        await storage.write(key: 'jwt', value: result['token']);
        await storage.write(key: 'idUser', value: result['idUser'].toString());
        await storage.write(
            key: 'isAdmin', value: result['isAdmin'].toString());

        return true;
      } else {
        return false;
      }
    } catch (err) {
      print(err);
      return false;
    }
  }

  Future<void> logout() async {
    await storage.deleteAll();
  }

  static Future<bool> isLogged() async {
    try {
      if (await storage.read(key: 'jwt') != null) {
        return true;
      }
      return false;
    } catch (err) {
      return false;
    }
  }

  static Future<bool> isAdmin() async {
    try {
      print(await storage.read(key: 'isAdmin'));
      if (await storage.read(key: 'isAdmin') == 'true') {
        return true;
      }
      return false;
    } catch (err) {
      return false;
    }
  }

  Future<bool> createUser(Map<String, dynamic> model) async {
    try {
      final _response = await post(
        Uri.parse(_host + '/user'),
        body: json.encode(model),
        headers: await this.getHeaders(),
      );
      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }

  Future<UserModel> fetchUser() async {
    try {
      int id = int.parse(await storage.read(key: 'idUser'));

      final _response = await get(
        Uri.parse(_host + '/user/' + id.toString()),
        headers: await this.getHeaders(),
      );

      dynamic result = json.decode(_response.body);

      return UserModel.fromJSON(result);
    } catch (err) {
      print(err);
      return err;
      //return UserModel();
    }
  }

  Future<bool> createEvent(Map<String, dynamic> model) async {
    try {
      model['idUser'] = int.parse(await storage.read(key: 'idUser'));
      final _response = await post(
        Uri.parse(_host + '/event'),
        body: json.encode(model),
        headers: await this.getHeaders(),
      );
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<List<EventModel>> listMyEvents() async {
    try {
      List<EventModel> events = [];

      final _response = await get(
        Uri.parse(_host + '/event/myevents'),
        headers: await this.getHeaders(),
      );

      List results = json.decode(_response.body);
      results.forEach((result) => events.add(EventModel.fromJSON(result)));
      return events;
    } catch (err) {
      print(err);
      return [];
    }
  }

  Future<List<EventModel>> listEvents() async {
    try {
      List<EventModel> events = [];

      final _response = await get(
        Uri.parse(_host + '/event'),
        headers: await this.getHeaders(),
      );

      List results = json.decode(_response.body);
      results.forEach((result) => events.add(EventModel.fromJSON(result)));
      return events;
    } catch (err) {
      print(err);
      return [];
    }
  }

  Future<bool> subscribeEvent(Map<String, dynamic> model) async {
    try {
      model['idUser'] = int.parse(await storage.read(key: 'idUser'));
      final _response = await post(
        Uri.parse(_host + '/subscribe'),
        body: json.encode(model),
        headers: await this.getHeaders(),
      );
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> cancelSubscribeEvent(int id) async {
    try {
      final _response = await delete(
        Uri.parse(_host + '/subscribe/' + id.toString()),
        headers: await this.getHeaders(),
      );

      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> deleteEvent(int id) async {
    try {
      final _response = await delete(
        Uri.parse(_host + '/event/' + id.toString()),
        headers: await this.getHeaders(),
      );

      return true;
    } catch (err) {
      return false;
    }
  }
}
