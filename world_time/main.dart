//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:world_real_time/pages/home.dart';
import 'package:world_real_time/pages/loading.dart';
import 'package:world_real_time/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => loading(),
      '/home': (context) => Home(),
      '/location': (context) => Choose_location(),
    },
  ));
}

