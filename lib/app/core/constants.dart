import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFF7B067F);
const TextStyle kAppBarText = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25, letterSpacing: 1, fontFamily: 'Fritz', shadows: [
  Shadow(
    color: Colors.black,
    offset: Offset(2, 3),
    blurRadius: 10,
  )
]);

const TextStyle kInputMenuText = TextStyle(
  shadows: [
    Shadow(
      color: Colors.black,
      offset: Offset(2, 3),
      blurRadius: 4,
    )
  ],
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
const TextStyle kresultText = TextStyle(
  shadows: [
    Shadow(
      color: Colors.black,
      offset: Offset(2, 3),
      blurRadius: 4,
    )
  ],
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
const double kAppBarHeight = 80;

const String kLogoImage = 'images/logo.png';
