import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:husbh_app/main.dart';
import 'AnswerScreen.dart';
import 'dart:async';
import 'QuizButtonIcon.dart';
import 'package:nice_buttons/nice_buttons.dart';
// import 'package:fabexdateformatter/fabexdateformatter.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  //final String oprator;
  //final int numOfQuestions = 10;
  //final int range1;
  //final duration;

  //final int range2;

  // QuizScreen(
  //     { //Key key,
  //     //this.duration,
  //     //this.oprator = "sum",
  //     //this.numOfQuestions = "5",
  //     //this.range1 = 9,
  //    // this.range2 = 9
  //    });

  @override
  _QuizScreenState createState() => _QuizScreenState();

  // Widget build(BuildContext context) {
  //   double width = MediaQuery.of(context).size.width;
  //   double height = MediaQuery.of(context).size.height;
  //   WidgetsFlutterBinding.ensureInitialized();
  //   SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  //   TextDirection.rtl;
  //   return Container();
  // }
  //رجعي الكود اللي فوق
}

class _QuizScreenState extends State<QuizScreen> {
  get width => MediaQuery.of(context).size.width;
  get height => MediaQuery.of(context).size.height;

  List qustions = [];
  List answers = [];
  bool isMarked = false;
  List<List<dynamic>> mcq = [];
  List userAnswer = [];
  var ansData;
  List<dynamic> ans = [];
  var j = 0;
  final int numOfSingleQuestions = 4; //الآحاد
  final int numOfTensQuestions = 4; //العشرات
  final int numOfHundredQuestions = 4; //المئات

//Array of numbers to convert from english to arabic
  var numberMap = {
    0: '۰',
    1: '۱',
    2: '۲',
    3: '۳',
    4: '٤',
    5: '٥',
    6: '٦',
    7: '٧',
    8: '۸',
    9: '۹'
  };

  //wilم have the two values in english
  // var x = Random().nextInt(10);
  // var y = Random().nextInt(10);
  //wil have the two values in arabic

  String arabicX = "";
  String arabicY = "";

  var x = Random().nextInt(9) + 1;
  var y = Random().nextInt(9) + 1;

  void initState() {
    TextDirection.rtl;
    super.initState();
    for (var i = 1; i < numOfSingleQuestions + 1; i++) {
      ans = [];
      var x = Random().nextInt(9) + 1;
      var y = Random().nextInt(9) + 1;

      textDirection:
      TextDirection.rtl;
      qustions.add(convertToArabic());
      // print(qustions[i - 1]);
      answers.add(x + y);
      ansData = [
        x + y,
        x + y + Random().nextInt(9) + 1,
        x + y - Random().nextInt(9) - 1,
        x + y + Random().nextInt(9) + 1,
      ];

      for (var j = 0; j < 4; j++) {
        var rNum = Random().nextInt(ansData.length).round();
        ans.add(ansData[rNum]);
        ansData.removeAt(rNum);
      }
      mcq.add(ans);
    }

    for (var i = 1; i < numOfTensQuestions + 1; i++) {
      ans = [];
      var x = Random().nextInt(99) + 1;
      var y = Random().nextInt(99) + 1;

      qustions.add(convertToArabic());
      answers.add(x + y);
      ansData = [
        x + y,
        x + y + Random().nextInt(99) + 1,
        x + y - Random().nextInt(99) - 1,
        x + y + Random().nextInt(99) + 1,
      ];

      for (var j = 0; j < 4; j++) {
        var rNum = Random().nextInt(ansData.length).round();
        ans.add(ansData[rNum]);
        ansData.removeAt(rNum);
      }
      mcq.add(ans);
    }

    for (var i = 1; i < numOfHundredQuestions + 1; i++) {
      ans = [];
      var x = Random().nextInt(999) + 1;
      var y = Random().nextInt(999) + 1;
      qustions.add(convertToArabic());
      answers.add(x + y);
      ansData = [
        x + y,
        x + y + Random().nextInt(999) + 1,
        x + y - Random().nextInt(999) - 1,
        x + y + Random().nextInt(999) + 1,
      ];

      for (var j = 0; j < 4; j++) {
        var rNum = Random().nextInt(ansData.length).round();
        ans.add(ansData[rNum]);
        ansData.removeAt(rNum);
      }
      mcq.add(ans);
    }
  }

  String convertToArabic() {
    if (x.toString().length == 1) {
      arabicX = numberMap[x].toString();
    }
    if (y.toString().length == 1) {
      arabicY = numberMap[y].toString();
    }

    var numberLengthX = x.toString().length;
    if (numberLengthX > 1) {
      var Xstring = x.toString();
      arabicX = Xstring;
      for (var i = 0; i < numberLengthX; i++) {
        var num = int.parse(Xstring[i]);
        arabicX = arabicX.replaceAll(num.toString(), numberMap[num]!);
      }
    }
    var numberLengthY = y.toString().length;
    if (numberLengthY > 1) {
      var Ystring = y.toString();
      arabicY = Ystring;
      for (var s = 0; s < numberLengthY; s++) {
        var num = int.parse(Ystring[s]);
        arabicY = arabicY.replaceAll(num.toString(), numberMap[num]!);
      }
    }
    return "$arabicY + $arabicX = ......";
  }

  _changeQuestion(ans) {
    userAnswer.add(ans);
    if (j + 1 >= qustions.length) {
      var Singlescore = 0;
      // var Tensscore = 0;
      // var Hundredscore = 0;
      for (var i = 0; i < answers.length; i++) {
        if (userAnswer[i].toString() == answers[i].toString()) {
          Singlescore++;
        }
      }

      var Tensscore = 0;
      for (var i = 0; i < answers.length; i++) {
        if (userAnswer[i].toString() == answers[i].toString()) {
          Tensscore++;
        }
      }

      var Hundredscore = 0;
      for (var i = 0; i < answers.length; i++) {
        if (userAnswer[i].toString() == answers[i].toString()) {
          Hundredscore++;
        }
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AnswerScreen(
              maxSingleScore: numOfSingleQuestions,
              maxTensScore: numOfTensQuestions,
              maxHundredScore: numOfHundredQuestions,
              singlescore: Singlescore,
              tensscore: Tensscore,
              hundredscore: Hundredscore,
              answers: answers,
              qustions: qustions,
              userAnswer: userAnswer),
        ),
      );
    } else {
      print("called");
      setState(() {
        ++j;
        isMarked = false;
      });
    }
  }

  //objects for questions
  List<String> objects = [
    'images/GreenApple.png',
    'images/RedApple.png',
    'images/Xgreen.png',
    'images/Xred.png',
  ];
//returns images for value x
  Widget _printImageX(xValue) {
    //if value = 0 show its image
    if (x == 0) {
      return Wrap(
        direction: Axis.horizontal,
        children: <Widget>[
          Image.asset(
            //xgreen
            objects[2],
            width: width * 0.13,
            height: height * 0.12,
          )
        ],
      );
    }
    //else show the apples
    return Wrap(
      direction: Axis.horizontal,
      children: <Widget>[
        for (var i = 0; i < xValue; i++)
          Image.asset(
            objects[0],
            width: width * 0.13,
            height: height * 0.12,
          )
      ],
    );
  }

//returns images for value y
  Widget _printImageY(yValue) {
    if (y == 0) {
      return Wrap(
        direction: Axis.horizontal,
        children: <Widget>[
          Image.asset(
            objects[3],
            width: width * 0.13,
            height: height * 0.12,
          )
        ],
      );
    }
    return Wrap(
      direction: Axis.horizontal,
      children: <Widget>[
        for (var i = 0; i < yValue; i++)
          Image.asset(
            objects[1],
            width: width * 0.13,
            height: height * 0.12,
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //   SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    //   return Container(
    //     decoration: BoxDecoration(
    //       image: DecorationImage(
    //         image: AssetImage('assets/farm.jpg'),
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //     //backgroundColor: Colors.black,
    //     child: LayoutBuilder(builder: (context, constraint) {
    //       return SingleChildScrollView(
    //         child: ConstrainedBox(
    //           constraints: BoxConstraints(minHeight: constraint.maxHeight),
    //           child: IntrinsicHeight(
    //             child: Column(
    //               textDirection: TextDirection.rtl,
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Text(qustions[j].toString(),
    //                     style: TextStyle(
    //                         decoration: TextDecoration.none,
    //                         color: Colors.lightBlue,
    //                         //backgroundColor: Colors.white,
    //                         fontSize:
    //                             MediaQuery.of(context).size.width > 500 ? 45 : 20,
    //                         fontWeight: FontWeight.bold)),
    //                 SizedBox(height: 50),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: <Widget>[
    //                     NiceButtons(
    //                         onTap: (finish) {
    //                           _changeQuestion(mcq[j][0].toString());
    //                         },
    //                         stretch: false,
    //                         startColor: Colors.lightBlueAccent,
    //                         endColor: Colors.lightBlueAccent,
    //                         borderColor: Color(0xFF3489e9),
    //                         width: 80.0,
    //                         height: 80.0,
    //                         borderRadius: 60.0,
    //                         gradientOrientation: GradientOrientation.Horizontal,
    //                         child: QuizButtonIcon(option: mcq[j][0].toString())),
    //                     SizedBox(width: 50),
    //                     NiceButtons(
    //                         onTap: (finish) {
    //                           _changeQuestion(mcq[j][1].toString());
    //                         },
    //                         stretch: false,
    //                         startColor: Colors.lightBlueAccent,
    //                         endColor: Colors.lightBlueAccent,
    //                         borderColor: Color(0xFF3489e9),
    //                         width: 80.0,
    //                         height: 80.0,
    //                         borderRadius: 60.0,
    //                         gradientOrientation: GradientOrientation.Horizontal,
    //                         child: QuizButtonIcon(option: mcq[j][1].toString())),
    //                     SizedBox(width: 50),
    //                     NiceButtons(
    //                         onTap: (finish) {
    //                           _changeQuestion(mcq[j][2].toString());
    //                         },
    //                         stretch: false,
    //                         startColor: Colors.lightBlueAccent,
    //                         endColor: Colors.lightBlueAccent,
    //                         borderColor: Color(0xFF3489e9),
    //                         width: 80.0,
    //                         height: 80.0,
    //                         borderRadius: 60.0,
    //                         gradientOrientation: GradientOrientation.Horizontal,
    //                         child: QuizButtonIcon(option: mcq[j][2].toString())),
    //                     SizedBox(width: 50),
    //                     NiceButtons(
    //                         onTap: (finish) {
    //                           _changeQuestion(mcq[j][3].toString());
    //                         },
    //                         stretch: false,
    //                         startColor: Colors.lightBlueAccent,
    //                         endColor: Colors.lightBlueAccent,
    //                         borderColor: Color(0xFF3489e9),
    //                         width: 80.0,
    //                         height: 80.0,
    //                         borderRadius: 60.0,
    //                         gradientOrientation: GradientOrientation.Horizontal,
    //                         child: QuizButtonIcon(option: mcq[j][3].toString())),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       );
    //     }),
    //   );
    // }
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    textDirection:
    TextDirection.rtl;
    return Scaffold(
      body: Stack(
        textDirection: TextDirection.rtl,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/farm.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // decoration:
                  //  BoxDecoration(
                  //   image: DecorationImage(
                  //     image: AssetImage('assets/dogFrame.png'),
                  //     alignment: Alignment.center,
                  //   ),
                  // ),
                  //رجعي الكود اللي فوق
                  child: Text(qustions[j],
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.lightBlue,
                          fontFamily: "ReadexPro-Regular",
                          fontSize:
                              MediaQuery.of(context).size.width > 500 ? 45 : 20,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 50),
                // SizedBox(height: 200), كان
                Wrap(
                  children: [
                    SizedBox(width: 300, child: _printImageY(y)),
                    const Text(
                      ' + ',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 60,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 300, child: _printImageX(x)),
                  ],
                ),
                // SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    NiceButtons(
                        onTap: (finish) {
                          _changeQuestion(mcq[j][0].toString());
                        },
                        stretch: false,
                        startColor: Colors.lightBlueAccent,
                        endColor: Colors.lightBlueAccent,
                        borderColor: Color(0xFF3489e9),
                        width: 90.0,
                        height: 60.0,
                        // width: 80.0,
                        // height: 80.0,
                        borderRadius: 60.0,
                        gradientOrientation: GradientOrientation.Horizontal,
                        child: QuizButtonIcon(option: mcq[j][0].toString())),
                    SizedBox(width: 30),
                    NiceButtons(
                        onTap: (finish) {
                          _changeQuestion(mcq[j][1].toString());
                        },
                        stretch: false,
                        startColor: Colors.lightBlueAccent,
                        endColor: Colors.lightBlueAccent,
                        borderColor: Color(0xFF3489e9),
                        width: 90.0,
                        height: 60.0,
                        // width: 80.0,
                        // height: 80.0,
                        borderRadius: 60.0,
                        gradientOrientation: GradientOrientation.Horizontal,
                        child: QuizButtonIcon(option: mcq[j][1].toString())),
                    SizedBox(width: 30),
                    NiceButtons(
                        onTap: (finish) {
                          _changeQuestion(mcq[j][2].toString());
                        },
                        stretch: false,
                        startColor: Colors.lightBlueAccent,
                        endColor: Colors.lightBlueAccent,
                        borderColor: Color(0xFF3489e9),
                        width: 90.0,
                        height: 60.0,
                        // width: 80.0,
                        // height: 80.0,
                        borderRadius: 60.0,
                        gradientOrientation: GradientOrientation.Horizontal,
                        child: QuizButtonIcon(option: mcq[j][2].toString())),
                    SizedBox(width: 30),
                    NiceButtons(
                        onTap: (finish) {
                          _changeQuestion(mcq[j][3].toString());
                        },
                        stretch: false,
                        startColor: Colors.lightBlueAccent,
                        endColor: Colors.lightBlueAccent,
                        borderColor: Color(0xFF3489e9),
                        width: 90.0,
                        height: 60.0,
                        // width: 80.0,
                        // height: 80.0,
                        borderRadius: 60.0,
                        gradientOrientation: GradientOrientation.Horizontal,
                        child: QuizButtonIcon(option: mcq[j][3].toString())),
                  ],
                ),
              ])
        ],
      ),
    );
  }
}

Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
