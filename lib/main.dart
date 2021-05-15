import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/application.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:convert';

Future<void> main() async {
  runApp(
    Provider<String>.value(value: "environment", child: Application()),
  );
}

class MyApp extends StatelessWidget {

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    var list = [
      "メッセージ1",
      "メッセージ2",
      "メッセージ3",
      "メッセージ4",
      "メッセージ5",
      "メッセージ6",
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return messageItem(list[index]);
        },
      ),
    );
  }

  Widget messageItem(String title) {
    return Container(
      decoration: new BoxDecoration(border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 18.0),
        ),
        onTap: () {
          print("onTap called.");
        }, // タップ
        onLongPress: () {
          print("onLongTap called.");
        }, // 長押し
      ),
    );
  }
}
