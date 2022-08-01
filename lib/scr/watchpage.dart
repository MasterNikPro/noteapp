import 'package:flutter/material.dart';
import 'package:notev2/scr/appbars.dart';
import 'package:notev2/scr/dbhelper.dart';
import 'colors.dart';
import 'variables.dart';

class watchpage extends StatefulWidget {
  const watchpage({Key? key}) : super(key: key);

  @override
  _watchpageState createState() => _watchpageState();
}

class _watchpageState extends State<watchpage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      appBar: watchbar(context),
      body:Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller:tContr ,
              style: TextStyle(fontSize: 35,color: grey,),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                labelText:"Title",
                labelStyle: TextStyle(fontSize: 35,color: grey,),
              ),


            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
            controller: dContr,
            style: TextStyle(fontSize: 25,color: grey,),
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              labelText:"Information",
              labelStyle: TextStyle(fontSize: 25,color: grey,),
            ),
          ),),
        ],
      ),
    );
  }
}
