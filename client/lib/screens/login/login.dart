import 'package:eveniment/bloc/userBloc.dart';
import 'package:eveniment/models/user.dart';
import 'package:eveniment/services/report_client.dart';
import 'package:flutter/material.dart';
import 'package:eveniment/components/clipper.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  ReportClient client = ReportClient();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    final _userBloc = Provider.of<UserBloc>(context);

    ReportClient.isLogged().then((logged) {
      if (logged)
        Navigator.pushNamedAndRemoveUntil(context, '/menu', (_) => false);
    });

    Widget logo() {
      return Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 220,
          child: Stack(
            children: <Widget>[
              Positioned(
                  child: Container(
                child: Align(
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    width: 150,
                    height: 150,
                  ),
                ),
                height: 154,
              )),
              Positioned(
                child: Container(
                    height: 154,
                    child: Align(
                      child: Text(
                        "EVENIMENT",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    )),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width * 0.15,
                height: MediaQuery.of(context).size.width * 0.15,
                bottom: MediaQuery.of(context).size.height * 0.046,
                right: MediaQuery.of(context).size.width * 0.22,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width * 0.08,
                height: MediaQuery.of(context).size.width * 0.08,
                bottom: 0,
                right: MediaQuery.of(context).size.width * 0.32,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    }

    //input widget
    Widget _input(Icon icon, String hint, Function set, bool obsecure,
        TextInputType type) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          onChanged: (text) {
            set(text);
          },
          keyboardType: type,
          obscureText: obsecure,
          style: TextStyle(
            fontSize: 20,
          ),
          decoration: InputDecoration(
              hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              hintText: hint,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 3,
                ),
              ),
              prefixIcon: Padding(
                child: IconTheme(
                  data: IconThemeData(color: Theme.of(context).primaryColor),
                  child: icon,
                ),
                padding: EdgeInsets.only(left: 30, right: 10),
              )),
        ),
      );
    }

    //button widget
    Widget _button(String text, Color splashColor, Color highlightColor,
        Color fillColor, Color textColor, void function()) {
      return RaisedButton(
        highlightElevation: 0.0,
        splashColor: splashColor,
        highlightColor: highlightColor,
        elevation: 0.0,
        color: fillColor,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: textColor, fontSize: 20),
        ),
        onPressed: () {
          function();
        },
      );
    }

    //login and register fuctions

    void _loginUser() {
      Navigator.pushNamedAndRemoveUntil(context, '/menu', (_) => false);
      // _email = _emailController.text;
      // _password = _passwordController.text;
      // _emailController.clear();
      // _passwordController.clear();
    }

    void _registerUser() {
      Map<String, dynamic> model = Map<String, dynamic>();
      model['email'] = _emailController.text;
      model['password'] = _passwordController.text;
      model['username'] = _nameController.text;

      //client.createLogin(model);
      _emailController.clear();
      _passwordController.clear();
      _nameController.clear();
    }

    void _loginSheet() {
      _scaffoldKey.currentState.showBottomSheet<void>((BuildContext context) {
        return DecoratedBox(
          decoration: BoxDecoration(color: Theme.of(context).canvasColor),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)),
            child: Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 10,
                          top: 10,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.close,
                              size: 30.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    height: 50,
                    width: 50,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 140,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                child: Align(
                                  child: Container(
                                    width: 130,
                                    height: 130,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  alignment: Alignment.center,
                                ),
                              ),
                              Positioned(
                                child: Container(
                                  child: Text(
                                    "ENTRAR",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        StreamBuilder(
                            stream: _userBloc.userForm,
                            builder: (cont, snapshot) {
                              _userBloc.inicializeModel();

                              UserModel model = snapshot.data;

                              return Column(
                                children: [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      bottom: 20,
                                    ),
                                    child: _input(
                                        Icon(Icons.email),
                                        "Email",
                                        _userBloc.setEmail,
                                        false,
                                        TextInputType.text),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      bottom: 20,
                                    ),
                                    child: _input(
                                        Icon(Icons.lock),
                                        "Senha",
                                        _userBloc.setPassword,
                                        true,
                                        TextInputType.text),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: Container(
                                      child: _button(
                                          "CONFIRMAR",
                                          Colors.white,
                                          primary,
                                          primary,
                                          Colors.white, () async {
                                        bool login =
                                            await _userBloc.login(model);
                                        if (login) {
                                          Navigator.pushNamed(context, '/menu');
                                        } else {
                                          Toast.show(
                                            'Senha ou usuário inválid!',
                                            context,
                                            gravity: Toast.TOP,
                                          );
                                        }
                                      }),
                                      height: 50,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                  ),
                                ],
                              );
                            }),
                        /*  Padding(
                          padding: EdgeInsets.only(bottom: 20, top: 60),
                          child: _input(Icon(Icons.email), "EMAIL",
                              _emailController, false),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: _input(Icon(Icons.lock), "SENHA",
                              _passwordController, true),
                        ), */

                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height / 1.1,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
          ),
        );
      });
    }

    void _registerSheet() {
      _scaffoldKey.currentState.showBottomSheet<void>((BuildContext context) {
        return DecoratedBox(
          decoration: BoxDecoration(color: Theme.of(context).canvasColor),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)),
            child: Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 10,
                          top: 10,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              _emailController.clear();
                              _passwordController.clear();
                              _nameController.clear();
                            },
                            icon: Icon(
                              Icons.close,
                              size: 30.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    height: 50,
                    width: 50,
                  ),
                  SingleChildScrollView(
                    child: Column(children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 140,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              child: Align(
                                child: Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                            Positioned(
                              child: Container(
                                padding: EdgeInsets.only(bottom: 25, right: 40),
                                child: Text(
                                  "CRIAR",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                            Positioned(
                              child: Align(
                                child: Container(
                                  padding: EdgeInsets.only(top: 40, left: 28),
                                  width: 130,
                                  child: Text(
                                    "CONTA",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      StreamBuilder(
                          stream: _userBloc.userForm,
                          builder: (cont, snapshot) {
                            _userBloc.inicializeModel();

                            UserModel model = snapshot.data;
                            return Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 20,
                                    top: 60,
                                  ),
                                  child: _input(
                                      Icon(Icons.account_circle),
                                      "Nome",
                                      _userBloc.setName,
                                      false,
                                      TextInputType.text),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 20,
                                  ),
                                  child: _input(
                                      Icon(Icons.email),
                                      "Email",
                                      _userBloc.setEmail,
                                      false,
                                      TextInputType.text),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 20,
                                  ),
                                  child: _input(
                                      Icon(Icons.work),
                                      "Ocupação",
                                      _userBloc.setOcupation,
                                      false,
                                      TextInputType.text),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 20,
                                  ),
                                  child: _input(
                                      Icon(Icons.school),
                                      "Número da Matricula",
                                      _userBloc.setRegistration,
                                      false,
                                      TextInputType.number),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 20,
                                  ),
                                  child: _input(
                                      Icon(Icons.lock),
                                      "Senha",
                                      _userBloc.setPassword,
                                      true,
                                      TextInputType.text),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: Container(
                                    child: _button(
                                        "CONFIRMAR",
                                        Colors.white,
                                        primary,
                                        primary,
                                        Colors.white, () async {
                                      bool created =
                                          await _userBloc.create(model);

                                      if (created) {
                                        Toast.show(
                                          "Usuário criado com sucesso!",
                                          context,
                                          gravity: Toast.BOTTOM,
                                        );
                                        Navigator.of(context).pop();
                                      } else {
                                        Toast.show(
                                          "Todos os campos exceto o número da mátricula, são campos obrigatórios!",
                                          context,
                                          gravity: Toast.BOTTOM,
                                        );
                                      }

                                      _userBloc.inicializeModel();
                                    }),
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            );
                          }),
                    ]),
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height / 1.1,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
          ),
        );
      });
    }

    return Scaffold(
        //     resizeToAvoidBottomPadding: false,
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: <Widget>[
            logo(),
            Padding(
              child: Container(
                child: _button("ENTRAR", primary, Colors.white, Colors.white,
                    primary, _loginSheet),
                height: 50,
              ),
              padding: EdgeInsets.only(top: 80, left: 20, right: 20),
            ),
            Padding(
              child: Container(
                // ignore: deprecated_member_use
                child: OutlineButton(
                  highlightedBorderColor: Colors.white,
                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                  highlightElevation: 0.0,
                  splashColor: Colors.white,
                  highlightColor: Theme.of(context).primaryColor,
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    "INSCREVER-SE",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  onPressed: () {
                    _registerSheet();
                  },
                ),
                height: 50,
              ),
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            ),
            Expanded(
              child: Align(
                child: ClipPath(
                  child: Container(
                    color: Colors.white,
                    height: 300,
                  ),
                  clipper: BottomWaveClipper(),
                ),
                alignment: Alignment.bottomCenter,
              ),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ));
  }
}
