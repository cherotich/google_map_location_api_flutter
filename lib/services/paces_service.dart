import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locator/models/place.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlaceService {
  final key = 'your key';

Future<List<Place>> getPlaces(double lat,double lng,BitmapDescriptor icon) async{
  var response = await http.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=parking&rankby=distance&key=$key');
var json = convert.jsonDecode(response.body);
var jsonResults = json['results'] as List;
return jsonResults.map((place) => Place.fromJson(place,icon)).toList();

}


}
