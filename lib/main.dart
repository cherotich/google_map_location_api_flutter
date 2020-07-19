import 'package:flutter/material.dart';
import 'package:locator/screens/search.dart';
import 'package:locator/services/geolocator_services.dart';
import 'package:locator/services/paces_service.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:locator/models/place.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
final locatorservice = GeolocatorService();
final placesService = PlaceService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      FutureProvider( create: (context) => locatorservice.getLocation()),
ProxyProvider<Position,Future<List<Place>>>(
update:(context,position,place){
return (position != null) ?  placesService.getPlaces(position.latitude,position.longitude):null;

},
)
      ],
          child: MaterialApp(
        title: 'Locator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Search(),
      ),
    );
  }
}
