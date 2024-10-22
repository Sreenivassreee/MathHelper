import 'package:flutter/material.dart';
import 'package:math_helper/Questions/112,113.dart';

class MyHomaPage extends StatefulWidget {
  @override
  _MyHomaPageState createState() => _MyHomaPageState();
}

class _MyHomaPageState extends State<MyHomaPage> {
  TextEditingController level = TextEditingController();
  @override
  void initState() {
    Additions.abc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SteveBrains"),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image.asset(
                "assets/images/Brains.png",
                fit: BoxFit.cover,
              ),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text('Motivation Quotes'),
              onTap: () {
                Navigator.of(context).pushNamed(
                  "/Motivation",
                );
              },
            ),
            ListTile(
              title: Text('Learn Before Start'),
              onTap: () {
                Navigator.of(context).pushNamed(
                  "/Learn",
                );
              },
            ),
            ListTile(
              title: Text('Winners'),
              onTap: () {
                Navigator.of(context).pushNamed(
                  "/WinnersPage",
                );
              },
            ),
            ListTile(
              title: Text('EarnAds'),
              onTap: () {
                Navigator.of(context).pushNamed(
                  "/EarnAds",
                );
              },
            ),
            ListTile(
              title: Text('LevelDetails'),
              onTap: () {
                Navigator.of(context).pushNamed(
                  "/LevelDetails",
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 500,
                child: TextField(
                  controller: level,
                  onSubmitted: (l) {
                    if (level != "") {
                      Navigator.of(context).pushNamed(
                        "/EnterQuestions",
                        arguments: int.parse(level.text),
                      );
                    }
                    level.clear();
                  },
                  decoration: InputDecoration(
                    labelText: "Level Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.red,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  autocorrect: true,
                  maxLength: 5,
                ),
              ),
              Container(
                child: RaisedButton(
                  onPressed: () {
                    if (level != "") {
                      Navigator.of(context).pushNamed(
                        "/EnterQuestions",
                        arguments: int.parse(level.text),
                      );
                    }
                    level.clear();
                  },
                  color: Colors.red,
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
