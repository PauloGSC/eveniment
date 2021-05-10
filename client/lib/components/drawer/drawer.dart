import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuickDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[Colors.cyan, Colors.cyanAccent])),
            child: Container(
              child: Column(
                children: <Widget>[
                  Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      elevation: 10,
                      child: Padding(
                          padding: EdgeInsets.all(7.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'assets/user.png',
                              width: 73,
                              height: 73,
                              fit: BoxFit.cover,
                            ),
                          ))),
                  Padding(
                      padding: EdgeInsets.all(8.0), child: _buildStreamName())
                ],
              ),
            ),
          ),
          _CustomListTile(Icons.home, 'Home', () {
            Navigator.pushNamed(context, '/menu');
          }),
          _CustomListTile(Icons.supervised_user_circle, 'Minha Conta', () {
            Navigator.pushNamed(context, '/myAccount');
          }),
          _CustomListTile(Icons.category, 'Meus Eventos', () {
            Navigator.pushNamed(context, '/myEvents');
          }),
          _CustomListTile(Icons.file_download, 'Meus Certificados', () {
            Navigator.pushNamed(context, '/myCertificates');
          }),
          _CustomListTile(Icons.exit_to_app, 'Sair', () async {
            Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
          }),
        ],
      ),
    );
  }

  static Widget _buildStreamName() {
    return Text(
      'Nome do Usuario',
      style: TextStyle(color: Colors.grey.shade800, fontSize: 20.0),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  _CustomListTile(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
          child: InkWell(
              splashColor: Colors.cyanAccent,
              onTap: onTap,
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          icon,
                          color: Colors.grey[700],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            text,
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_right)
                  ],
                ),
              )),
        ));
  }
}
