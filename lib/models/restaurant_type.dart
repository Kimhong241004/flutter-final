import 'package:flutter/material.dart';

enum RestaurantType {
  streetfood(color: Color.fromARGB(255, 243, 212, 33)),
  french(color: Colors.blue),
  italian(color: Color.fromARGB(255, 50, 190, 22)),
  mexican(color: Color.fromARGB(171, 187, 59, 27)),
  khmer(color: Color.fromARGB(255, 58, 206, 193));

  final Color color;

  const RestaurantType({required this.color});
}
