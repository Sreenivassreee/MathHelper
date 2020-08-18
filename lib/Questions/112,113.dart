import 'dart:math';

import 'package:math_helper/Questions/MasterClass.dart';

class Additions {
  Random random = Random();

  static MasterQuestion abc() {
    MasterQuestion master = MasterQuestion();

    List list = List();
    List li = List();
    var b;
    Random random = Random();

    for (var i = 1; i <= 4; i++) {
      var a = random.nextInt(25) + 10;
      // b = random.nextInt(9);

      list.add(a);
    }
    // print(list);
    var answer = list[0] * list[1] / list[2];
    // - list[2] - list[3] - list[4];
    var question = "${list[0]} x ${list[1]} / ${list[2]}";
    // - ${list[2]} - ${list[3]} - ${list[4]}";

    // var answer = a + b;
    // var question = "$a + $b";

    // for (var j = 0; masterlist.lenght; j++) {
    //   if (masterlist[j].contains(question) || masterlist[j].contains(answer)) {}
    // }
    li.add(random.nextInt(5));
    li.add(random.nextInt(20) - answer);
    li.add(random.nextInt(30) + answer);
    // print(li[0]);
    // print(li[1]);
    // print(li[2]);
    li.shuffle();
    li.shuffle();

    var inAnswer1 = li[0];
    var inAnswer2 = li[1];
    //- answer;
    var inAnswer3 = li[2];

    // print("Question is $question");
    // print("answer is $answer");

    // print("inAnswer1 is $inAnswer1");
    // print("inAnswer2 is $inAnswer2");
    // print("inAnswer3 is $inAnswer3");
    if (answer == inAnswer1 ||
        answer == inAnswer2 ||
        answer == inAnswer3 ||
        inAnswer1 == inAnswer2 ||
        inAnswer1 == inAnswer3 ||
        inAnswer2 == inAnswer3) {
      return null;
    } else {
      master = MasterQuestion(
        question: question.toString(),
        answer: answer.round().toString(),
        inAnswer1: inAnswer1.round().toString(),
        inAnswer2: inAnswer2.round().toString(),
        inAnswer3: inAnswer3.round().toString(),
      );
      return master;
    }
  }
}
// / / for (var i = 1; i <= 2; i++) {
//     var a = random.nextInt(90) + 10;
//     var b = random.nextInt(90) + 10;

//     // list.add(a);
//     // }
//     // print(list);
//     // var answer = list[0] + list[1] + list[2] + list[3];
//     // var question = "${list[0]} + ${list[1]} + ${list[2]} + ${list[3]}";

//     var answer = a * b;
//     // var answer = double.parse(ans.toStringAsFixed(2));R

//     var question = "$a x $b";

//     // for (var j = 0; masterlist.lenght; j++) {
//     //   if (masterlist[j].contains(question) || masterlist[j].contains(answer)) {}
//     // // }
//     var ra = random.nextInt(9999);
//     var rb = random.nextInt(9999);
//     var rc = random.nextInt(9999);
//     list.add(ra);
//     list.add(rb);
//     list.add(rc);
//     list.shuffle();
//     // var inAnswer1 = " ";
//     // var inAnswer2 = " ";
//     // var inAnswer3 = " ";
//     var z = random.nextInt(list[0] + 20) + 20;
//     var y = random.nextInt(list[1] + 10) + 10;

//     var x = random.nextInt(list[2] + 15) + 50;
//     var inAnswer1 = x;
//     // double.parse(x.toStringAsFixed(2));
//     var inAnswer2 = y;
//     //  double.parse(y.toStringAsFixed(2));
//     var inAnswer3 = z;
//     // double.parse(z.toStringAsFixed(2));
//     print(a);
//     print(b);

//     if (answer == inAnswer1 ||
//         answer == inAnswer2 ||
//         answer == inAnswer3 ||
//         inAnswer1 == inAnswer2 ||
//         inAnswer1 == inAnswer3 ||
//         inAnswer2 == inAnswer3) {
//       return null;
//     } else {
//       master = MasterQuestion(
//         question: question.toString(),
//         answer: answer.toString(),
//         inAnswer1: inAnswer1.toString(),
//         inAnswer2: inAnswer2.toString(),
//         inAnswer3: inAnswer3.toString(),
//       );
//       print("Question is $question");
//       print("answer is $answer");

//       print("inAnswer1 is $inAnswer1");
//       print("inAnswer2 is $inAnswer2");
//       print("inAnswer3 is $inAnswer3");
//       return master;
//     }
//   }
