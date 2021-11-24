import 'package:broadcast_movie/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/pages/home/navegation.dart';

void main() => runApp(const MyApp());

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
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'broadcast company',
        home: Scaffold(
          body: NavagationBar(),
        ),
      ),
    );
  }
}
