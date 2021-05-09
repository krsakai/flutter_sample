import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/pages/cafe_list.dart';
import 'package:flutter_application_1/presentation/arguments/cafe_list.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  static Widget provide() => ChangeNotifierProvider<HomePageModel>(
    create: (BuildContext context) => HomePageModel()..initialize(),
    child: HomePage()
  );

  @override
  Widget build(BuildContext context) {
    final HomePageModel model = Provider.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                Text('現在地', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.black87,)
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text('緯度 ${model.myLocationData?.latitude.toString()}'),
                Text('軽度 ${model.myLocationData?.longitude.toString()}')
              ],)
            ]),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: SizedBox(
                height: 60,
                width: 180,
                child: ElevatedButton(onPressed: model.hasCurrentLocation ? () async {
                  final lat = model.myLocationData?.latitude;
                  final lon = model.myLocationData?.longitude;
                  if (lat == null) { return; }
                  if (lon == null) { return; }
                  await Navigator.pushNamed<void>(
                    context, 
                    CafeListPage.routeName,
                    arguments: CafeListPageArguments(
                      lat: lat,
                      lon: lon,
                    ),
                  );
                } : null, 
                child: Text(
                  '近くのカフェ検索',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                )),
              ),
            ),
          ]
        ),
      )
    );
  }
}

class HomePageModel with ChangeNotifier {
  HomePageModel();

  Location locationService = Location();

  LocationData? myLocationData;

  StreamSubscription? locationChangedListen;

  bool get hasCurrentLocation => myLocationData != null;

  Future<void> initialize() async {
    myLocationData = await locationService.getLocation();
    notifyListeners();

    locationChangedListen = locationService.onLocationChanged.listen((LocationData result) async {
      myLocationData = result;
      notifyListeners();
    });
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    myLocationData = null;
    locationChangedListen?.cancel();
    locationChangedListen = null;
  }
}