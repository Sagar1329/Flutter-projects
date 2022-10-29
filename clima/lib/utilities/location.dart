import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double langitutde;
  Future<void> geo_Locate() async {
    try {
      LocationPermission askpermission = await Geolocator.requestPermission();
      LocationPermission permission = await Geolocator.checkPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      langitutde = position.longitude;
    } catch (e) {
      print("errorrrrrrrrrrrr\n");
      print(e);
    }
  }
}
