import 'dart:async';
import 'dart:convert';
import 'package:eveniment/models/event.dart';
import 'package:http/http.dart' as http;

import 'package:http/http.dart' show get, post, put, delete;

class ReportClient {
  static final _host = 'http://192.168.0.115:8000/api';

  Future<dynamic> getHeaders() async {
    return {"Content-Type": "application/json"};
  }

  Future<bool> createEvent(Map<String, dynamic> model) async {
    try {
      final response = await post(
        Uri.parse(_host + '/event'),
        body: json.encode(model),
        headers: await this.getHeaders(),
      );
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<List<EventModel>> listEvents() async {
    try {
      List<EventModel> events = [];

      final response = await get(
        Uri.parse(_host + '/event?idUser=1'),
        headers: await this.getHeaders(),
      );

      List results = json.decode(response.body);
      results.forEach((result) => events.add(EventModel.fromJSON(result)));
      return events;
    } catch (err) {
      print(err);
      return [];
    }
  }

  Future<bool> subscribeEvent(Map<String, dynamic> model) async {
    try {
      final response = await post(
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
      final response = await delete(
        Uri.parse(_host + '/subscribe/' + id.toString()),
        headers: await this.getHeaders(),
      );

      return true;
    } catch (err) {
      return false;
    }
  }
}
