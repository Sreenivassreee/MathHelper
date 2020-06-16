import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WinnersPage extends StatefulWidget {
  @override
  _WinnersPageState createState() => _WinnersPageState();
}

class _WinnersPageState extends State<WinnersPage> {
  TextEditingController name = TextEditingController();
  TextEditingController posterUrl = TextEditingController();
  TextEditingController date = TextEditingController();

  int lenght = 0;

  @override
  void initState() {
    numberOfQuotes().then((value) {
      setState(() {
        lenght = value;
        print(lenght);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Motivation",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: posterUrl,
                decoration: InputDecoration(
                  labelText: "Poster Url",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.red,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                autocorrect: true,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.red,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                autocorrect: true,
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: date,
                decoration: InputDecoration(
                  labelText: "Date",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.red,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                autocorrect: true,
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                onPressed: () {
                  add(
                          name: name.text,
                          posterUrl: posterUrl.text,
                          date: date.text)
                      .then((value) {
                    if (value == "added") {
                      clear();
                      setState(() {
                        lenght++;
                      });
                    } else {
                      final snackBar = SnackBar(content: Text('Enter Fileds'));

                      Scaffold.of(context).showSnackBar(snackBar);

                      print(value);
                    }
                  });
                },
                color: Colors.green,
                child: Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                children: [
                  Text("No of Winners :  "),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.teal,
                      child: Text(
                        "$lenght",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  RaisedButton(
                    child: Text("Get"),
                    onPressed: () {
                      numberOfQuotes().then((value) {
                        setState(() {
                          lenght = value;
                          print(lenght);
                        });
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  var reference = Firestore.instance.collection("Winners");
  Future<int> numberOfQuotes() async {
    int i;
    try {
      QuerySnapshot documentSnapshot = await reference.getDocuments();

      i = documentSnapshot.documents.length;
      // print("Lenght is $i");
    } catch (e) {
      print(e);
    }
    return i;
  }

  Future<String> add({name, posterUrl, date}) async {
    String i;

    if (name == "" || posterUrl == "" || date == "") {
      i = "Empty";
    } else {
      try {
        reference.document().setData({
          "Name": name,
          "Poster url": posterUrl,
          "Date": date,
        });
        i = "added";
      } catch (e) {
        print(e);
      }
    }

    return i;
  }

  void clear() {
    name.clear();
    posterUrl.clear();
    date.clear();
  }
}
