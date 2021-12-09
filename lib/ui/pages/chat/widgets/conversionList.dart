import 'package:broadcast_movie/controllers/theme_controller.dart';
import 'package:broadcast_movie/ui/pages/chat/screens/chatDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConversationList extends StatefulWidget {
  String name;
  String messageText;
  String imageUrl;
  String time;
  bool isMessageRead;
  ConversationList(
      {required this.name,
      required this.messageText,
      required this.imageUrl,
      required this.time,
      required this.isMessageRead});
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    final ThemeController controller = Get.find();
    return GestureDetector(
      onTap: () {
        Get.to(() => ChatDetailPage());
      },
      // ignore: duplicate_ignore, duplicate_ignore, duplicate_ignore
      child: Container(
        // ignore: prefer_const_constructors
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.imageUrl),
                    maxRadius: 30,
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name,
                            style: TextStyle(
                                fontSize: 16,
                                color: controller.darkMode
                                    ? const Color(0xffFFFFFF)
                                    : const Color(0xff262D31)),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            widget.messageText,
                            style: TextStyle(
                                fontSize: 13,
                                color: controller.darkMode
                                    ? const Color(0xffFFFFFF)
                                    : const Color(0xff262D31),
                                fontWeight: widget.isMessageRead
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.time,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: widget.isMessageRead
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: controller.darkMode
                      ? const Color(0xffFFFFFF)
                      : const Color(0xff262D31)),
            ),
          ],
        ),
      ),
    );
  }
}
