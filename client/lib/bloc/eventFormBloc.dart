import 'dart:convert';
import 'dart:io';

import 'package:eveniment/models/event.dart';
import 'package:eveniment/services/report_client.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class FormEventBloc extends ChangeNotifier {
  ReportClient _client = ReportClient();

  final _eventModel = EventModel();

  var actionPlanModel;
  final _controller = BehaviorSubject<EventModel>();
  Stream<EventModel> get eventForm => _controller.stream;

  void inicializeModel() {
    _controller.sink.add(_eventModel);
  }

  void setName(String name) {
    _eventModel.name = name;
    _controller.sink.add(_eventModel);
  }

  void setDescription(String name) {
    _eventModel.description = name;
    _controller.sink.add(_eventModel);
  }

  void setSubscriptionLink(String name) {
    _eventModel.subscriptionLink = name;
    _controller.sink.add(_eventModel);
  }

  void setDateInit(DateTime date) {
    _eventModel.dtInit = date;
    _controller.sink.add(_eventModel);
  }

  void setDateEnd(DateTime date) {
    _eventModel.dtEnd = date;
    _controller.sink.add(_eventModel);
  }

  void changeImageAnswer(File image) {
    _eventModel.image = base64Encode(image.readAsBytesSync());
  }

  Future<bool> postForm(EventModel model) async {
    Map<String, dynamic> data = model.toMap();
    data['idUs'] = 1;
    data['dtUpdate'] = DateTime.now().toString();

    bool response = await _client.createEvent(data);

    return response;
  }

  @override
  void dispose() {
    _controller.close();
  }
}
