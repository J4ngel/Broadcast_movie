import 'package:broadcast_movie/controllers/near_me_controller.dart';
import 'package:broadcast_movie/providers/theme.dart';
import 'package:broadcast_movie/ui/pages/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'controllers/chatDetailController.dart';
import 'controllers/chatUserController.dart';
import 'ui/pages/home/navegation.dart';

void main() {
  Get.put(dataChatUserTemp());
  Get.put(data_location_temp());
  Get.put(dataChatDetail());
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
        ),
      ),
    );
  }
}
