import 'package:broadcast_movie/ui/pages/home/navegation.dart';
import 'package:broadcast_movie/ui/pages/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Example code of how to sign in with email and password.
  void signInWithEmailAndPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user!;
      Get.snackbar('${user.email}', 'inició sesión');
      print('Ingreso bien');
      // print('${user.email}');
      // print('${user}');
      Future.delayed(Duration(seconds: 2), () {
        Get.offNamed('/navagationBar');
      });
    } catch (e) {
      Get.snackbar('Error. Intente de nuevo',
          'Correo electrónico y/o contraseña incorrectos.');
    }
  }

  void _signOut() async {
    await _auth.signOut();
  }

  void signOut() async {
    final User? user = await _auth.currentUser;

    if (user == null) {
      Get.snackbar('Out', 'Nadie ha iniciado sesión.',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    _signOut();
    final String uid = user.uid;
    Get.snackbar('${user.email}', 'ha cerrado sesión correctamente',
        snackPosition: SnackPosition.BOTTOM);
    Get.offNamed('/splash');
  }

  // // reset password
  // void resetPassword(context, email) async {
  //   try {
  //     await _auth
  //         .sendPasswordResetEmail(email: email)
  //         .then((value) => {Get.offNamed('/login')});
  //     Get.snackbar(
  //         'Correo Enviado', 'Revise su correo para reestablecer contraseña.',
  //         snackPosition: SnackPosition.TOP);
  //   } catch (e) {
  //     Get.snackbar('Error. Intente de nuevo', 'Correo electrónico incorrecto');
  //   }
  // }
}
