import 'package:flutter/material.dart';

import '../../models/restaurant.dart';
import '../../models/restaurant_type.dart';
import '../theme.dart';
import 'restaurant_comments_view.dart';

class RestaurantsView extends StatefulWidget {
  const RestaurantsView({super.key, required this.restaurants});

  final List<Restaurant> restaurants;

  @override
  State<RestaurantsView> createState() => _RestaurantsViewState();
}

class _RestaurantsViewState extends State<RestaurantsView> {
  bool showOnlyKhmer = false;

  List<Restaurant> get filteredRestaurants {
    if (showOnlyKhmer) {
      return widget.restaurants
          .where((r) => r.type == RestaurantType.khmer)
          .toList();
    }
    return widget.restaurants;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: const Text('Miam'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Checkbox(
                  value: showOnlyKhmer,
                  onChanged: (value) {
                    setState(() {
                      showOnlyKhmer = value ?? false;
                    });
                  },
                ),
                const Text('Show only Khmer restaurants'),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredRestaurants.length,
              itemBuilder: (context, index) {
                final restaurant = filteredRestaurants[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RestaurantCommentsView(
                          restaurant: restaurant,
                        ),
                      ),
                    ).then((_) {
                      setState(() {});
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurant.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.purple,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      restaurant.rating.toStringAsFixed(1),
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                decoration: BoxDecoration(
                                  color: restaurant.type.color,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                child: Text(
                                  restaurant.type.name.toUpperCase(),
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 12,
                                    
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
 