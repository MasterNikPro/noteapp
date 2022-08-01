import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notev2/scr/dbhelper.dart';
import 'package:notev2/scr/variables.dart';
import 'colors.dart';
import 'dataclass.dart';

class futurelist extends StatefulWidget {
  const futurelist({Key? key}) : super(key: key);

  @override
  _futurelistState createState() => _futurelistState();
}

class _futurelistState extends State<futurelist> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void printall() async {
    List<Data> dtest;
    dtest = await DatabaseHelper.db.getl();
    print('////');
    for (int i = 0; i < dtest.length; i++) {
      print("title:" +
          dtest[i].title.toString() +
          "id:" +
          dtest[i].id.toString() +
          "\n");
    }
    print("////");
  }

  @override  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DatabaseHelper.db.getl(),
      builder: (BuildContext context, AsyncSnapshot<List<Data>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(backgroundColor: Colors.green.withOpacity(0.0),);
        } else {
          if (snapshot.hasData && snapshot.requireData.length != 0) {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) async {
                      await DatabaseHelper.db.delete(snapshot.data![index].id!);
                      print("index:" + index.toString());
                      printall();
                      setState(() {
                        snapshot.data!.removeAt(index);
                      });
                    },
                    child: GestureDetector(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        height: 50,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 30),
                          child: Text(
                            snapshot.data![index].title.toString(),
                            style: TextStyle(
                              fontSize: 35,
                              color: grey,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        identificator = index;
                        tContr.text = snapshot.data![index].title.toString();
                        dContr.text = snapshot.data![index].text.toString();

                        Navigator.pushNamed(context, "watchpage");

                        //print(index.toString() + " is taped");
                      },
                    ));
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            );
          } else {
            Future.delayed(Duration(seconds: 1)).then((value) {
              setState(() {});
            });
            return Center(
              child: Text(
                "Add new note",
                style: TextStyle(fontSize: 60, color: grey),
              ),
            );
          }
        }
      },
    );
  }
}
