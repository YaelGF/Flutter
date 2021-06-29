import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _contador = 56;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Incrmento",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),
          textScaleFactor: 2.5,
          maxLines: 3,
          textAlign: TextAlign.justify,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Center(
        child: Text(
          "EL valor inicial es $_contador",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),
          textScaleFactor: 2.5,
          maxLines: 3,
          textAlign: TextAlign.justify,
          overflow: TextOverflow.ellipsis,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          setState((){
            _contador++;
          });
        }
      ),
    );
  }
}