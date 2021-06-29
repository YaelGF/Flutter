import 'package:demo_flutter/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: 'home',
      routes: <String, WidgetBuilder>{
        'home' : (BuildContext context) => HomePage(),
      }
    );
  }
}