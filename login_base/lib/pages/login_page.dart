import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(children:[
        _formularioLogin(),
      ],)
    );
  }

  Widget _formularioLogin(){
  return ListView(
    padding: EdgeInsets.symmetric(horizontal:10),
    children:[
      Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text ("Email"),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          controller: _emailcontroller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "email"
          ),
        ),
      ),Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text ("Password"),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: TextField(
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          controller: _passwordcontroller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "password"
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical : 10),
        child: ElevatedButton(
          child: Container(
            child: Text("Login"),
          ),
          onPressed: _loginButton,
        ),
      ),
    ]
  );
  }

  void _loginButton(){
    print(_emailcontroller.text);
    print(_passwordcontroller.text);
  }
}