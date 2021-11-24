import 'package:broadcast_movie/models/theme_preferences.dart';
import 'package:broadcast_movie/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
        backgroundColor: currentTheme.isDarkTheme()
            ? const Color(0XFF262D31)
            : const Color(0XFFF8F9FA),
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              const Text('Material App Bar'),
              Container(
                margin: const EdgeInsets.only(
                  left: 150.0,
                ),
                child: Switch(
                    value: currentTheme.isDarkTheme(),
                    onChanged: (value) {
                      String newTheme =
                          value ? ThemePreference.DARK : ThemePreference.LIGHT;
                      currentTheme.setTheme = newTheme;
                    }),
              )
            ],
          ),
          backgroundColor: currentTheme.isDarkTheme()
              ? const Color(0xff085373)
              : const Color(0xff711A1A),
        ),
        body: Center(
          child: Text(
            'Home',
            style: TextStyle(
              fontSize: 24,
              color: currentTheme.isDarkTheme()
                  ? const Color(0xffFFFFFF)
                  : const Color(0xff262D31),
            ),
          ),
        ));
  }
}
