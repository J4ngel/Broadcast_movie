import 'package:broadcast_movie/providers/theme.dart';
import 'package:broadcast_movie/ui/pages/chat/screens/chatDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedsList extends StatefulWidget {
  String name;
  String messageText;
  String imageUrl;
  String time;
  bool isMessageRead;
  FeedsList(
      {required this.name,
      required this.messageText,
      required this.imageUrl,
      required this.time,
      required this.isMessageRead});
  @override
  _FeedsListState createState() => _FeedsListState();
}

class _FeedsListState extends State<FeedsList> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: () {
        /* Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChatDetailPage();
        })); */
      },
      // ignore: duplicate_ignore, duplicate_ignore, duplicate_ignore
      child: Container(
        // ignore: prefer_const_constructors
        padding: EdgeInsets.only(left: 16, right: 16, top: 1, bottom: 1),
        child: Center(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://randomuser.me/api/portraits/men/11.jpg"),
                    maxRadius: 30,
                  ),
                  title: Text("Lina Jutinico"),
                  subtitle: Text(
                      'Ayer fue a ver Encanto con mi hijo y me parecio excelente pelicula, fue my divertido .'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text('Like'),
                      onPressed: () {/* ... */},
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      child: const Text('Comment'),
                      onPressed: () {/* ... */},
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
        ),

        /* Row(
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
                                color: currentTheme.isDarkTheme()
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
                                color: currentTheme.isDarkTheme()
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
                  color: currentTheme.isDarkTheme()
                      ? const Color(0xffFFFFFF)
                      : const Color(0xff262D31)),
            ),
          ],
        ),*/
      ),
    );
  }
}
