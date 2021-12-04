import 'package:broadcast_movie/controllers/near_me_controller.dart';
import 'package:broadcast_movie/models/Location_user_Model.dart';
import 'package:broadcast_movie/providers/theme.dart';
import 'package:broadcast_movie/ui/pages/near_me/widgets/location_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class Near_me_page extends StatefulWidget {
  Near_me_page({Key? key}) : super(key: key);

  @override
  State<Near_me_page> createState() => _Near_me_pageState();
}

class _Near_me_pageState extends State<Near_me_page> {
  bool is_visible = false;
  location_users my_info = location_users(name: "Andrés Rivera", address: "Cll 23 No 45-30");
  data_location_temp List_users = Get.find();

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Cerca de mi"),
        actions:[
          Container(
            padding: EdgeInsets.only(right: 20),
            child:Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.refresh)),
                IconButton(onPressed: (){}, icon: Icon(Icons.map))
              ],
            )
          )
        ],
        centerTitle: true,
        backgroundColor: currentTheme.isDarkTheme()
          ? const Color(0xff085373)
          : const Color(0xff711A1A),
      ),

      backgroundColor: currentTheme.isDarkTheme()
        ? const Color(0XFF262D31) 
        : const Color(0XFFCFCFCF),

      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          is_visible = !is_visible;
        });
      },
      child: Icon(Icons.gps_fixed), //assignment_ind
      backgroundColor: currentTheme.isDarkTheme()
          ? const Color(0xff085373)
          : const Color(0xff711A1A),
      tooltip: "Muestra tu ubicación al final de la lista",
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Obx(()=> ListView.builder(
                itemCount: List_users.data_temp.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16, left: 40, right: 40),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return location_list(
                    name: List_users.data_temp[index].name,
                    address: List_users.data_temp[index].address
                  );
                },
              ),
            ),

            Visibility(
              visible: is_visible,  
              child: Container(
                padding: EdgeInsets.only(left: 48, right: 48, top: 10, bottom: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              padding:EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25), 
                                color: currentTheme.isDarkTheme() 
                                  ? Color(0xff50879E)
                                  :Color(0xffB44646)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    my_info.name,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: const Color(0xffFFFFFF),
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    "Dirección: "+my_info.address,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: const Color(0xffFFFFFF)
                                    ),
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
      )
    );
  }
}