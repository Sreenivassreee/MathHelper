import 'package:flutter/material.dart';
import 'package:math_helper/QuestionsEnterPage.dart';
import 'package:math_helper/motivation.dart';

class MyHomaPage extends StatefulWidget {
  @override
  _MyHomaPageState createState() => _MyHomaPageState();
}

class _MyHomaPageState extends State<MyHomaPage> {
  TextEditingController level = TextEditingController();
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
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
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
