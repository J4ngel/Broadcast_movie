import 'package:broadcast_movie/ui/pages/login/login.dart';
import 'package:broadcast_movie/ui/pages/register/register.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        const SizedBox(height: 30),
        SizedBox(
            height: 264.0,
            width: 274.0,
            child: DecoratedBox(
                decoration: const BoxDecoration(),
                child: Image.asset('assets/images/logo_light.png',
                    fit: BoxFit.fill))),
        const SizedBox(height: 30),
        const Text(
          'Welcome!',
          style: TextStyle(
              // fontWeight: FontWeight.bold,
              color: Color(0xff711A1A),
              fontSize: 30.0),
        ),
        const SizedBox(height: 30),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."',
            textAlign: TextAlign.center,
            style: TextStyle(
                // fontWeight: FontWeight.bold,
                color: Color(0xff711A1A),
                fontSize: 20.0),
          ),
        ),
        const SizedBox(height: 50),
        Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
              color: const Color(0xff711A1A),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white)),
          child: TextButton(
            onPressed: () {
              // ignore: todo
              // TODO: Redirect to register page
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Register()));
            },
            child: const Text(
              'Register',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xff711A1A))),
          child: TextButton(
            onPressed: () {
              // ignore: todo
              // TODO: Redirect to login page
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login()));
            },
            child: const Text(
              'Login',
              style: TextStyle(color: Color(0xff711A1A), fontSize: 20),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const SizedBox(height: 20)
      ]),
    ));
  }
}
