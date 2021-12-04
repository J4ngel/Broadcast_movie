import 'package:broadcast_movie/ui/pages/near_me/near_me.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import '../chat/chat.dart';
import '../feed/feed.dart';

class NavagationBar extends StatefulWidget {
  const NavagationBar({Key? key}) : super(key: key);
  @override
  _NavagationBarState createState() => _NavagationBarState();
}

class _NavagationBarState extends State<NavagationBar> {
  int _paginaActual = 0;
  final List<Widget> _paginas = [
    const Home(),
    const ChatPage(),
    Near_me_page(),
    const FeedPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _paginas[_paginaActual],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _paginaActual = index;
          });
        },
        currentIndex: _paginaActual,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Principal',
              backgroundColor: Color(0xff085373)),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
              backgroundColor: Color(0xff085373)),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'Cerca de mi',
              backgroundColor: Color(0xff085373)),
          BottomNavigationBarItem(
              icon: Icon(Icons.groups_outlined),
              label: 'Feed',
              backgroundColor: Color(0xff085373)),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_movies_outlined),
              label: 'Otros',
              backgroundColor: Color(0xff085373)),
        ],
        selectedItemColor: Colors.white,
      ),
    );
  }
}
