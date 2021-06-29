import 'package:flutter/material.dart';
import 'package:native_mqtt/pages/maingui.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      darkTheme: ThemeData(
      ),
      initialRoute: 'home',
      routes: <String, WidgetBuilder>{
        'home' : (BuildContext context) => MqttGui(),
      }
    );
  }
}