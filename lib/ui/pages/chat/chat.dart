import 'package:broadcast_movie/controllers/ChatController.dart';
import 'package:broadcast_movie/controllers/theme_controller.dart';
import 'package:broadcast_movie/data/models/chat/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

final databaseReference = FirebaseDatabase.instance.reference();

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late TextEditingController _controller;
  late ScrollController _scrollController;
  ChatController chatController = Get.put(ChatController());
  final ThemeController controller = Get.find();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _scrollController = ScrollController();
    chatController.start();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    chatController.stop();
    super.dispose();
  }

  Widget _item(Message element, int posicion, String uid) {
    logInfo('Current user? -> ${uid == element.user} msg -> ${element.text}');
    return Container(
      margin: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: uid == element.user
            ? controller.darkMode
                ? const Color(0xff085373)
                : const Color(0xff711A1A)
            : controller.darkMode
                ? const Color(0xff131C21)
                : const Color(0xff990000),
      ),
      padding: EdgeInsets.all(5),
      child: ListTile(
        title: Text(
          element.mail + '\n\n' + element.text,
          textAlign: uid == element.user ? TextAlign.right : TextAlign.left,
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }

  Widget _list() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    print('Current user $uid');
    return GetX<ChatController>(builder: (controller) {
      WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToEnd());
      return ListView.builder(
        itemCount: chatController.messages.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          var element = chatController.messages[index];
          return _item(element, index, uid);
        },
      );
    });
  }

  Future<void> _sendMsg(String text) async {
    //FocusScope.of(context).requestFocus(FocusNode());
    logInfo("Calling _sendMsg with $text");
    await chatController.sendMsg(text);
  }

  Widget _textInput() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            margin: const EdgeInsets.only(left: 10.0, top: 5.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Write message...",
                  hintStyle: TextStyle(
                      color: controller.darkMode
                          ? const Color(0xffFFFFFF)
                          : const Color(0xff262D31)),
                  border: InputBorder.none),
              onSubmitted: (value) {
                _sendMsg(_controller.text);
                _controller.clear();
              },
              controller: _controller,
            ),
          ),
        ),
        /* TextButton(
            child: Text('Send'),
            onPressed: () {
              _sendMsg(_controller.text);
              _controller.clear();
            }) */

        Container(
          margin: EdgeInsets.all(5.0),
          child: FloatingActionButton(
            onPressed: () {
              _sendMsg(_controller.text);
              _controller.clear();
            },
            child: Icon(
              Icons.send,
              color: Colors.white,
              size: 18,
            ),
            backgroundColor: controller.darkMode
                ? const Color(0xff085373)
                : const Color(0xff711A1A),
            elevation: 0,
          ),
        )
      ],
    );
  }

  _scrollToEnd() async {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    String? email = FirebaseAuth.instance.currentUser!.email;
    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToEnd());
    return Scaffold(
      backgroundColor: controller.darkMode
          ? const Color(0XFF262D31)
          : const Color(0XFFCFCFCF),
      appBar: AppBar(
        backgroundColor: controller.darkMode
            ? const Color(0xff085373)
            : const Color(0xff711A1A),
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png"),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        email!,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xffFFFFFF)),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                            color: const Color(0xffFFFFFF), fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [Expanded(flex: 4, child: _list()), _textInput()],
        ),
      ),
    );
  }
}
