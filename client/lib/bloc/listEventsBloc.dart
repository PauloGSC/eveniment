import 'package:eveniment/models/event.dart';
import 'package:eveniment/services/report_client.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ListEventsBloc extends ChangeNotifier {
  ReportClient _client = ReportClient();

  var actionPlanModel;
  final _controller = BehaviorSubject<List<EventModel>>();
  Stream<List<EventModel>> get events => _controller.stream;

  void fetchEvents() async {
    List<EventModel> _results = await _client.listEvents();
    _controller.sink.add(_results);
  }

  void fetchMyEvents() async {
    List<EventModel> _results = await _client.listMyEvents();
    _controller.sink.add(_results);
  }

  Future<bool> subscribe(idEvent) async {
    Map<String, dynamic> model = Map<String, dynamic>();
    model['idEvent'] = idEvent;

    return await _client.subscribeEvent(model);
  }

  Future<bool> cancelSubscribe(id) async {
    return await _client.cancelSubscribeEvent(id);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
