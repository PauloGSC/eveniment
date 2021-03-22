import 'package:flutter/material.dart';

class FormEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Criar Evento';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(appTitle),
          automaticallyImplyLeading: true,
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class, which holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Nome do evento',
                    labelText: 'Nome do evento',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor insira o nome do evento';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.description),
                    hintText: 'Descrição do evento',
                    labelText: 'Descrição do evento',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor insira a descrição do evento';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.calendar_today),
                    hintText: 'Insira a data de inicio do evento',
                    labelText: 'Inicio do evento',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor insira a data de inicio do evento';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.calendar_today),
                    hintText: 'Data de fim do evento',
                    labelText: 'Fim do evento',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor insira a data de fim do evento';
                    }
                    return null;
                  },
                ),
                new Container(
                    padding: const EdgeInsets.only(left: 120.0, top: 40.0),
                    child: new RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: const Text('Publicar evento'),
                      onPressed: () {
                        // It returns true if the form is valid, otherwise returns false
                        if (_formKey.currentState.validate()) {
                          // If the form is valid, display a Snackbar.
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Publicando...')));
                          Navigator.pushNamed(context, '/');
                        }
                      },
                    )),
              ],
            )));
  }
}
