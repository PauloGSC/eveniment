import 'package:eveniment/bloc/userBloc.dart';
import 'package:eveniment/services/report_client.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:eveniment/bloc/listEventsBloc.dart';
import 'package:eveniment/models/event.dart';
import 'package:eveniment/components/drawer/drawer.dart';
import 'package:provider/provider.dart';
import 'package:date_format/date_format.dart';

class MyEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ReportClient.isLogged().then((logged) {
      if (!logged)
        Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
    });

    final listEventsBloc = Provider.of<ListEventsBloc>(context);

    listEventsBloc.fetchMyEvents();

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 60.0),
          child: Center(child: Text('Meus eventos')),
        ),
        automaticallyImplyLeading: true,
      ),
      body: StreamBuilder<List<EventModel>>(
        stream: listEventsBloc.events,
        builder: (cont, snapshot) {
          List<EventModel> results = snapshot.data;

          if (!snapshot.hasData) {
            return Text('');
          }

          return Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: _buildBody(results, listEventsBloc),
          );
        },
      ),
      drawer: QuickDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/formEvent');
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        focusColor: Colors.white,
        splashColor: Colors.blueGrey,
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildBody(List<EventModel> model, ListEventsBloc listEventsBloc) {
    return Container(
        child: ListView.builder(
      padding: EdgeInsets.only(bottom: 80),
      itemCount: model.length,
      itemBuilder: (context, index) {
        EventModel item = model[index];
        return Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.white,
            elevation: 5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  // leading: Icon(Icons.album, size: 70),
                  title: Text(item.name, style: TextStyle(color: Colors.black)),
                  subtitle: Text(
                    formatDate(item.dtInit,
                            [dd, '/', mm, '/', yyyy, ' ', HH, ':', nn]) +
                        ' - ' +
                        formatDate(item.dtEnd,
                            [dd, '/', mm, '/', yyyy, ' ', HH, ':', nn]),
                    textAlign: TextAlign.end,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: item.image != null
                            ? Image.memory(
                                base64Decode(item.image),
                                width: MediaQuery.of(context).size.width - 40,
                                height: 300,
                                fit: BoxFit.cover,
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace stackTrace) {
                                  return const Text('Imagem Invalida!');
                                },
                              )
                            : Text('Sem imagem')),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(item.description),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Linkify(
                    onOpen: _onOpen,
                    overflow: TextOverflow.clip,
                    text: "Increver-se em: " + item.subscriptionLink,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // ignore: deprecated_member_use
                    FlatButton(
                      child: Text(
                          item.idSubscribe != null
                              ? 'Cancelar Interesse'
                              : 'Tenho Interesse',
                          style: TextStyle(
                              color: item.idSubscribe != null
                                  ? Colors.red
                                  : Colors.blue)),
                      onPressed: () async {
                        bool response;

                        if (item.idSubscribe != null) {
                          response = await listEventsBloc
                              .cancelSubscribe(item.idSubscribe);
                        } else {
                          response = await listEventsBloc.subscribe(item.id);
                        }

                        if (response) {
                          listEventsBloc.fetchMyEvents();
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ));
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw 'Could not launch $link';
    }
  }
}
