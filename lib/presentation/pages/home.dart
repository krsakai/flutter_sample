import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/application.dart';
import 'package:flutter_application_1/presentation/pages/cafe_list.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:convert';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ホーム画面'),
      ),
      body: Container(
        child: Center(
          child: SizedBox(
            height: 100,
            width: 180,
            child: ElevatedButton(onPressed: () async {
              await Navigator.pushNamed<void>(context, CafeListPage.routeName);
            }, child: Text(
              '画面遷移',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            )),
          ),
        ),
      )
    );
  }
}
