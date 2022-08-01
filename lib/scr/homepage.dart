import 'package:flutter/material.dart';
import 'package:notev2/scr/appbars.dart';
import 'package:notev2/scr/widgets.dart';
import 'colors.dart';
import 'appbars.dart';
class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homepagebar(),
      backgroundColor: dark,
      body: futurelist(),

      floatingActionButton: FloatingActionButton(
        backgroundColor: dark,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Color.fromRGBO(255, 103, 104, 1),
                width: 2,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          //buff = data.length + 1;
          Navigator.pushNamed(context, "newnote");
        },
        child: Icon(
          Icons.add,
          color: coral,
        ),
      ),
    );
  }
}
