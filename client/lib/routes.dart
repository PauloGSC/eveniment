import 'package:eveniment/screens/events/formEvent.dart';
import 'package:eveniment/screens/my_account/my-account.dart';
import 'package:eveniment/screens/my_certificates/my-certificates.dart';
import 'package:eveniment/screens/events/my-events.dart';
import 'package:flutter/material.dart';
import 'package:eveniment/screens/login/login.dart';
import 'package:eveniment/screens/events/menu.dart';

final routes = {
  '/': (BuildContext context) => Login(),
  '/menu': (BuildContext context) => Menu(),
  '/formEvent': (BuildContext context) => FormEvent(),
  '/myEvents': (BuildContext context) => MyEvents(),
  '/myCertificates': (BuildContext context) => MyCertificates(),
  '/myAccount': (BuildContext context) => MyAccount(),
};
