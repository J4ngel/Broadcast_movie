import 'package:geolocator/geolocator.dart';

class Gps_service{
  Future<Position> get_current_location() async {
    return await Geolocator.getCurrentPosition();
  }
}