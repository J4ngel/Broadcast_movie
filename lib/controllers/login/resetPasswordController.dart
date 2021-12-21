// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // reset password
  void resetPassword(context, email) async {
    try {
      await auth
          .sendPasswordResetEmail(email: email)
          .then((value) => {Get.offNamed('/login')});
      Get.snackbar(
          'Correo Enviado', 'Revise su correo para reestablecer contraseña.',
          snackPosition: SnackPosition.TOP);
    } catch (e) {
      // Get.snackbar('Error. Intente de nuevo', 'Correo electrónico incorrecto');
      errorbox(context, e);
    }
  }

  void errorbox(context, e) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(e.toString()),
          );
        });
  }
}
