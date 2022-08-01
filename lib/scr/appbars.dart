import 'package:flutter/material.dart';
import 'package:notev2/scr/variables.dart';
import 'colors.dart';
import 'dataclass.dart';
import 'dbhelper.dart';
import 'package:share/share.dart';

AppBar homepagebar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: dark,
    elevation: 0,
    title: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 0),
          child: Text(
            "Notes",
            style: TextStyle(fontSize: 72, color: light),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 35),
          alignment: Alignment.bottomLeft,
          child: Text(
            "Never Settle",
            style: TextStyle(fontSize: 10, color: light),
          ),
        ),
      ],
    ),
    actions: [
    ],
  );
}

AppBar newnotebar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: dark,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        size: 35,
        color: coral,
      ),
      onPressed: () {
        Navigator.pushNamed(context, "homepage");
      },
    ),
    actions: [
      IconButton(
          onPressed: () async {
            templist = await DatabaseHelper.db.getl();
            //tempdata=templist![identificator!];
            tempdata = Data(
                id: templist!.length + 1,
                title: tContr.text,
                text: dContr.text);
            await DatabaseHelper.db.insert(tempdata!);
            Navigator.pushNamed(context, "homepage");
          },
          icon: Icon(
            Icons.check,
            color: grey,
            size: 35,
          )),
      IconButton(
          onPressed: () async{
            /*share(context,tContr.text+'\n'+dContr.text);*/
            await Share.share(tContr.text+"\n"+dContr.text);
          },
          icon: Icon(
            Icons.share,
            color: grey,
            size: 35,
          )),
    ],
  );
}

AppBar watchbar(BuildContext context){
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: dark,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        size: 35,
        color: coral,
      ),
      onPressed: () {
        Navigator.pushNamed(context, "homepage");
      },
    ),
    actions: [
      IconButton(
          onPressed: () async {
            templist = await DatabaseHelper.db.getl();
            tempdata=templist![identificator!];
            tempdata!.title=tContr.text;
            tempdata!.text=dContr.text;
            await DatabaseHelper.db.update(tempdata!);
            Navigator.pushNamed(context, "homepage");
          },
          icon: Icon(
            Icons.check,
            color: grey,
            size: 35,
          )),
      IconButton(
          onPressed: ()async {

            await Share.share(tContr.text+"\n"+dContr.text);
          },
          icon: Icon(
            Icons.share,
            color: grey,
            size: 35,
          )),
    ],
  );
}
