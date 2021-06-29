import 'package:flutter/material.dart';
import 'package:login_base/pages/home_page.dart';
import 'package:login_base/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'login' : (BuildContext context) => LoginPage()
      },
    );
  }
}
