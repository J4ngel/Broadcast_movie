import 'package:broadcast_movie/models/theme_preferences.dart';
import 'package:broadcast_movie/providers/theme.dart';
import 'package:broadcast_movie/ui/pages/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: currentTheme.isDarkTheme()
          ? const Color(0XFF262D31)
          : const Color(0XFFF8F9FA),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Cambiar tema',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: currentTheme.isDarkTheme()
                          ? Colors.white
                          : Colors.black)),
              Switch(
                  value: currentTheme.isDarkTheme(),
                  onChanged: (value) {
                    String newTheme =
                        value ? ThemePreference.DARK : ThemePreference.LIGHT;
                    currentTheme.setTheme = newTheme;
                  })
            ],
          ),
          const SizedBox(
            height: 50.0,
          ),
          ElevatedButton(
            child: const Text(
              "Iniciar sesión",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            style: ElevatedButton.styleFrom(
                primary: currentTheme.isDarkTheme()
                    ? const Color(0xff085373)
                    : const Color(0xff711A1A),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(10),
                fixedSize: const Size(250.0, 50.0)),
            onPressed: () {
              Get.to(() => const SplashScreen());
            },
          ),
        ],
      ),
    );
  }
}
