import 'dart:math';

import 'package:flutter_application_1/domain/entities/cafe.dart';
import 'package:flutter_application_1/domain/repositories/cafe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiver/core.dart';

class CafeListPage extends StatelessWidget {
  const CafeListPage() : super();

  static const routeName = '/cafeList';

  static Widget provide() => ChangeNotifierProvider<CafeListPageModel>(
    create: (BuildContext context) => CafeListPageModel(cafeRepository: Provider.of(context, listen: false))..initialize(),
    child: const CafeListPage()
  );

  @override
  Widget build(BuildContext context) {
    final CafeListPageModel model = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('近場のカフェ一覧'),
      ),
      body: ListView.builder(
        itemCount: model.cafeList.length,
        itemBuilder: (BuildContext context, int index) {
          return messageItem(model.cafeList[index].name);
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

/// スポット一覧用ViewModel。
@visibleForTesting
class CafeListPageModel with ChangeNotifier {
  CafeListPageModel({required this.cafeRepository});

  final CafeRepository cafeRepository;

  List<Cafe> cafeList = [];

  Future<void> initialize() async {
    await fetchCafeList();
  }

  /// スポットの一覧を取得する。
  Future<void> fetchCafeList() async {
    notifyListeners();

    try {
      cafeList = await cafeRepository.cafeList();
    } on Exception catch (exception) {
      throw exception;
    }
    notifyListeners();
  }

  /// 現在保持している情報をリセットする。
  void clearSpotInfo() {
    cafeList = <Cafe>[];
  }

  /// disposeされていない場合にnotifyListenersを呼び出す。
  @override
  void notifyListeners() {
    super.notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
