// ignore_for_file: annotate_overrides

import 'package:broadcast_movie/ui/pages/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginRegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _ref =
      FirebaseDatabase.instance.reference().child('Users');

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  late bool success;
  late String userEmail;

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  void register(context, email, password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          )
          .then((value) => {Get.offNamed('/login')});
      success = true;
      Get.snackbar('Registro exitoso', 'Usuario registrado exitosamente');
    } catch (e) {
      if (emailController.text.isEmpty) {
        errorbox(context, 'Campo correo vacío');
      } else if (passwordController.text.isEmpty) {
        errorbox(context, 'Campo contraseña vacío');
      } else if (passwordController.text.length < 6) {
        errorbox(context, 'La contraseña debe tener al menos 6 caracteres');
      }
    }
  }

  void errorbox(context, e) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(e.toString()),
            elevation: 24.0,
          );
        });
  }
}
