import 'dart:async';

import 'package:diet_app/home.dart';
import 'package:diet_app/login.dart';
import 'package:diet_app/navigator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  // Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      // home: NavigatorWidget(),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // checkLoginStatus();
    // _getUserInfo();
    Timer(
        Duration(
            seconds:
                3), // Set the duration for how long the splash screen should be displayed
        () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                LoginScreen()), // Replace HomeScreen with your desired main screen after the splash screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Image.asset(
              'assets/diet.png',
              height: 200,
              width: 200,
            ),
            Text(
              "Diet Plan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ), // Replace 'splash.png' with the actual image file name
      ),
    );
  }
}
