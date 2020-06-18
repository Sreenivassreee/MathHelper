import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

// final usersReference = Firestore.instance.collection("Helper");

class EnterQuestions extends StatefulWidget {
  @override
  _EnterQuestionsState createState() => _EnterQuestionsState();
}

class _EnterQuestionsState extends State<EnterQuestions> {
  TextEditingController question = TextEditingController();
  TextEditingController answer = TextEditingController();
  TextEditingController iAnswer1 = TextEditingController();
  TextEditingController iAnswer2 = TextEditingController();
  TextEditingController iAnswer3 = TextEditingController();
  int level;

  static int currentQuestion = 1;
  static int alreadyQuestions = 0;

  @override
  void initState() {
    currentQuestion = 1;
    alreadyQuestions = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    setState(() {
      level = settings.arguments;
    });
    // numberOfQuestions(level.toString()).then((value) => {
    //       setState(() {
    //         alreadyQuestions = value;
    //         print(" alreadyQuestions $alreadyQuestions");
    //       })
    //     });

    return Scaffold(
      appBar: AppBar(title: Text("Questions Panel")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(
                            children: [
                              Text(
                                "Current Level   : ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                child: Text(
                                  "$level",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      Container(
                        color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Row(
                            children: [
                              Text(
                                "Current Question   : ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20,
                                child: Text(
                                  (alreadyQuestions + 1).toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 1),
              Container(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Text(
                        "Questions: ",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(width: 20),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: Text(
                          "$alreadyQuestions",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      RaisedButton(
                        onPressed: () {
                          setState(
                            () {
                              numberOfQuestions(level.toString()).then(
                                (value) => {
                                  setState(() {
                                    alreadyQuestions = value;
                                    print(
                                        " alreadyQuestions $alreadyQuestions");
                                  })
                                },
                              );
                            },
                          );
                        },
                        color: Colors.green,
                        child: Text(
                          "Get No of Questions",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: question,
                decoration: InputDecoration(
                  labelText: "Question",
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
                controller: answer,
                decoration: InputDecoration(
                  labelText: "Correct Answer",
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
              SizedBox(height: 50),
              TextField(
                controller: iAnswer1,
                decoration: InputDecoration(
                  labelText: "Wrong Answer1",
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
                controller: iAnswer2,
                decoration: InputDecoration(
                  labelText: "Wrong Answer2",
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
                controller: iAnswer3,
                decoration: InputDecoration(
                  labelText: "Wrong Answer3",
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
                        await fireUpdaeScore(
                          level: level,
                          question: question.text,
                          answer: answer.text,
                          ia1: iAnswer1.text,
                          ia2: iAnswer2.text,
                          ia3: iAnswer3.text,
                        ).then((value) {
                          print("value $value");
                          if (value == "Su") {
                            clear();
                            setState(() {
                              currentQuestion++;
                              alreadyQuestions++;
                            });
                          }
                        });
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
                        await fireUpdaeScore(
                          level: level,
                          question: question.text,
                          answer: answer.text,
                          ia1: iAnswer1.text,
                          ia2: iAnswer2.text,
                          ia3: iAnswer3.text,
                        ).then((value) {
                          print("value $value");

                          if (value == "Su") {
                            setState(() {
                              currentQuestion = 1;
                              alreadyQuestions = 0;
                            });

                            clear();
                            setState(() {
                              alreadyQuestions = 0;
                            });
                          }
                          Navigator.of(context).pop();
                        });
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
              )
            ],
          ),
        ),
      ),
    );
  }

  clear() {
    // question.clear();
    answer.clear();
    iAnswer1.clear();
    iAnswer2.clear();
    iAnswer3.clear();
    print("sree");
  }

  static Future<String> fireUpdaeScore(
      {int level,
      String question,
      String answer,
      String ia1,
      String ia2,
      String ia3}) async {
    String _mess;
    if (level.toString() == "" ||
        question == "" ||
        answer == "" ||
        ia1 == "" ||
        ia2 == "" ||
        ia3 == "") {
      print("NUll is triggering");
    } else {
      await numberOfQuestions(level).then((value) {
        print("value $value");
        if (value >= 1) {
          try {
            DocumentReference reference = Firestore.instance
                .collection("Levels")
                .document("Level-" + "$level");
            reference.updateData({
              "Level-" + "$level": FieldValue.arrayUnion([
                {
                  "Q": question.toString(),
                  "CA": answer.toString(),
                  "ICA1": ia1.toString(),
                  "ICA2": ia2.toString(),
                  "ICA3": ia3.toString()
                }
              ])
            });
            _mess = "Su";
          } catch (e) {
            _mess = "Failed";
          }
        } else if (value < 1) {
          try {
            DocumentReference reference = Firestore.instance
                .collection("Levels")
                .document("Level-" + "$level");
            reference.setData({
              "Level-" + "$level": FieldValue.arrayUnion([
                {
                  "Q": question.toString(),
                  "CA": answer.toString(),
                  "ICA1": ia1.toString(),
                  "ICA2": ia2.toString(),
                  "ICA3": ia3.toString()
                }
              ])
            });
            _mess = "Su";
          } catch (e) {
            _mess = "Failed";
          }
        }
      });
    }
    print("_mess$_mess");
    return _mess;
  }

// .document("M5xgqSw5RA2VaBkQEP5N")
//             .collection("Level-" + "$level")
//             .document()
//             .setData({
//           "Q": question,
//           "CA": answer,
//           "ICA1": ia1,
//           "ICA2": ia2,
//           "ICA3": ia3
//         });
  static Future<int> numberOfQuestions(level) async {
    int i = 0;

    try {
      final levelReference = Firestore.instance.collection("Levels");

      DocumentSnapshot documentSnapshot =
          await levelReference.document("Level-" + level.toString()).get();
      print(documentSnapshot.data["Level-" + level.toString()][0]);

      for (int j = 0;
          documentSnapshot.data["Level-" + level.toString()][j] != null;
          j++) {
        print(i);
        i++;
      }

      // i = documentSnapshot.data.length;
    } catch (e) {
      print(e);
    }
    print("i $i");
    return i;
  }

  // updateCategory() async {
  //   Firestore.instance.collection("test").document("Level-1").updateData({
  //     "hi": FieldValue.arrayUnion([
  //       {"srsdfsdfee": "sdfasdf"},
  //     ])
  //   });
  // }

}
