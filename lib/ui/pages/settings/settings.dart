import 'package:broadcast_movie/controllers/login/loginController.dart';
import 'package:broadcast_movie/controllers/theme_controller.dart';
import 'package:broadcast_movie/ui/pages/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final ThemeController controller = Get.find();
  final controllerLogin = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: controller.darkMode
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
                          color: controller.darkMode
                              ? Colors.white
                              : Colors.black)),
                  IconButton(
                    icon: Obx(
                      () => Icon(
                        controller.darkMode
                            ? Icons.light_mode_rounded
                            : Icons.dark_mode_rounded,
                        color:
                            controller.darkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    onPressed: () => controller.darkMode = !controller.darkMode,
                  ),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              ElevatedButton(
                child: const Text(
                  "Cerrar sesión",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                style: ElevatedButton.styleFrom(
                    primary: controller.darkMode
                        ? const Color(0xff085373)
                        : const Color(0xff711A1A),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    fixedSize: const Size(250.0, 50.0)),
                onPressed: () {
                  controllerLogin.signOut();
                },
              ),
              // FlatButton(
              //   child: const Text('Sign out'),
              //   onPressed: () async {
              //     controllerLogin.signOut();
              //   },
              // )
            ],
          ),
        ));
  }
}
