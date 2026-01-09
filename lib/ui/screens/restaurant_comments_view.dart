import 'package:flutter/material.dart';

import '../../models/restaurant.dart';
import '../../models/restaurant_comment.dart';
import '../theme.dart';
import 'restaurant_comments_form.dart';

class RestaurantCommentsView extends StatefulWidget {
  const RestaurantCommentsView({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  State<RestaurantCommentsView> createState() => _RestaurantCommentsViewState();
}

class _RestaurantCommentsViewState extends State<RestaurantCommentsView> {
  late Restaurant restaurant;

  @override
  void initState() {
    super.initState();
    restaurant = widget.restaurant;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: const Text(''),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Restaurant Header
          Container(
            color: AppColors.main,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  restaurant.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  restaurant.address,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(179, 0, 0, 0),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
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
                            color: Colors.white,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            restaurant.rating.toStringAsFixed(1),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Comments List
          Expanded(
            child: restaurant.comments.isEmpty
                ? const Center(
                    child: Text('No comments yet'),
                  )
                : ListView.builder(
                    itemCount: restaurant.comments.length,
                    itemBuilder: (context, index) {
                      final comment = restaurant.comments[index];
                      return Padding(
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
                                comment.feedback,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(width: 4),
                                    Text(
                                      comment.stars.toString(),
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => RestaurantCommentsForm(
              onAddComment: (stars, feedback) {
                setState(() {
                  restaurant.comments.add(
                    RestaurantComment(
                      stars: stars,
                      feedback: feedback,
                    ),
                  );
                });
                Navigator.pop(context);
              },
            ),
          );
        },
        backgroundColor: AppColors.main,
        child: const Icon(Icons.add),
      ),
    );
  }
}