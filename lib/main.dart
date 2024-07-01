import 'dart:io';

import 'package:aldy/features/auth/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'features/main/presntation/screen/home_screen.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'aldy delivery',
      routes: {
        HomeScreen.routName: (context) => HomeScreen(),

      },
      theme: ThemeData(
           ),
      home: SplashScreen(),
    );
  }
}



class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

