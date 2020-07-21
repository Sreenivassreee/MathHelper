import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_helper/Data/LevelDetails.dart';

class LevelDetails extends StatefulWidget {
  @override
  _LevelDetailsState createState() => _LevelDetailsState();
}

class _LevelDetailsState extends State<LevelDetails> {
  TextEditingController id = TextEditingController();

  TextEditingController level = TextEditingController();

  TextEditingController title = TextEditingController();

  TextEditingController message = TextEditingController();

  TextEditingController ex = TextEditingController();

  int currentLevel = 0;
  int havingLevels = 0;
  static var havingLevelFromFire = "-";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "havingLevels ::        $havingLevels",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      RaisedButton(
                        child: Text("Get"),
                        onPressed: () {
                          numberOfQuestions().then((value) {
                            setState(() {
                              havingLevels = value;
                              currentLevel = havingLevels + 1;

                              id.text = currentLevel.toString();
                            });
                          });
                        },
                      ),
                      Text(
                        "Current Level ::        $currentLevel",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                  child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 1,
                          child: TextField(
                            controller: id,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "id",
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
                        ),
                        Flexible(
                          flex: 1,
                          child: TextField(
                            controller: id,
                            keyboardType: TextInputType.number,
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
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: title,
                    decoration: InputDecoration(
                      labelText: "title",
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
                  SizedBox(height: 20),
                  TextField(
                    controller: message,
                    decoration: InputDecoration(
                      labelText: "Message",
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
                  SizedBox(height: 20),
                  TextField(
                    controller: ex,
                    decoration: InputDecoration(
                      labelText: "Ex",
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
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: RaisedButton(
                          onPressed: () async {
                            if (id != null &&
                                level != null &&
                                title != null &&
                                message != null &&
                                ex != null) {
                              await fireUpdaeLevelDetails(
                                id: int.parse(id.text),
                                level: id.text,
                                title: title.text,
                                message: message.text,
                                ex: ex.text,
                              ).then((value) {
                                print("value $value");
                                if (value == "Su") {
                                  clear();
                                  setState(() {
                                    currentLevel++;
                                    id.text = currentLevel.toString();

                                    // alreadyQuestions++;
                                  });
                                }
                              });
                            } else {
                              print("Level Detail Fields Are Null");
                            }

                            setState(() {});
                          },
                          color: Colors.green,
                          child: Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: RaisedButton(
                          onPressed: () async {
                            // await fireUpdaeScore(
                            //   level: level,
                            //   question: question.text,
                            //   answer: answer.text,
                            //   ia1: iAnswer1.text,
                            //   ia2: iAnswer2.text,
                            //   ia3: iAnswer3.text,
                            // ).then((value) {
                            //   print("value $value");

                            //   if (value == "Su") {
                            //     setState(() {
                            //       currentQuestion = 1;
                            //       alreadyQuestions = 0;
                            //     });

                            //     clear();
                            //     setState(() {
                            //       alreadyQuestions = 0;
                            //     });
                            //   }
                            //   Navigator.of(context).pop();
                            // });
                          },
                          color: Colors.red,
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  fireUpdaeLevelDetails({int id, level, title, message, ex}) async {
    var _mess;
    // final usersReference = Firestore.instance.collection("LevelDetails");

    try {
      DocumentReference reference = Firestore.instance
          .collection("LevelDetails")
          .document("LevelDetails");
      reference.setData({
        "LevelDetails-1": FieldValue.arrayUnion([
          {
            "id": id,
            "level": level.toString(),
            "title": title.toString(),
            "Message": message.toString(),
            "ex": ex.toString()
          }
        ])
      }, merge: true);
      _mess = "Su";
      return _mess;
    } catch (e) {
      _mess = "Failed";
      return _mess;
    }
  }

  clear() {
    id.clear();
    level.clear();
    title.clear();
    message.clear();
    ex.clear();
  }

  static Future<int> numberOfQuestions() async {
    int i = 0;
    List list = List();

    final levelReference = Firestore.instance.collection("LevelDetails");

    DocumentSnapshot documentSnapshot =
        await levelReference.document("LevelDetails").get();

    try {
      print(documentSnapshot.data["LevelDetails-1"][0]);

      for (int j = 0; documentSnapshot.data["LevelDetails-1"][j] != null; j++) {
        print(i);

        i++;
      }

      // i = documentSnapshot.data.length;
    } catch (e) {
      print(e);
    }
    // var data = documentSnapshot.data["LevelDetails-1"][i]['level'];
    // list.add(i);
    // list.add(data);
    // print("list ${list[0]}");
    return i;
  }

  addRowData() {
    List<Category> li = List();
    li = askListData();
    if (li != null) {
      for (var i = 0; i <= li.length; i++) {
        print(i);
        print(li[i].id);
      }
    }
    try {
      DocumentReference reference = Firestore.instance
          .collection("LevelDetails")
          .document("LevelDetails");
      reference.setData({
        "LevelDetails-1": FieldValue.arrayUnion([
          {
            "id": id,
            "level": level.toString(),
            "title": title.toString(),
            "Message": message.toString(),
            "ex": ex.toString()
          }
        ])
      }, merge: true);
    } catch (e) {}
  }
}
