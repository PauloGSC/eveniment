import 'package:eveniment/bloc/eventFormBloc.dart';
import 'package:eveniment/bloc/listEventsBloc.dart';
import 'package:flutter/material.dart';
import 'package:eveniment/routes.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FormEventBloc>.value(value: FormEventBloc()),
        ChangeNotifierProvider<ListEventsBloc>.value(value: ListEventsBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          hintColor: Colors.blue[200],
          primaryColor: Colors.blue,
          fontFamily: "Montserrat",
        ),
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: routes);
  }
}
