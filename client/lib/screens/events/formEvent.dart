import 'dart:io';

import 'package:eveniment/bloc/eventFormBloc.dart';
import 'package:eveniment/models/event.dart';
import 'package:image_picker/image_picker.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FormEvent extends StatefulWidget {
  const FormEvent({Key key}) : super(key: key);

  @override
  _FormEvent createState() => _FormEvent();
}

class _FormEvent extends State<FormEvent> {
  final _formKey = GlobalKey<FormState>();
  File _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext cont) {
    final appTitle = 'Criar Evento';
    final formEventBloc = Provider.of<FormEventBloc>(cont);
    formEventBloc.inicializeModel();

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined),
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/menu', (_) => false);
              }),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(appTitle),
          automaticallyImplyLeading: true,
        ),
        body: StreamBuilder<EventModel>(
          stream: formEventBloc.eventForm,
          builder: (context, snapshot) {
            final model = snapshot.data;

            if (!snapshot.hasData) return Text('');
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                _image != null
                                    ? 'Inserir outra capa'
                                    : 'Inserir capa do evento',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                await _getImage();

                                if (_image != null) {
                                  formEventBloc.changeImageAnswer(_image);
                                }
                              },
                              icon: Icon(Icons.camera_alt_rounded),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      _inputText(
                          'Nome do evento',
                          'Por favor insira o nome do evento',
                          Icons.dashboard, (text) {
                        formEventBloc.setName(text);
                      }),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      _inputText(
                          'Descrição do evento',
                          'Por favor insira a descrição do evento',
                          Icons.description, (text) {
                        formEventBloc.setDescription(text);
                      }),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      _inputText(
                          'Link para cadastro do evento',
                          'Por favor insira o link para cadastro',
                          Icons.link, (text) {
                        formEventBloc.setSubscriptionLink(text);
                      }),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      _buildDateField(
                        'Inicio do evento',
                        (date) {
                          formEventBloc.setDateInit(date);
                        },
                        'Por favor insira a data de inicio do evento',
                        model.dtInit,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      _buildDateField('Fim do evento', (date) {
                        formEventBloc.setDateEnd(date);
                      }, 'Por favor insira a data de inicio do evento',
                          model.dtEnd),
                      Container(
                          padding: EdgeInsets.only(left: 120.0, top: 40.0),
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: Text('Publicar evento'),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                formEventBloc.postForm(model);
                                Navigator.pushReplacementNamed(cont, '/menu');
                              }
                            },
                          )),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _inputText(
      String label, String alertMessage, IconData icon, Function onChanged) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(icon),
        hintText: label,
        labelText: label,
      ),
      validator: (value) {
        if (value.isEmpty) return alertMessage;
        return null;
      },
      onChanged: onChanged,
    );
  }

  Widget _buildDateField(
      String label, Function onChanged, String alertMessage, DateTime date) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                child: Text(
                  label,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
              ),
            ],
          ),
          Container(
            child: DateTimeField(
              initialValue: date,
              decoration: InputDecoration(
                hintText: 'Clique aqui para inserir a data',
                icon: Icon(Icons.calendar_today_rounded),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0)),
              ),
              validator: (value) {
                if (value == null) return alertMessage;
                return null;
              },
              obscureText: false,
              format: DateFormat("dd-MM-yyyy HH:mm"),
              onShowPicker: (context, currentValue) async {
                final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
                if (date != null) {
                  final time = await showTimePicker(
                    context: context,
                    initialTime:
                        TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  );
                  return DateTimeField.combine(date, time);
                } else {
                  return currentValue;
                }
              },
              onChanged: onChanged,
            ),
            margin: EdgeInsets.all(8.0),
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Future _getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
