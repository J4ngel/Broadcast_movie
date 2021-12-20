import 'package:broadcast_movie/controllers/theme_controller.dart';
import 'package:broadcast_movie/ui/pages/near_me/near_me.dart';
import 'package:broadcast_movie/ui/pages/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    ChatPage(),
    Near_me_page(),
    FeedPage(),
    const SettingsPage()
  ];
  @override
  Widget build(BuildContext context) {
    final ThemeController controller = Get.find();
    return Obx(() => Scaffold(
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
                  backgroundColor: controller.darkMode
                      ? Color(0xff085373)
                      : Color(0xff711A1A)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: 'Chat',
                  backgroundColor: controller.darkMode
                      ? Color(0xff085373)
                      : Color(0xff711A1A)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.location_on),
                  label: 'Cerca de mi',
                  backgroundColor: controller.darkMode
                      ? Color(0xff085373)
                      : Color(0xff711A1A)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.groups_outlined),
                  label: 'Comunidad',
                  backgroundColor: controller.darkMode
                      ? Color(0xff085373)
                      : Color(0xff711A1A)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Configuración',
                  backgroundColor: controller.darkMode
                      ? Color(0xff085373)
                      : Color(0xff711A1A)),
            ],
            selectedItemColor: Colors.white,
          ),
        ));
  }
}
