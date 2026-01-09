// Widget to display a restaurant type chip
import 'package:flutter/material.dart';
import '../../../models/restaurant_type.dart';

class RestaurantTypeChip extends StatelessWidget {
  const RestaurantTypeChip({super.key, required this.type});

  final RestaurantType type;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        type.name.toUpperCase(),
        style: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
      backgroundColor: type.color,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    );
  }
}