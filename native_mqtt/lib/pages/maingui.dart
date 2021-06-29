import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'mqtt_stream.dart';
import 'Adafruit_feed.dart';

class MqttGui extends StatefulWidget {
  MqttGui({Key key}) : super(key: key);

  @override
  _MqttGuiState createState() => _MqttGuiState();
}

class _MqttGuiState extends State<MqttGui> {
  AppMqttTransactions myMQTT = AppMqttTransactions();
  final topicController = TextEditingController();
  final valueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
	    resizeToAvoidBottomInset:false,
	    appBar: AppBar(
		    title: Text("Conexion a Adafruit"),
		    centerTitle: true,
	    ),
      body: _body(),
    );
  }
  Widget _body(){
    return Column(
      children:[
        _subscriptionData(),
        SizedBox(
          height:10
        ),
        _viewData(),
        SizedBox(
          height:10
        ),
        _publishData()
      ],
    );
  }
  Widget _subscriptionData(){
	  return Container(
      margin: EdgeInsets.fromLTRB(20,50,20,20),
      child: Column(
        children:[
          Row(
            children:[
              Text(
                "Feed/Topic",
                style:TextStyle(fontSize: 20, color: Colors.black),
              ),
              Flexible (child: 
                TextField(
                  controller: topicController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Nombre del Feed/Topic"		
                  )
                )
              ),
            ]  
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: (){suscribir(topicController.text);},
            child: Text("Suscribete"),
            color: Colors.redAccent,
            textColor: Colors.white,
          ),
          SizedBox(
            height: 20,
          ),
          Text("Valor Recibido del feed:")
        ]
      ) 
    );
  }

  Widget _viewData(){
   return StreamBuilder(
    stream: AdafruitFeed.sensorStream,
    builder: (context, snapshot){
     String lectura = snapshot.data;
     if(lectura == null){
      lectura = "No hay valor recibido";
     }
     return Text(lectura);
    }
   ); 
  }
  Widget _publishData(){
   return Container(
    margin: EdgeInsets.fromLTRB(20,50,20,20),
    child: Column(
     children: [
      Row(
       children:[
        Text("Valor: ",
          style: TextStyle(fontSize:20,color: Colors.black),
        ),
        Flexible(
         child: 
          TextField(
           controller:valueController,
           textCapitalization: TextCapitalization.characters,
           decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Valor para publicar al topic"
           ),
          )
        ),
       ],
      ),
      SizedBox(
       height:20,
      ),
      MaterialButton(
       onPressed: (){publish(topicController.text, valueController.text);},
       color: Colors.redAccent,
       textColor: Colors.white,
       child:  Text("Enviar a Adafruit"),
      ),
     ],
    ),
   );
  }
 void suscribir(String feed){
  myMQTT.subscribe(feed);
 }
 void publish(String feed, String value){
  myMQTT.publish(feed,value);
 }
}
