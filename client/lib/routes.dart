import 'package:eveniment/screens/formEvent.dart';
import 'package:eveniment/screens/my-account.dart';
import 'package:eveniment/screens/my-certificates.dart';
import 'package:eveniment/screens/my-events.dart';
import 'package:flutter/material.dart';
import 'package:eveniment/screens/login.dart';
import 'package:eveniment/screens/menu.dart';

final routes = {
  '/': (BuildContext context) => Login(),
  '/menu': (BuildContext context) => Menu(),
  '/formEvent': (BuildContext context) => FormEvent(),
  '/myEvents': (BuildContext context) => MyEvents(),
  '/myCertificates': (BuildContext context) => MyCertificates(),
  '/myAccount': (BuildContext context) => MyAccount(),
};
