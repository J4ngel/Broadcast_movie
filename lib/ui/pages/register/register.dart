import 'package:broadcast_movie/controllers/theme_controller.dart';
import 'package:broadcast_movie/ui/pages/home/navegation.dart';
import 'package:broadcast_movie/ui/pages/login/login.dart';
import 'package:broadcast_movie/ui/pages/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // bool _selected = true;
  @override
  Widget build(BuildContext context) {
    final ThemeController controller = Get.find();
    return Scaffold(
        backgroundColor: controller.darkMode
            ? const Color(0XFF262D31)
            : const Color(0XFFF8F9FA),
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 20),
            SizedBox(
                height: 264.0,
                width: 274.0,
                child: DecoratedBox(
                    decoration: const BoxDecoration(),
                    child: controller.darkMode
                        ? Image.asset('assets/images/logo_dark.png',
                            fit: BoxFit.fill)
                        : Image.asset("assets/images/logo_light.png",
                            fit: BoxFit.fill))),
            const SizedBox(height: 20),
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: controller.darkMode
                        ? const Color(0xff085373)
                        : const Color(0xff711A1A),
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                // transform: Matrix4.rotationZ(0.05),
                child: SizedBox(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              const Text(
                                'Register',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30.0),
                              ),
                              const SizedBox(width: 170),
                              IconButton(
                                icon: const Icon(Icons.highlight_off_outlined),
                                tooltip: 'Close',
                                onPressed: () {
                                  // ignore: todo
                                  // TODO: Return to initial page
                                  Get.to(() => const SplashScreen());
                                },
                                iconSize: 30.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: TextField(
                              cursorColor: Color(0xffCC3333),
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  labelText: 'Full Name',
                                  labelStyle: TextStyle(color: Colors.white),
                                  hintText: 'example@mail.com'),
                              // onChanged: (text) {
                              //   print('$text');
                              // }
                            )),
                        const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: TextField(
                              cursorColor: Color(0xffCC3333),
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  labelText: 'Email',
                                  labelStyle: TextStyle(color: Colors.white),
                                  hintText: 'example@mail.com'),
                            )),
                        const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: TextField(
                              obscureText: true,
                              cursorColor: Color(0xffCC3333),
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(color: Colors.white),
                                  hintText: 'Enter secure password'),
                            )),
                        const SizedBox(height: 50),
                        ElevatedButton(
                          child: const Text(
                            "Register",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: controller.darkMode
                                  ? const Color(0xff085373)
                                  : const Color(0xff711A1A),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side: const BorderSide(color: Colors.white),
                              padding: const EdgeInsets.all(10),
                              fixedSize: const Size(250.0, 50.0)),
                          onPressed: () {
                            Get.to(() => const NavagationBar());
                          },
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                // ignore: todo
                                // TODO Login SCREEN GOES HERE
                                Get.to(() => const Login());
                              },
                              child: const Text(
                                'Already a Member? Login!',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ]),
                ))
          ]),
        ));
    ;
  }
}
