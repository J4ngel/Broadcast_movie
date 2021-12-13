import 'package:broadcast_movie/controllers/login/loginController.dart';
import 'package:broadcast_movie/controllers/theme_controller.dart';
import 'package:broadcast_movie/ui/pages/forgot_password/forgot_password.dart';
import 'package:broadcast_movie/ui/pages/home/navegation.dart';
import 'package:broadcast_movie/ui/pages/register/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _selected = true;
  final controllerLogin = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final ThemeController controller = Get.find();

    return Scaffold(
        backgroundColor: controller.darkMode
            ? const Color(0XFF262D31)
            : const Color(0XFFF8F9FA),
        body: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (_) {
              return SingleChildScrollView(
                  child: Column(children: [
                const SizedBox(height: 30),
                SizedBox(
                    height: 264.0,
                    width: 274.0,
                    child: controller.darkMode
                        ? Image.asset('assets/images/logo_dark.png',
                            fit: BoxFit.fill)
                        : Image.asset("assets/images/logo_light.png",
                            fit: BoxFit.fill)),
                const SizedBox(height: 30),
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
                      child: Form(
                        key: controllerLogin.formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  const Text(
                                    'Login',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 30.0),
                                  ),
                                  const SizedBox(width: 210),
                                  IconButton(
                                    icon: const Icon(
                                        Icons.highlight_off_outlined),
                                    tooltip: 'Close',
                                    onPressed: () {
                                      // ignore: todo
                                      // TODO: Return to initial page
                                      Get.back();
                                    },
                                    iconSize: 30.0,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            Padding(
                                padding: EdgeInsets.all(10.0),
                                child: TextFormField(
                                  controller: controllerLogin.emailController,
                                  validator: (String? value) {
                                    if (value!.isEmpty)
                                      return 'Please enter some text';
                                    return null;
                                  },
                                  autofocus: true,
                                  keyboardType: TextInputType.emailAddress,
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
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      hintText: 'example@mail.com'),
                                )),
                            Padding(
                                padding: EdgeInsets.all(10.0),
                                child: TextFormField(
                                  controller:
                                      controllerLogin.passwordController,
                                  validator: (String? value) {
                                    if (value!.isEmpty)
                                      return 'Please enter some text';
                                    return null;
                                  },
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
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      hintText: 'Enter secure password'),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Text(
                                      _selected
                                          ? "Remember me"
                                          : "Don't remember me",
                                      style:
                                          const TextStyle(color: Colors.white)),
                                  Checkbox(
                                    value: _selected,
                                    activeColor: controller.darkMode
                                        ? const Color(0xff085373)
                                        : const Color(0xff711A1A),
                                    // activeColor: const Color(0xffCC3333),
                                    side: const BorderSide(color: Colors.white),
                                    onChanged: (value) {
                                      setState(() {
                                        _selected = value!;
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 50),
                                  TextButton(
                                    onPressed: () {
                                      // ignore: todo
                                      // TODO FORGOT PASSWORD SCREEN GOES HERE
                                      Get.to(() => const ForgotPassword());
                                    },
                                    child: const Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
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
                              onPressed: () async {
                                _.signInWithEmailAndPassword();
                              },
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    // ignore: todo
                                    // TODO REGISTER SCREEN GOES HERE
                                    Get.to(() => const Register());
                                  },
                                  child: const Text(
                                    'New Here? Register!',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ))
              ]));
            }));
  }
}
