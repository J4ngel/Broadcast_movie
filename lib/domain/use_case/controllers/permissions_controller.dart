import 'package:get/get.dart';
import 'package:broadcast_movie/domain/use_case/permission_manager.dart';

class Permissions_controller extends GetxController{
  final _location = false.obs;
  late Permission_manager _manager;

  set permissions_manager(Permission_manager manager){
    _manager = manager;
    _init_permissions(manager);
  }

  set gps_permission(bool grated){
    _location.value = grated;
  }

  bool get location_grated => _location.value;

  Permission_manager get manager => _manager;

  _init_permissions(Permission_manager manager) async{
    _location.value = await _manager.request_gps_permission();
  } 
}