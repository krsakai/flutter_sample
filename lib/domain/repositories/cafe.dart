import 'package:flutter_application_1/domain/entities/cafe.dart';
import 'package:flutter/foundation.dart';

abstract class CafeRepository {
  Future<List<Cafe>> cafeList();
}