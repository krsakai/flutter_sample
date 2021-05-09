import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/arguments/cafe_location_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class CafeLocationMapPage extends StatelessWidget {

  static Widget provide(CafeLocationMapPageArguments arguments) => ChangeNotifierProvider<CafeLocationMapPageModel>(
        create: (BuildContext context) => CafeLocationMapPageModel(
          lat: arguments.lat,
          lon: arguments.lon,
          name: arguments.name,
        ),
        child: CafeLocationMapPage(),
  );

  static const routeName = '/cafeList/cafeLocationMap';

  @override
  Widget build(BuildContext context) {
    final CafeLocationMapPageModel model = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(model.name),
      ),
      body: GoogleMap(
        onMapCreated: model.onMapCreated,
        markers: model.markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(model.lat, model.lon),
          zoom: 17.0,
        ),
        myLocationEnabled: true,
        mapType: MapType.normal,
        minMaxZoomPreference: MinMaxZoomPreference(10, 25)
      ),
    );
  }
}

@visibleForTesting
class CafeLocationMapPageModel with ChangeNotifier {
  CafeLocationMapPageModel({required this.lat, required this.lon, required this.name});

  final double lat;

  final double lon;

  final String name;

  Set<Marker> get markers => {
    Marker(markerId: MarkerId("x"), position: LatLng(lat, lon))
  };

  Completer<GoogleMapController> _controller = Completer();

  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
