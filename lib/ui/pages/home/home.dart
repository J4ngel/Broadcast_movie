import 'package:broadcast_movie/controllers/theme_controller.dart';
import 'package:broadcast_movie/ui/pages/home/widgets/card_movie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final ThemeController controller = Get.find();
    return Scaffold(
        backgroundColor: controller.darkMode
            ? const Color(0XFF262D31)
            : const Color(0XFFF8F9FA),
        appBar: AppBar(
          title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Broadcast',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: controller.darkMode ? Colors.white : Colors.black),
                ),
                Text('movie',
                    style: TextStyle(
                        color:
                            controller.darkMode ? Colors.white : Colors.black))
              ]),
          leading: controller.darkMode
              ? Image.asset("assets/images/logo_dark.png")
              : Image.asset("assets/images/logo_light.png"),
          backgroundColor: controller.darkMode
              ? const Color(0XFF262D31)
              : const Color(0XFFF8F9FA),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    prefixIcon: Icon(Icons.search,
                        color: Colors.grey.shade600, size: 20),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: controller.darkMode
                                ? Colors.grey.shade100
                                : Color(0xff711A1A)))),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView(
                  children: [
                    card_movie(
                        img: "url",
                        title: "title",
                        year: "year",
                        info:
                            "infoadsaisodjaosjidaoisjdoasjdoaijsdoiajsoidjaosidjasiojdoiasjdoi"),
                    card_movie(
                        img: "url", title: "title", year: "year", info: "info"),
                    card_movie(
                        img: "url",
                        title: "title",
                        year: "year",
                        info:
                            "infoadsaisodjaosjidaoisjdoasjdoaijsdoiajsoidjaosidjasiojdoiasjdoi"),
                    card_movie(
                        img: "url", title: "title", year: "year", info: "info"),
                    card_movie(
                        img: "url",
                        title: "title",
                        year: "year",
                        info:
                            "infoadsaisodjaosjidaoisjdoasjdoaijsdoiajsoidjaosidjasiojdoiasjdoi"),
                    card_movie(
                        img: "url", title: "title", year: "year", info: "info")
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
