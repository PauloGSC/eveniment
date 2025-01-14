import 'package:eveniment/models/user.dart';
import 'package:flutter/material.dart';
import 'package:eveniment/components/drawer/drawer.dart';
import 'package:eveniment/services/report_client.dart';

class MyAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ReportClient.isLogged().then((logged) {
      if (!logged)
        Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
    });

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 60.0),
          child: Center(child: Text('Minha Conta')),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Center(child: SwipeList()),
      drawer: QuickDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/menu');
        },
        child: Icon(
          Icons.home,
          color: Colors.white,
        ),
        focusColor: Colors.white,
        splashColor: Colors.blueGrey,
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class SwipeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListItemWidget();
  }
}

class ListItemWidget extends State<SwipeList> {
  final ReportClient _client = ReportClient();

  List items = getDummyList();

  @override
  Widget build(BuildContext context) {
    Future<UserModel> model = _client.fetchUser();

    return FutureBuilder(
        future: model,
        builder: (cont, snapshot) {
          UserModel data = snapshot.data;
          if (snapshot.hasData) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  child: Column(children: <Widget>[
                    Container(
                      color: Colors.blueAccent[400],
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Informações da minha conta',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    Material(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        elevation: 10,
                        child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                'assets/user.jpeg',
                                width: 103,
                                height: 103,
                                fit: BoxFit.cover,
                              ),
                            ))),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(Icons.person),
                              Text(' Nome: ' + data.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                  )),
                            ],
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(Icons.confirmation_number),
                              Text(
                                  ' Matricula : ' +
                                      (data.registration ?? 'N/A'),
                                  style: TextStyle(
                                    fontSize: 16,
                                  )),
                            ],
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(Icons.create),
                              Text(
                                ' Criado em: ' + data.createdAt.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(Icons.email),
                              Text(' Email: ' + data.email,
                                  style: TextStyle(
                                    fontSize: 16,
                                  )),
                            ],
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(Icons.design_services),
                              Text('Ocupação: ' + data.ocupation,
                                  style: TextStyle(
                                    fontSize: 16,
                                  )),
                            ],
                          )),
                    ),
                  ]),
                ),
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 90.0,
                  ),
                ],
              ),
            );
          } else {
            return Text(
              'Carregando...',
              style: TextStyle(color: Colors.grey.shade800, fontSize: 20.0),
            );
          }
        });
  }

  static List getDummyList() {
    List list = List.generate(1, (i) {
      return "Item ${i + 1}";
    });

    return list;
  }
}
