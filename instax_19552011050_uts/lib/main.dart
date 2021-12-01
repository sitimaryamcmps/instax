import 'package:flutter/material.dart';
import 'package:instax_19552011050_uts/dashboard/dashboard.dart';
import 'package:instax_19552011050_uts/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final MaterialColor _primarySwatch = const MaterialColor(
    0XFFFFFFFF,
    <int, Color>{
      50: Color(0XFFFFFFFF),
      100: Color(0XFFFFFFFF),
      200: Color(0XFFFFFFFF),
      300: Color(0XFFFFFFFF),
      400: Color(0XFFFFFFFF),
      500: Color(0XFFFFFFFF),
      600: Color(0XFFFFFFFF),
      700: Color(0XFFFFFFFF),
      800: Color(0XFFFFFFFF),
      900: Color(0XFFFFFFFF),
    },
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instax-SM',
      theme: ThemeData(
        primarySwatch: _primarySwatch,
      ),
      home: SplashScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/dashboard':
            return MaterialPageRoute(
              builder: (_) {
                return const DashBoard();
              },
            );
          default:
        }
      },
    );
  }
}
