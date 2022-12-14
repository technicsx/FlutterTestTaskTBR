import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class GeolocationFetcher {
  static GeolocationFetcher get instance => _instance;
  static final GeolocationFetcher _instance = GeolocationFetcher._();

  GeolocationFetcher._();

  Future<Position> fetchGeo() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
  }

  Future<String?> getCountryByGeo(lat, long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    if (placemarks.isNotEmpty) {
      Placemark first = placemarks[0];
      return first.country;
    }
    return null;
  }
}
