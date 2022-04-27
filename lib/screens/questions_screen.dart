import 'dart:io';
import 'package:flutter/material.dart';
import 'Questions.dart';
import '../widgets/question_widget.dart';
import '../widgets/next_button.dart';
import '../widgets/option_card.dart';
import 'learn_page.dart';
import 'dart:math';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  // ignore: prefer_final_fields
  List<Question> _questions = [
    Question(
      id: '1',
      title: '----- =   ٥   +   ٢',
      options: {'٤': false, '٥': false, '٢': false, '٧': true},
      image: 'assets/q1.png',
      // image: ccc,
    ),
    Question(
      id: '2',
      title: '----- =   ٨   +   ٣',
      options: {'٩': false, '٤': false, '١١': true, '٥': false},
      image: 'assets/q2.png',
    ),
    Question(
      id: '3',
      title: '',
      options: {'٥': true, '٩': false, '٨': false, '١١': false},
      image: 'assets/q33.png',
    ),
    Question(
      id: '4',
      title: '',
      options: {'٦': false, '١٠': true, '١٢': false, '٣': false},
      image: 'assets/q44.png',
    ),
    Question(
      id: '5',
      title: '',
      //=   ١٢٣   +   ٢٦١'
      options: {'٥٦': true, '٦٧': false, '٦٠': false, '٤١': false},
      image: 'assets/q55.png',
    ),
    Question(
      id: '6',
      title: '',
      //'=   ١٠٢   +   ١٣٣'v
      options: {'٩٠': false, '٧١': false, '٩٩': true, '٦٨': false},
      image: 'assets/q66.png',
    ),
  ];

//index of the question
  int index = 0;

// //it is false first since no buttons are pressed yet
  bool isPressed = false;

//Not used yet
  bool getIsPressed() {
    return isPressed;
  }

//to display next question
  void nextQuestion() {
    if (index == _questions.length - 1) {
      return;
    } else {
      setState(() {
        index++;
        isPressed = false;
      });
    }
  }

//navigates to learn page after thr last question is answered
  void lastQuestion() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => learn_page()));
  }

//returns the image of the current question
  String imageExists() {
    return _questions[index].image;
  }

//changes the color of the button
  void chnageColor() {
    setState(() {
      isPressed = true;
    });
  }

// background array
  List<String> images = [
    'assets/farm.jpg',
    'assets/farm.jpg',
    'assets/cloud.jpg',
    'assets/cloud.jpg',
    'assets/lake2.jpg',
    'assets/lake2.jpg',
  ];

  //background method
  String imageName() {
    return images[index];
  }

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

  var x = Random().nextInt(10);
  var y = Random().nextInt(10);

  void randomization() {
    while (x + y > 10) {
      x = Random().nextInt(10);
      y = Random().nextInt(10);
    }
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children: [
        //image container
        //////////////////////////////////
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageName()),
              fit: BoxFit.cover,
            ),
          ),
        ),
        //////////////////////////////////
        Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    //question at index 0 and 1 are displayed differently (in different sizes)
                    child: index < 2
                        ? Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: QuestionWidget(
                              indexAction: index,
                              question: _questions[index].title,
                              totalQuestions: _questions.length,
                            ),
                          )
                        : 2 <= index && index <= 5
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: QuestionWidget(
                                  indexAction: index,
                                  question: _questions[index].title,
                                  totalQuestions: _questions.length,
                                ),
                              )
                            : const SizedBox(height: 70.0),
                  ),
                ],
              ),
              //to display images for each question with width and height (based on the index)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: index < 2
                        ? Image(
                            image: AssetImage(imageExists()),
                            width: width * 0.50,
                            height: height * 0.44,
                            // width: width * 500,
                            // height: height * 250,
                          )
                        : 2 <= index && index <= 5
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 30.0),
                                child: Image(
                                  image: AssetImage(imageExists()),
                                  width: width * 0.30,
                                  height: height * 0.44,
                                  // width: width * 350,
                                  // height: height * 250,
                                ),
                              )
                            : null,
                  ),
                ],
              ),

              //to display options for each question (based on the index)
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i < _questions[index].options.length; i++)
                        OptionCard(
                            option: _questions[index].options.keys.toList()[i],
                            color: isPressed
                                ? _questions[index]
                                            .options
                                            .values
                                            .toList()[i] ==
                                        true
                                    ? const Color.fromARGB(
                                        255, 50, 132, 9) //correct
                                    : const Color.fromRGBO(
                                        218, 39, 39, 1) //incorrect
                                : const Color(0xFF3489e9),
                            onTap: () async {
                              chnageColor();
                              //await
                              await Future.delayed(const Duration(seconds: 1),
                                  () {
                                if (index < 5) {
                                  nextQuestion();
                                } else {
                                  lastQuestion();
                                }
                              });
                            }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),

//for the Next button
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Align(
        alignment: Alignment.topRight,
        child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(children: <Widget>[
              index < 5
                  ? NextButton(nextQuestion: nextQuestion)
                  : NextButton(nextQuestion: lastQuestion)
            ])),
      ),
    );
  }
}
