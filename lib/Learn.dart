import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Learn extends StatefulWidget {
  @override
  _LearnState createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  TextEditingController video = TextEditingController();
  TextEditingController pic = TextEditingController();
  TextEditingController level = TextEditingController();

  int lenght = 0;
  String there = "";
  Color co;
  Icon ic;

  @override
  void initState() {
    // isThere(level.text).then((value) {
    //   setState(() {
    //     lenght = value;
    //     print(lenght);
    //   });
    // });
    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (there == "") {
      setState(() {
        co = Colors.amber;
        ic = Icon(Icons.desktop_mac);
      });
    } else if (there == "Yes") {
      setState(() {
        co = Colors.green;
        ic = Icon(Icons.check);
      });
    } else if (there == "No") {
      setState(() {
        co = Colors.red;
        ic = Icon(Icons.not_interested);
      });
    }

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
                controller: level,
                decoration: InputDecoration(
                  labelText: "Level",
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
                controller: video,
                decoration: InputDecoration(
                  labelText: "Video Url",
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
                controller: pic,
                decoration: InputDecoration(
                  labelText: "pic Url",
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
                  add(level.text).then((value) {
                    if (value == "Success") {
                      clear();
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
                  Text("Already There :  "),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: co,
                      child: ic,
                    ),
                  ),
                  RaisedButton(
                    child: Text("Check"),
                    onPressed: () {
                      setState(() {
                        there = "";
                      });
                      isThere(level.text).then((value) {
                        if (value != "") {
                          if (value == "Yes") {
                            print(value);
                            setState(() {
                              there = "Yes";
                            });
                          } else {
                            setState(() {
                              there = "No";
                            });
                          }
                        } else {
                          setState(() {
                            there = "";
                          });
                        }
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
  Future<int> isThere2() async {
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

  // Future<String> add({quotes, url}) async {
  //   String i;

  //   if (quotes == "" || url == "") {
  //     i = "Empty";
  //   } else {
  //     try {
  //       reference.document().setData({
  //         "quotes": quotes,
  //         "url": url,
  //       });
  //       i = "added";
  //     } catch (e) {
  //       print(e);
  //     }
  //   }

  //   return i;
  // }

  var referenceToLearn = Firestore.instance.collection("AllLevels");

  Future<String> add(level) async {
    String _mess;

    try {
      var abc = referenceToLearn
          .document("M5xgqSw5RA2VaBkQEP5N")
          .collection("Level-" + level)
          .document("learn")
          .collection("home")
          .document("home")
          .setData({"pic": pic.text, "video": video.text});
      print(abc);
      _mess = "Success";

      return _mess;
    } catch (e) {
      print("Error");
      _mess = "Failed";
      return _mess;
    }
  }

  void clear() {
    video.clear();
    pic.clear();
  }

  Future<String> isThere(_level) async {
    String mess;
    print(_level);

    if (_level != "") {
      print("Not null");
      try {
        QuerySnapshot learnDocument = await referenceToLearn
            .document("M5xgqSw5RA2VaBkQEP5N")
            .collection("Level-" + _level)
            .document("learn")
            .collection("home")
            .getDocuments();

        print(learnDocument.documents[0]['pic']);

        if (learnDocument.documents[0] == null) {
          mess = "No";
        } else {
          mess = "Yes";
        }
      } catch (e) {
        print("Error");
        mess = "No";
      }
    } else {
      mess = "No";
    }
    return mess;
  }
}
