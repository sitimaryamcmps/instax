import 'package:flutter/material.dart';
import 'dart:async';
import 'package:instax_19552011050_uts/dashboard/dashboard.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return DashBoard();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Center(
        child: Image.asset(
          "images/fujifilm.png",
          width: 200.0,
          height: 100.0,
        ),
      ),
      persistentFooterButtons: [
        Container(
          width: 900,
          child: const Text(
            'Made With ❤ | © 2021 Siti Maryam',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
