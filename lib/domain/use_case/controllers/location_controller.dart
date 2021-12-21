import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class Location_controller extends GetxController{
  final location = Rx<Position?>(null);
}