import 'package:flutter/material.dart';
import 'screens/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Foodie",
      theme: ThemeData(
          primarySwatch: Colors.orange, backgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
