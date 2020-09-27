import 'package:flutter/material.dart';
import 'package:foodie/controller/cartcontroller.dart';
import 'package:provider/provider.dart';
import 'screens/splashscreen.dart';

void main() {

  runApp(ChangeNotifierProvider(
      create: (context) => CartController(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Daddys Kitchen",
      theme: ThemeData(
          primarySwatch: Colors.red,
          appBarTheme: AppBarTheme(iconTheme: IconThemeData(color:Colors.black))
          ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
