import 'package:broadcast_movie/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class card_movie extends StatelessWidget {
  String? img;
  String? title;
  String? year;
  String? info;
  
  card_movie({
    required this.img,
    required this.title,
    required this.year,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController controller = Get.find();
    
    return Card(
      color: controller.darkMode?
              const Color(0XFFCFCFCF)
              :Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(img.toString()),
              width: 120,
              height: 200,
              fit: BoxFit.fill,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(child: CircularProgressIndicator());}
              ),

            Expanded(child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(year.toString(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text(info.toString())],
                ),
            )
            ), 
            //IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye))
          ],
        ),
      ),
    );
  }
}