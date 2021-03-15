import 'package:event/screens/formEvent.dart';
import 'package:event/screens/my-account.dart';
import 'package:event/screens/my-certificates.dart';
import 'package:event/screens/my-events.dart';
import 'package:flutter/material.dart';
import 'package:event/screens/login.dart';
import 'package:event/screens/menu.dart';

final routes = {
  '/': (BuildContext context) => Login(),
  '/menu': (BuildContext context) => Menu(),
  '/formEvent': (BuildContext context) => FormEvent(),
  '/myEvents': (BuildContext context) => MyEvents(),
  '/myCertificates': (BuildContext context) => MyCertificates(),
  '/myAccount': (BuildContext context) => MyAccount(),
};
