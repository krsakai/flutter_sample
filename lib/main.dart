import 'package:flutter/material.dart';
import 'package:flutter_application_1/application.dart';
import 'package:provider/provider.dart';
import 'dart:async';

Future<void> main() async {
  runApp(
    Provider<String>.value(value: "environment", child: Application()),
  );
}


