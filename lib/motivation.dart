import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Motivation extends StatefulWidget {
  @override
  _MotivationState createState() => _MotivationState();
}

class _MotivationState extends State<Motivation> {
  TextEditingController quotes = TextEditingController();
  TextEditingController url = TextEditingController();
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
                controller: url,
                decoration: InputDecoration(
                  labelText: "Url",
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
                height: 20,
              ),
              TextField(
                controller: quotes,
                decoration: InputDecoration(
                  labelText: "Quotes",
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
                  add(quotes: quotes.text, url: url.text).then((value) {
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
                  Text("No of Quotes :  "),
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

  var reference = Firestore.instance.collection("Motivation");
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

  Future<String> add({quotes, url}) async {
    String i;

    if (quotes == "" || url == "") {
      i = "Empty";
    } else {
      try {
        reference.document().setData({
          "quotes": quotes,
          "url": url,
        });
        i = "added";
      } catch (e) {
        print(e);
      }
    }

    return i;
  }

  void clear() {
    quotes.clear();
    url.clear();
  }
}
