import 'package:flutter/material.dart';
import 'package:foodie/screens/loginscreen.dart';
import 'package:foodie/widgets/button.dart';
import 'package:foodie/config/config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

int currentPage = 0;

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(children: <Widget>[
          SizedBox(height: 80),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            height: MediaQuery.of(context).size.height * 0.5,
            child: PageView(
              physics: PageScrollPhysics(),
              pageSnapping: false,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              scrollDirection: Axis.horizontal,
              children: [
                splashTile(context, "Daddy's Kitchen",
                    "Welcome to Daddys Kitchen", "assets/daddys.png"),
                splashTile(context, "Daddy's Kitchen",
                    "Stay home, stay safe, enjoy food", "assets/daddys.png"),
              ],
            ),
          ),
          Container(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (index) => dots(index: index)),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: costumButton(context, "Get Started", LoginScreen(),
                double.infinity, Color(0xFFBF1C2E), Colors.white, 50.0),
          ),
          SizedBox(height: 30),
        ]),
      ),
    );
  }
}

Widget splashTile(context, name, title, img) {
  return Container(
    child: Column(
      children: [
        Align(
            alignment: Alignment.topCenter,
            child: Text(
              name,
              style: TextStyle(
                  color: mainColor, fontSize: 25, fontWeight: FontWeight.w800),
            )),
        SizedBox(height: 10),
        Align(
            alignment: Alignment.topCenter,
            child: Container(
                child: Text(
              title,
              style: TextStyle(color: Colors.grey[500], fontSize: 16),
            ))),
        SizedBox(height: 30),
        Align(
            alignment: Alignment.topCenter,
            child: Container(
              child: Image.asset(
                img,
                height: 200,
                width: 250,
              ),
            )),
      ],
    ),
  );
}

AnimatedContainer dots({int index}) {
  return AnimatedContainer(
    duration: Duration(seconds: 1),
    margin: EdgeInsets.only(right: 5),
    height: 6,
    width: currentPage == index ? 20 : 6,
    decoration: BoxDecoration(
        color: currentPage == index ? mainColor : Colors.grey[400],
        borderRadius: BorderRadius.circular(3)),
  );
}
