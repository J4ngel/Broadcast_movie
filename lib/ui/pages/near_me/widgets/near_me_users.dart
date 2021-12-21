import 'package:broadcast_movie/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class Near_me_users extends StatelessWidget {
  String name;
  String latitude;
  String longitude;

  Near_me_users({
    required this.name,
    required this.latitude,
    required this.longitude
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20, top: 10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(controller.darkMode? const Color(0xff085373):const Color(0xff711A1A)),
        ),
        onPressed: (latitude.isNotEmpty && longitude.isNotEmpty)?()async{
          final url = "https://www.google.com/maps?q=${latitude},${longitude}";
          await launch(url);
        }:null, 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name,
            style:  TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.bold)
            ),
            Icon(Icons.place)
          ],
        )
      ),
    );
  }
}