// Widget to display a restaurant stars chip
import 'package:flutter/material.dart';

class StarsChip extends StatelessWidget {
  const StarsChip({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[500],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star,
            color: Colors.purple,
            size: 16,
          ),
          const SizedBox(width: 4),
          Text(
            rating.toStringAsFixed(1),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}