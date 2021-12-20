import 'package:permission_handler/permission_handler.dart';

class Permission_manager{
  Future<bool> gps_permission() async{
    var status = await Permission.location.status;
    return status.isGranted;
  }

  Future<bool> request_gps_permission() async{
    var status = await Permission.location.request();
    return status.isGranted;
  }
}