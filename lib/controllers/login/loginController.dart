import 'package:broadcast_movie/ui/pages/home/navegation.dart';
import 'package:broadcast_movie/ui/pages/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
      Get.snackbar('${user.email}', 'signed in');
      print('Ingreso bien');
      Future.delayed(Duration(seconds: 2), () {
        Get.to(() => NavagationBar());
      });
    } catch (e) {
      Get.snackbar('fallo', 'Failed to sign in with Email & Password');
    }
  }

  void _signOut() async {
    await _auth.signOut();
  }

  void signOut() async {
    final User? user = await _auth.currentUser;

    if (user == null) {
      Get.snackbar('Out', 'No one has signed in.',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    _signOut();
    final String uid = user.uid;
    Get.snackbar('Out', uid + 'has successfully signed out',
        snackPosition: SnackPosition.BOTTOM);
    Get.to(() => SplashScreen());
  }
}
