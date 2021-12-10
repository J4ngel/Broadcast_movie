import 'package:broadcast_movie/data/models/location_user_Model.dart';
import 'package:get/get.dart';

class data_location_temp extends GetxController {
  List<location_users> data_temp = [
    location_users(name: "Alejandro Angarita", address: "Calle 15 No.4-14"),
    location_users(name: "Angelica Pardo", address: "Calle 6 No.12-24"),
    location_users(name: "Juan Guerrero", address: "Carrera 15 No.6-4"),
    location_users(name: "Daniela Paez", address: "Calle 9 No.1-3"),
    location_users(name: "Santiago Moreno", address: "Calle 7 No.7-16"),
  ].obs;
}
