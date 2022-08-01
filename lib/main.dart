import 'package:flutter/material.dart';
import 'package:notev2/scr/appbars.dart';
import 'package:notev2/scr/colors.dart';
import 'package:notev2/scr/dbhelper.dart';
import 'package:notev2/scr/newnote.dart';
import 'package:notev2/scr/watchpage.dart';
import 'package:path/path.dart';
import 'scr/homepage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    DatabaseHelper.db.gdatabase;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      title: 'NoteApplication',
      routes: <String, WidgetBuilder>{
        'homepage': (context) =>  homepage(),
        'newnote': (context) =>  newpagemaking(),
        'watchpage':(context)=>  watchpage(),
      },
      home: homepage(),
    );
  }
}
/*
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      title: 'NoteApplication',
      routes: <String, WidgetBuilder>{
        'homepage': (context) => new homepage(),
        'newnote': (context) => new newpagemaking(),
        'watchpage':(context)=> new watchpage(),
      },
      home: homepage(),
    );
  }
}
*/


