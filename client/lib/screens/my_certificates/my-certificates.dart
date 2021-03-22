import 'package:flutter/material.dart';
import 'package:eveniment/components/drawer/drawer.dart';

class MyCertificates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 60.0),
          child: Center(child: Text('Meus Certificados')),
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
  List items = getDummyList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
          child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
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
                  const ListTile(
                    leading: Icon(Icons.picture_as_pdf, size: 70),
                    title: Text('Palestra de I.A',
                        style: TextStyle(color: Colors.black)),
                    subtitle: Text(
                      '12/05/2020, 12:00 - 17:00',
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text('Duração do evento: 5 horas'),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        child: const Text('Baixar',
                            style: TextStyle(color: Colors.blue)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
          // Dismissible(
          //     key: Key(items[index]),
          //     background: Container(
          //       alignment: AlignmentDirectional.centerEnd,
          //       color: Colors.red,
          //       child: Icon(
          //         Icons.delete,
          //         color: Colors.white,
          //       ),
          //     ),
          // onDismissed: (direction) {
          //   setState(() {
          //     items.removeAt(index);
          //   });
          // },
          // direction: DismissDirection.endToStart,
          // child: );
        },
      )),
    );
  }

  static List getDummyList() {
    List list = List.generate(10, (i) {
      return "Item ${i + 1}";
    });

    return list;
  }
}
