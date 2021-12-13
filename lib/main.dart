import 'package:broadcast_movie/controllers/feedUserController.dart';
import 'package:broadcast_movie/controllers/near_me_controller.dart';
import 'package:broadcast_movie/controllers/statusUserController.dart';
import 'package:broadcast_movie/ui/pages/splash/splash.dart';
import 'package:broadcast_movie/ui/theme/theme_management.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/chatDetailController.dart';
import 'controllers/chatUserController.dart';
import 'controllers/theme_controller.dart';

void main() async {
  Get.put(dataChatUserTemp());
  Get.put(data_location_temp());
  Get.put(dataChatDetail());
  Get.put(dataStatusUserTemp());
  Get.put(dataFeedUserTem());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final ThemeController controller = Get.put(ThemeController());
  // Theme management
  late final ThemeManager manager = ThemeManager();
  bool isLoaded = false;

  Future<void> initializeTheme() async {
    controller.darkMode = await manager.storedTheme;
    setState(() => isLoaded = true);
  }

  @override
  void initState() {
    ever(controller.reactiveDarkMode, (bool isDarkMode) {
      manager.changeTheme(isDarkMode: isDarkMode);
    });
    initializeTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'broadcast company',
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
