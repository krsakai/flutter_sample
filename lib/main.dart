import 'package:flutter/material.dart';
import 'dart:async'; //非同期処理用
import 'dart:convert'; //httpレスポンスをJSON形式に変換用

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
        ),
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return messageItem(list[index]);
          },
        ),
      ),
    );
  }

  Widget messageItem(String title) {
    return Container(
      decoration: new BoxDecoration(
          border:
              new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
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
