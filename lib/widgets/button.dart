import 'package:flutter/material.dart';

Widget costumButton(context, text, route, width, btnColor, textColor, height) {
  return Container(
    decoration:
        BoxDecoration(color: btnColor, borderRadius: BorderRadius.circular(25)),
    height: height,
    width: width,
    child: FlatButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return route;
          }));
        },
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 20),
        )),
  );
}
