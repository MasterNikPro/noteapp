import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notev2/scr/appbars.dart';
import 'colors.dart';
import 'variables.dart';

class newpagemaking extends StatefulWidget {
  const newpagemaking({Key? key}) : super(key: key);

  @override
  _newpagemakingState createState() => _newpagemakingState();
}

class _newpagemakingState extends State<newpagemaking> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tContr.clear();
    dContr.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      appBar: newnotebar(context),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: tContr,
              style: TextStyle(
                fontSize: 35,
                color: grey,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                labelText: "Title",
                labelStyle: TextStyle(
                  fontSize: 35,
                  color: grey,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: dContr,
              style: TextStyle(
                fontSize: 25,
                color: grey,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                labelText: "Information",
                labelStyle: TextStyle(
                  fontSize: 25,
                  color: grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
