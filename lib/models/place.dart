import 'package:locator/models/geometry.dart';

class Place {
  final String name;
  final double rating;
  final int userRatingCoount;
  final String vicinity;
  final Geometry geometry;

  Place(
      {this.geometry,
      this.name,
      this.rating,
      this.userRatingCoount,
      this.vicinity});

  Place.fromJson(Map<dynamic, dynamic> parsedJson)
      : name = parsedJson['name'],
        rating = (parsedJson['rating'] != null)
            ? parsedJson['rating'].toDouble()
            : null,
        userRatingCoount = (parsedJson['user_ratings_total'] != null)
            ? parsedJson['user_ratings_total']
            : null,
        vicinity = parsedJson['vicinity'],
        geometry = Geometry.fromJson(parsedJson['geometry']);
}
