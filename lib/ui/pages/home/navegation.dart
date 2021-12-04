import 'package:broadcast_movie/providers/theme.dart';
import 'package:broadcast_movie/ui/pages/near_me/near_me.dart';
import 'package:broadcast_movie/ui/pages/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    const FeedPage(),
    const SettingsPage()
  ];
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: _paginas[_paginaActual],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _paginaActual = index;
          });
        },
        currentIndex: _paginaActual,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Principal',
              backgroundColor: currentTheme.isDarkTheme()
                  ? Color(0xff085373)
                  : Color(0xff711A1A)),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
              backgroundColor: currentTheme.isDarkTheme()
                  ? Color(0xff085373)
                  : Color(0xff711A1A)),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'Cerca de mi',
              backgroundColor: currentTheme.isDarkTheme()
                  ? Color(0xff085373)
                  : Color(0xff711A1A)),
          BottomNavigationBarItem(
              icon: Icon(Icons.groups_outlined),
              label: 'Comunidad',
              backgroundColor: currentTheme.isDarkTheme()
                  ? Color(0xff085373)
                  : Color(0xff711A1A)),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Configuración',
              backgroundColor: currentTheme.isDarkTheme()
                  ? Color(0xff085373)
                  : Color(0xff711A1A)),
        ],
        selectedItemColor: Colors.white,
      ),
    );
  }
}
