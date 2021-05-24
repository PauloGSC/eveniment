import 'dart:convert';
import 'dart:io';

import 'package:eveniment/models/user.dart';
import 'package:eveniment/services/report_client.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc extends ChangeNotifier {
  ReportClient _client = ReportClient();

  final _userModel = UserModel();
  UserModel _user = UserModel();

  final _controller = BehaviorSubject<UserModel>();
  Stream<UserModel> get userForm => _controller.stream;

  final _model = BehaviorSubject<UserModel>();
  Stream<UserModel> get model => _controller.stream;

  void inicializeModel() {
    _controller.sink.add(_userModel);
  }

  Future<UserModel> getModel() async {
    UserModel data = await _client.fetchUser();

    return data;
  }

  void setName(String name) {
    _userModel.name = name;
    _controller.sink.add(_userModel);
  }

  void setPassword(String password) {
    _userModel.password = password;
    _controller.sink.add(_userModel);
  }

  void setEmail(String email) {
    _userModel.email = email;
    _controller.sink.add(_userModel);
  }

  void setRegistration(String registration) {
    _userModel.registration = int.parse(registration);
    _controller.sink.add(_userModel);
  }

  void setOcupation(String ocupation) {
    _userModel.ocupation = ocupation;
    _controller.sink.add(_userModel);
  }

  void changeImageAnswer(File image) {
    _userModel.image = base64Encode(image.readAsBytesSync());
  }

  Future<void> fetchUser() async {
    UserModel data = await _client.fetchUser();
    _user = data;
    _model.sink.add(data);
  }

  Future<bool> login(UserModel model) async {
    bool response = await _client.login(model.email, model.password);

    return response;
  }

  Future<bool> create(UserModel model) async {
    if (!isValid(model)) {
      return false;
    }
    Map<String, dynamic> data = model.toMap();
    data['isAdmin'] = false;

    bool response = await _client.createUser(data);

    return response;
  }

  bool isValid(UserModel model) {
    if (model.name == null) {
      return false;
    } else if (model.email == null) {
      return false;
    } else if (model.ocupation == null) {
      return false;
    } else if (model.password == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  void dispose() {
    _controller.close();
    _model.close();
  }
}
