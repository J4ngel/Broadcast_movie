import 'package:flutter/material.dart';
import 'home.dart';
import '../chat/chat.dart';

class NavagationBar extends StatefulWidget {
  const NavagationBar({Key? key}) : super(key: key);
  @override
  _NavagationBarState createState() => _NavagationBarState();
}

class _NavagationBarState extends State<NavagationBar> {
  int _paginaActual = 0;
  final List<Widget> _paginas = [const Home(), const ChatPage()];
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Principal'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
        ],
      ),
    );
  }
}
