import 'package:broadcast_movie/controllers/near_me_controller.dart';
import 'package:broadcast_movie/providers/theme.dart';
// import 'package:animated_splash/animated_splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'ui/pages/home/navegation.dart';
// import 'ui/pages/splash/splash.dart';
import 'ui/pages/login/login.dart';
import 'ui/pages/register/register.dart';
import 'ui/pages/splash/splash.dart';

void main(){
  Get.put(data_location_temp());
  runApp(const MyApp());
  }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeChangeProvider = ThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.setTheme =
        await themeChangeProvider.themePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: themeChangeProvider,
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'broadcast company',
        home: Scaffold(
          body: SplashScreen(),
          // body: Login(),
          // body: Register(),
          // body: NavagationBar(),
        ),
      ),
    );
  }
}
