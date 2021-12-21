import 'package:broadcast_movie/controllers/theme_controller.dart';
import 'package:broadcast_movie/data/models/location_user_Model.dart';
import 'package:broadcast_movie/data/services/near_me_service.dart';
import 'package:broadcast_movie/domain/use_case/controllers/location_controller.dart';
import 'package:broadcast_movie/domain/use_case/controllers/permissions_controller.dart';
import 'package:broadcast_movie/domain/use_case/location_manager.dart';
import 'package:broadcast_movie/ui/pages/near_me/widgets/near_me_users.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Near_me_page extends StatefulWidget {
  Near_me_page({Key? key}) : super(key: key);
  final near_me_service = Near_me_service();
  @override
  State<Near_me_page> createState() => _Near_me_pageState();
}


class _Near_me_pageState extends State<Near_me_page> {
  late Permissions_controller permissions_controller;
  late Location_controller location_controller;
  late Location_manager location_manager;

  bool is_visible = false;
  Location_users_model my_info = Location_users_model(FirebaseAuth.instance.currentUser!.email!, '', '');

  @override
  void initState() {
    super.initState();
    permissions_controller = Get.find();
    location_controller = Get.find();
    location_manager = Location_manager();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeController controller = Get.find();
    return Scaffold(
        appBar: AppBar(
          title: Text("Cerca de mi"),
          /* actions: [
            Container(
                padding: EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.map))
                  ],
                ))
          ], */
          centerTitle: true,
          backgroundColor: controller.darkMode
              ? const Color(0xff085373)
              : const Color(0xff711A1A),
        ),
        backgroundColor: controller.darkMode
            ? const Color(0XFF262D31)
            : const Color(0XFFCFCFCF),
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
            location_controller.location.value = null;
            if(permissions_controller.location_grated){
              final position = await location_manager.get_current_location();
              location_controller.location.value = position;

              final location = Location_users_model(FirebaseAuth.instance.currentUser!.email!, "${position.latitude}", "${position.longitude}");
              widget.near_me_service.save_near_me(location);
              setState(() {
                is_visible = !is_visible;
                my_info.latitude = "${position.latitude}";
                my_info.longitude = "${position.longitude}";
              });
            }
          },
          child: Icon(Icons.gps_fixed), //assignment_ind
          backgroundColor: controller.darkMode
              ? const Color(0xff085373)
              : const Color(0xff711A1A),
          tooltip: "Muestra tu ubicación al final de la lista",
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _get_near_me_users(),
            Visibility(
              visible: is_visible,
              child: Near_me_users(name: my_info.name, latitude: my_info.latitude, longitude: my_info.longitude)
            )
          ],
        ));
  }
  Widget _get_near_me_users(){
    return Expanded(
      child: FirebaseAnimatedList(
        query: widget.near_me_service.get_near_me(), 
        itemBuilder: (context, snapshot, animation, index){
          final json = snapshot.value as Map<dynamic, dynamic>;
          final location = Location_users_model.fromJson(json);
          return Visibility(
            visible: FirebaseAuth.instance.currentUser!.email! != location.name,
            child: Near_me_users(name: location.name, latitude: location.latitude, longitude: location.longitude)
            );
        }
      )
    );
  }
}
