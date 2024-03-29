import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/controller/wallpaper_controller.dart';
import 'package:wallpaper_app/utils/route_utils.dart';
import 'package:wallpaper_app/views/screens/detail_page.dart';
import 'package:wallpaper_app/views/screens/home_Page.dart';
import 'package:wallpaper_app/views/screens/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => wallPaperController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      initialRoute: MyRoutes.Splash_screen,
      routes: {
        MyRoutes.Splash_screen: (context) => SplashScreen(),
        MyRoutes.HomePage: (context) => HomePage(),
        MyRoutes.Detail_Page: (context) => DetailPage(),
      },
    );
  }
}
