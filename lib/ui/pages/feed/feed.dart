import 'package:broadcast_movie/models/feedUserModel.dart';
import 'package:broadcast_movie/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../feed/feedcard.dart';
import '../chat/widgets/feedList.dart';


class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<FeedUsers> feedUsers = [
    FeedUsers(
        name: "Tim Burton",
        messageText: "Watching Encanto",
        imageURL: "https://randomuser.me/api/portraits/men/10.jpg",
        time: "Now"),
    FeedUsers(
        name: "Edwin Reds",
        messageText: "James Bond!! the Best",
        imageURL: "https://randomuser.me/api/portraits/men/11.jpg",
        time: "35 min"),
    FeedUsers(
        name: "Edwin Reds",
        messageText: "James Bond!! the Best",
        imageURL: "https://randomuser.me/api/portraits/men/11.jpg",
        time: "35 min"),
    FeedUsers(
        name: "Edwin Reds",
        messageText: "James Bond!! the Best",
        imageURL: "https://randomuser.me/api/portraits/men/11.jpg",
        time: "35 min"),
  ];

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: currentTheme.isDarkTheme()
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
                      "Feed Publications",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: currentTheme.isDarkTheme()
                              ? const Color(0xffFFFFFF)
                              : const Color(0xff262D31)),
                    ),

                    /*Container(
                      padding:
                          EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: currentTheme.isDarkTheme()
                            ? const Color(0xff085373)
                            : const Color(0xff711A1A),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "My state",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    )*/
                  ],
                ),
              ),
            ),

           
            ListView.builder(
              itemCount: feedUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return FeedsList(
                  name: feedUsers[index].name,
                  messageText: feedUsers[index].messageText,
                  imageUrl: feedUsers[index].imageURL,
                  time: feedUsers[index].time,
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
