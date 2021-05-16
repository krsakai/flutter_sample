import 'package:flutter_application_1/domain/entities/cafe.dart';
import 'package:flutter_application_1/domain/repositories/cafe.dart';
import 'package:flutter/material.dart';

class CafeListPageModel with ChangeNotifier {
  CafeListPageModel({
    required this.cafeRepository,
    required this.lat,
    required this.lon,
  });

  final CafeRepository cafeRepository;

  final double lat;

  final double lon;

  List<Cafe> cafeList = [];

  Future<void> initialize() async {
    await fetchCafeList();
  }

  Future<void> fetchCafeList() async {
    notifyListeners();

    try {
      cafeList = await cafeRepository.cafeList(lat: lat, lon: lon);
    } on Exception catch (exception) {
      throw exception;
    }
    notifyListeners();
  }

  void clearSpotInfo() {
    cafeList = <Cafe>[];
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