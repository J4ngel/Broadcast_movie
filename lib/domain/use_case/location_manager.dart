import 'package:geolocator/geolocator.dart';
import 'package:broadcast_movie/data/services/geolocation_service.dart';

class Location_manager{
  final gps_service = Gps_service();

  Future<Position> get_current_location() async{
    return await gps_service.get_current_location();
  }
}