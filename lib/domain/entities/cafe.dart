import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

@immutable
class Cafe {
  const Cafe({required this.name});

  final String name;
}
