import 'package:broadcast_movie/controllers/login/loginController.dart';
import 'package:broadcast_movie/controllers/login/resetPasswordController.dart';
import 'package:broadcast_movie/controllers/theme_controller.dart';
import 'package:broadcast_movie/ui/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // final controllerLogin = Get.put(LoginController());
  TextEditingController emailcontroller = TextEditingController();
  ResetPasswordController resetController = ResetPasswordController();

  @override
  Widget build(BuildContext context) {
    final ThemeController controller = Get.find();
    return Scaffold(
        backgroundColor: controller.darkMode
            ? const Color(0XFF262D31)
            : const Color(0XFFF8F9FA),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              const SizedBox(height: 150),
              Icon(
                Icons.lock_outlined,
                size: 200,
                color: controller.darkMode
                    ? Colors.white
                    : const Color(0xff711A1A),
              ),
              const SizedBox(height: 50),
              Text(
                '¿Olvidaste tu contraseña?',
                style: TextStyle(
                    color: controller.darkMode
                        ? Colors.white
                        : const Color(0xff711A1A),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Ingresa tu correo para reestablecer tu contraseña.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: controller.darkMode
                        ? Colors.white
                        : const Color(0xff711A1A),
                    fontSize: 15.0),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: emailcontroller,
                  cursorColor: controller.darkMode
                      ? Colors.white
                      : const Color(0xff711A1A),
                  style: TextStyle(
                    color: controller.darkMode
                        ? Colors.white
                        : const Color(0xff711A1A),
                  ),
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: controller.darkMode
                            ? Colors.white
                            : const Color(0xff711A1A),
                      )),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: controller.darkMode
                            ? Colors.white
                            : const Color(0xff711A1A),
                      )),
                      labelText: 'Correo',
                      labelStyle: TextStyle(
                        color: controller.darkMode
                            ? Colors.white
                            : const Color(0xff711A1A),
                      ),
                      hintText: 'ejemplo@correo.com'),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                child: const Text(
                  "Enviar",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                style: ElevatedButton.styleFrom(
                    primary: controller.darkMode
                        ? const Color(0xff085373)
                        : const Color(0xff711A1A),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    // padding: const EdgeInsets.all(10),
                    fixedSize: const Size(250.0, 50.0)),
                onPressed: () {
                  if (emailcontroller.text.isNotEmpty) {
                    resetController.resetPassword(
                        context, emailcontroller.text);
                  } else {
                    resetController.errorbox(
                        context, 'Los campos no pueden estar vacios');
                  }
                },
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Get.offNamed('/login');
                },
                child: Text(
                  'Cancelar',
                  style: TextStyle(
                      color: controller.darkMode
                          ? const Color(0xff085373)
                          : const Color(0xff711A1A),
                      fontSize: 15),
                ),
              ),
              const SizedBox(height: 20)
            ]),
          ),
        ));
  }
}
