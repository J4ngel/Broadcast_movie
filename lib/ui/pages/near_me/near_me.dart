import 'package:broadcast_movie/controllers/near_me_controller.dart';
import 'package:broadcast_movie/controllers/theme_controller.dart';
import 'package:broadcast_movie/data/models/location_user_Model.dart';
import 'package:broadcast_movie/domain/use_case/controllers/location_controller.dart';
import 'package:broadcast_movie/domain/use_case/controllers/permissions_controller.dart';
import 'package:broadcast_movie/domain/use_case/location_manager.dart';
import 'package:broadcast_movie/ui/pages/near_me/widgets/location_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Near_me_page extends StatefulWidget {
  Near_me_page({Key? key}) : super(key: key);

  @override
  State<Near_me_page> createState() => _Near_me_pageState();
}


class _Near_me_pageState extends State<Near_me_page> {
  late Permissions_controller permissions_controller;
  late Location_controller location_controller;
  late Location_manager location_manager;

  bool is_visible = false;
  location_users my_info = location_users(name: "Andrés Rivera", address: "Cll 23 No 45-30");
  data_location_temp List_users = Get.find();

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
              print("Hola");
              final position = await location_manager.get_current_location();
              location_controller.location.value = position;
              //Get.snackbar('Tu ubicación es:','Latitud ${position.latitude} - Longitud ${position.longitude}');
              setState(() {
                is_visible = !is_visible;
                my_info.address = "Latitud: ${position.latitude} - Longitud: ${position.longitude}";
              });
            }
          },
          child: Icon(Icons.gps_fixed), //assignment_ind
          backgroundColor: controller.darkMode
              ? const Color(0xff085373)
              : const Color(0xff711A1A),
          tooltip: "Muestra tu ubicación al final de la lista",
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Obx(
                () => ListView.builder(
                  itemCount: List_users.data_temp.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 16, left: 40, right: 40),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return location_list(
                        name: List_users.data_temp[index].name,
                        address: List_users.data_temp[index].address);
                  },
                ),
              ),
              Visibility(
                visible: is_visible,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 48, right: 48, top: 10, bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: controller.darkMode
                                        ? Color(0xff50879E)
                                        : Color(0xffB44646)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      my_info.name,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: const Color(0xffFFFFFF),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "Dirección: " + my_info.address,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: const Color(0xffFFFFFF)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
