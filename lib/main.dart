
import 'dart:convert';

import 'package:flutter/material.dart';
 import 'package:http/http.dart' as http;

 main() {
   runApp(MyApp());

 }

 class MyApp extends StatefulWidget {
   @override
   _MyAppState createState() => _MyAppState();
 }
 
 class _MyAppState extends State<MyApp> {

   @override
  void initState() 
  {
    
    super.initState();
    fetchdata();
  }
List convertdata=[];
Future fetchdata() async
{
var response=await http.get("http://newsapi.org/v2/everything?q=bitcoin&from=2020-01-22&sortBy=publishedAt&apiKey=d6813f30acc2434d9516bfd5da8cfeb2");

var data=json.decode(response.body);

setState(() {
  convertdata=data['articles'];
});
print(response.body);
}

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       theme: ThemeData.dark(),
       home: Scaffold(appBar: AppBar(title: Text("News App"),),
       body: ListView.builder(
         itemCount: convertdata.length,
         itemBuilder: (context,int index)
       {
         return
          Column(
            children: <Widget>[
              Image.network(convertdata[index]['urlToImage'])
            ,
            Text(convertdata[index]['title'],style: TextStyle(fontSize: 20),)
            ,
            Text(convertdata[index]['publishedAt'],style: TextStyle(fontSize: 20),)
            
            ],
          );

       })
       ),
     );
   }
 }