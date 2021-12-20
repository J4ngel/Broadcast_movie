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

  void register() async {
    try {
      final User? user = (await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user;

      String nameUser = nameController.text;

      Map<String, String> users = {
        'name': nameUser,
        'email': user!.email!,
        'uid': user.uid
      };

      _ref.push().set(users);

      if (user != null) {
        success = true;
        print('register OK');
        Future.delayed(Duration(seconds: 2), () {
          Get.to(() => Login());
        });
        userEmail = user.email!;
      } else {
        success = false;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
            'Error', 'La contraseña proporcionada es demasiado débil.');
        return Future.error('La contraseña proporcionada es demasiado débil.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
            'Error', 'La cuenta ya existe para ese correo electrónico.');
        return Future.error('La cuenta ya existe para ese correo electrónico.');
      }
    }
  }
}
