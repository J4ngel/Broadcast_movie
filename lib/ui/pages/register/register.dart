import 'package:broadcast_movie/controllers/login/loginRegisterController.dart';
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
  final controllerRegister = Get.put(LoginRegisterController());
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
                    child: GetBuilder<LoginRegisterController>(
                  init: LoginRegisterController(),
                  builder: (_) {
                    return Form(
                      key: controllerRegister.formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Registrarse',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30.0),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                        Icons.highlight_off_outlined),
                                    tooltip: 'Close',
                                    onPressed: () {
                                      // ignore: todo
                                      // TODO: Return to initial page
                                      Get.offNamed('/splash');
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
                                  keyboardType: TextInputType.name,
                                  autofocus: true,
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
                                      labelText: 'Nombre',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      hintText: 'Sócrates'),
                                  // onChanged: (text) {
                                  //   print('$text');
                                  // }
                                )),
                            Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                  controller:
                                      controllerRegister.emailController,
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: const Color(0xffCC3333),
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      labelText: 'Correo',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      hintText: 'ejemplo@correo.com'),
                                )),
                            Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                  controller:
                                      controllerRegister.passwordController,
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: true,
                                  cursorColor: const Color(0xffCC3333),
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      labelText: 'Constraseña',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      hintText: 'Enter secure password'),
                                )),
                            const SizedBox(height: 50),
                            ElevatedButton(
                              child: const Text(
                                "Registrarse",
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
                                _.register();
                              },
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    // ignore: todo
                                    // TODO Login SCREEN GOES HERE
                                    Get.offNamed('/login');
                                  },
                                  child: const Text(
                                    '¿Ya tienes una cuenta? ¡Inicia sesión!',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                          ]),
                    );
                  },
                )))
          ]),
        ));

    ;
  }
}
