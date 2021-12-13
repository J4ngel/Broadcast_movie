import 'package:broadcast_movie/ui/pages/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginRegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late bool success;
  late String userEmail;

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void register() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    ))
        .user;
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
  }
}
