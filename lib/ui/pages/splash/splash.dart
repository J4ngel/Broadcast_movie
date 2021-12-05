import 'package:broadcast_movie/ui/pages/login/login.dart';
import 'package:broadcast_movie/providers/theme.dart';
import 'package:provider/provider.dart';
import 'package:broadcast_movie/ui/pages/register/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
        backgroundColor: currentTheme.isDarkTheme()
            ? const Color(0XFF262D31)
            : const Color(0XFFF8F9FA),
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 30),
            SizedBox(
                height: 264.0,
                width: 274.0,
                child: DecoratedBox(
                    decoration: const BoxDecoration(),
                    child: currentTheme.isDarkTheme()
                        ? Image.asset('assets/images/logo_dark.png',
                            fit: BoxFit.fill)
                        : Image.asset("assets/images/logo_light.png",
                            fit: BoxFit.fill))),
            const SizedBox(height: 30),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Welcome!',
                style: TextStyle(
                    color: currentTheme.isDarkTheme()
                        ? Colors.white
                        : const Color(0xff711A1A),
                    fontSize: 30.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: currentTheme.isDarkTheme()
                        ? Colors.white
                        : const Color(0xff711A1A),
                    fontSize: 20.0),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              child: const Text(
                "Register",
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
                Get.to(() => const Register());
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text(
                "Login",
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
                Get.to(() => const Login());
              },
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 20)
          ]),
        ));
  }
}
