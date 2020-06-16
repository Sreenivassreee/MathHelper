import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EarnAds extends StatefulWidget {
  @override
  _EarnAdsState createState() => _EarnAdsState();
}

class _EarnAdsState extends State<EarnAds> {
  TextEditingController sDate = TextEditingController();
  TextEditingController posterUrl = TextEditingController();
  TextEditingController eDate = TextEditingController();

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
          "EarnAds",
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
                controller: sDate,
                decoration: InputDecoration(
                  labelText: "Start Date",
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
                controller: eDate,
                decoration: InputDecoration(
                  labelText: "End Date",
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
                          sDate: sDate.text,
                          posterUrl: posterUrl.text,
                          eDate: eDate.text)
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
                  Text("No of Ads :  "),
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

  var reference = Firestore.instance.collection("EarnAds");
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

  Future<String> add({sDate, posterUrl, eDate}) async {
    String i;

    if (sDate == "" || posterUrl == "" || eDate == "") {
      i = "Empty";
    } else {
      try {
        reference.document().setData({
          "sDate": sDate,
          "Poster url": posterUrl,
          "eDate": eDate,
        });
        i = "added";
      } catch (e) {
        print(e);
      }
    }

    return i;
  }

  void clear() {
    sDate.clear();
    posterUrl.clear();
    eDate.clear();
  }
}
