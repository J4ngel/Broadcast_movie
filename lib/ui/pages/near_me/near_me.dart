import 'package:broadcast_movie/models/Location_user_Model.dart';
import 'package:broadcast_movie/providers/theme.dart';
import 'package:broadcast_movie/ui/pages/near_me/widgets/location_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Near_me_page extends StatefulWidget {
  Near_me_page({Key? key}) : super(key: key);

  @override
  State<Near_me_page> createState() => _Near_me_pageState();
}

class _Near_me_pageState extends State<Near_me_page> {
  List<location_users> List_users = [
    location_users(
      name: "Alejandro Angarita",
      address: "Calle 15 No.4-14"),
    location_users(
      name: "Angelica Pardo",
      address: "Calle 6 No.12-24"),
    location_users(
      name: "Juan Guerrero",
      address: "Carrera 15 No.6-4"),
    location_users(
      name: "Daniela Paez",
      address: "Calle 9 No.1-3"),
    location_users(
      name: "Santiago Moreno",
      address: "Calle 7 No.7-16"),
  ];

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Cerca de mi"),
            SizedBox(width: 50),
            IconButton(onPressed: (){}, icon: Icon(Icons.refresh))
          ],
        ),
        centerTitle: true,
        backgroundColor: currentTheme.isDarkTheme()
          ? const Color(0xff085373)
          : const Color(0xff711A1A),
      ),

      backgroundColor: currentTheme.isDarkTheme()
        ? const Color(0XFF262D31)
        : const Color(0XFFF8F9FA),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListView.builder(
              itemCount: List_users.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16, left: 40, right: 40),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return location_list(
                  name: List_users[index].name,
                  address: List_users[index].address
                );
              },
            ),
          ],
        ),
      )
    );
  }
}
