import 'package:flutter_application_1/domain/entities/cafe.dart';

abstract class CafeRepository {
  Future<List<Cafe>> cafeList({required double lat, required double lon});
}