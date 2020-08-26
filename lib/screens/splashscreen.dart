import 'package:flutter/material.dart';
import 'package:foodie/screens/aftersplashscreen.dart';
import 'package:foodie/widgets/button.dart';

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
        child: Column(children: <Widget>[
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Spacer(),
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
                      splashTile(
                          context,
                          "Daddy's Kitchen",
                          "Welcome to Daddys Kitchen",
                          "assets/daddys.png"),
                      splashTile(
                          context,
                          "Daddy's Kitchen",
                          "Stay home, stay safe, enjoy food",
                          "assets/daddys.png"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(2, (index) => dots(index: index)),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: costumButton(
                      context,
                      "Get Started",
                      AfterSplashScreen(),
                      double.infinity,
                      Colors.orange,
                      Colors.white70,
                      50.0),
                ),
              ],
            ),
          ),
          Spacer(),
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
                  color: Colors.orange[400],
                  fontSize: 30,
                  fontWeight: FontWeight.w800),
            )),
        SizedBox(
          height: 10,
        ),
        Align(
            alignment: Alignment.topCenter,
            child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  title,
                  style: TextStyle(color: Colors.grey[400], fontSize: 18),
                ))),
        Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: MediaQuery.of(context).size.width * 0.5,
              margin: EdgeInsets.only(
                top: 30,
                left: 30,
                right: 30,
              ),
              child: Image.asset(
                img,
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
        color: currentPage == index ? Colors.orange : Colors.grey[400],
        borderRadius: BorderRadius.circular(3)),
  );
}
