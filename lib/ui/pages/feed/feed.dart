import 'package:broadcast_movie/controllers/theme_controller.dart';
import 'package:broadcast_movie/data/models/post_model.dart';
import 'package:broadcast_movie/data/services/post_service.dart';
import 'package:broadcast_movie/ui/pages/feed/widgets/feed_card.dart';
import 'package:broadcast_movie/ui/pages/status/mystatus.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedPage extends StatefulWidget {
  FeedPage({Key? key}) : super(key: key);
  final Post_service post_service = Post_service();
  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  ScrollController _scrollController = ScrollController();
  TextEditingController _post_controller = TextEditingController();

  //dataFeedUserTem List_feed = Get.find();
  @override
  Widget build(BuildContext context) {
    final ThemeController controller = Get.find();

    return Scaffold(
      backgroundColor: controller.darkMode
          ? const Color(0XFF262D31)
          : const Color(0XFFF8F9FA),
      body: Padding(
        padding: EdgeInsets.all(16),
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
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(controller.darkMode ? const Color(0xff085373) : const Color(0xff711A1A)),
                      ),
                      child: Text(
                        "Estados",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Get.to(() => StatusPage());
                      },
                    ),
                  ],
                ),
              ),
            ),
            
            _get_posts_list(),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: _post_controller,
                      onChanged: (text)=> setState((){}),
                      onSubmitted: (input){
                        _publish_post();
                      },
                      decoration: InputDecoration(
                        hintText: "Escribe aquí tu contenido :D..."
                      ),
                    )
                  )
                ),
                IconButton(
                  onPressed: (){
                    _publish_post();
                  }, 
                  icon: Icon((_post_controller.text.length > 0)?Icons.beenhere_rounded:Icons.beenhere_outlined)
                )
              ],
            )
          ],
        ),
      ),
    );
  }
   void _publish_post(){
    if(_post_controller.text.length > 0){
      final post = Post_model("Mi publicación", _post_controller.text, DateTime.now());
      widget.post_service.save_post(post);
      _post_controller.clear();
      setState(() {});
    }
  }

  Widget _get_posts_list(){
    return Expanded(
      child: FirebaseAnimatedList(
        controller: _scrollController,
        query: widget.post_service.get_posts(), 
        itemBuilder: (context, snapshot, animation, index){
          final json = snapshot.value as Map<dynamic,dynamic>;
          final post = Post_model.fromJson(json);
          return feed_card(user: post.user, post: post.post, date: post.date);
        }
      )
    );
  }

}


