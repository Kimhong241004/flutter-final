import 'restaurant_type.dart';
import 'restaurant_comment.dart';

class Restaurant {
  final String name;
  final String address;
  final RestaurantType type;
  final List<RestaurantComment> comments;
 
  Restaurant({
    required this.name,
    required this.address,
    required this.type,
    List<RestaurantComment>? comments,
  }) : comments = comments ?? [];

  double get rating {
    if (comments.isEmpty) return 0.0;
    final sum = comments.fold<int>(0, (prev, comment) => prev + comment.stars);
    return sum / comments.length;
  }
}
