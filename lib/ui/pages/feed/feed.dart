import 'package:broadcast_movie/controllers/feedUserController.dart';
import 'package:broadcast_movie/controllers/theme_controller.dart';
import 'package:broadcast_movie/data/models/feedUserModel.dart';
import 'package:broadcast_movie/ui/pages/status/mystatus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/feedList.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  dataFeedUserTem List_feed = Get.find();
  @override
  Widget build(BuildContext context) {
    final ThemeController controller = Get.find();

    return Scaffold(
      backgroundColor: controller.darkMode
          ? const Color(0XFF262D31)
          : const Color(0XFFF8F9FA),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Publicaciones",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: controller.darkMode
                              ? const Color(0xffFFFFFF)
                              : const Color(0xff262D31)),
                    ),
                    RaisedButton(
                      child: Text(
                        "Estados",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: controller.darkMode
                          ? const Color(0xff085373)
                          : const Color(0xff711A1A),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      onPressed: () {
                        Get.to(() => StatusPage());
                      },
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
              itemCount: List_feed.feedUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return FeedsList(
                  name: List_feed.feedUsers[index].name,
                  messageText: List_feed.feedUsers[index].messageText,
                  imageUrl: List_feed.feedUsers[index].imageURL,
                  time: List_feed.feedUsers[index].time,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
