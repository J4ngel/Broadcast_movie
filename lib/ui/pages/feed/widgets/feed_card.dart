import 'package:broadcast_movie/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class feed_card extends StatelessWidget {
  String user;
  String post;
  DateTime date;
  
  feed_card({
    required this.user,
    required this.post,
    required this.date,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              child: Center(
                child: Icon(
                  Icons.account_circle,
                  size: 40,
                )
              )
            ),

            Expanded(child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(
                    DateFormat('kk:mma,dd-MM-yyyy').format(date).toString(), 
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
                    ),
                  Text(post)
                  ],
                ),
            )
            )
          ],
        ),
      ),
    );
  }
}