import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:husbh_app/screens/learn_page.dart';
import 'package:nice_buttons/nice_buttons.dart';

class multiplicationResultScreen extends StatelessWidget {
  final level1score;
  final level2score;
  final level3score;
  final maxLevel1Score;
  final maxLevel2Score;
  final maxLevel3Score;
  final List qustions;
  final List answers;
  final List userAnswer;
  ArabicNumbers arabicNumber = ArabicNumbers();
  late final level1scoreArabic;
  late final maxLevel1ScoreArabic;
  late final level2sscoreArabic;
  late final maxLevel2ScoreArabic;
  late final level3scoreArabic;
  late final maxLevel3ScoreArabic;

  multiplicationResultScreen({
    this.level1score,
    this.level2score,
    this.level3score,
    this.maxLevel1Score,
    this.maxLevel2Score,
    this.maxLevel3Score,
    required this.qustions,
    required this.answers,
    required this.userAnswer,
  });

  @override
  Widget build(BuildContext context) {
    level1scoreArabic = arabicNumber.convert(level1score);
    maxLevel1ScoreArabic = arabicNumber.convert(maxLevel1Score);
    level2sscoreArabic = arabicNumber.convert(level2score);
    maxLevel2ScoreArabic = arabicNumber.convert(maxLevel2Score);
    level3scoreArabic = arabicNumber.convert(level3score);
    maxLevel3ScoreArabic = arabicNumber.convert(maxLevel3Score);

    TextDirection.rtl;
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/farm.jpg'),
            fit: BoxFit.cover,
          ),
        )),
        //Row to have the home button
        // Row(
        //   children: [
        //     IconButton(
        //       padding: EdgeInsets.all(23.0),
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => home_page()),
        //         );
        //       },
        //       //icon: Icon(Icons.arrow_back_ios),
        //       icon: Icon(Icons.home_rounded),
        //       color: Colors.brown.shade600,
        //       //color: Colors.blue,
        //       iconSize: 60.0,
        //     ),
        //   ],
        // ),
        Stack(children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/rabbit_result.png',
                  height: 120,
                  width: 120,
                )
              ],
            ),
            Container(
              width: 380,
              height: 200,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 250, 255, 253),
                // boxShadow: [
                //   BoxShadow(color: Colors.green, spreadRadius: 0.2)
                // ],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color.fromARGB(255, 33, 120, 36),
                  width: 1,
                ),
              ),
              child: Column(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ':النتيجة',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 26.0,
                        color: Colors.black,
                        fontFamily: 'ReadexPro-Regular',
                        fontWeight: FontWeight.bold),
                  ),
                  //The results
                  Text(
                    '\u2022 جمع الآحاد: $level1scoreArabic من $maxLevel1ScoreArabic \n'
                    '\u2022 جمع العشرات: $level2sscoreArabic من $maxLevel2ScoreArabic \n'
                    '\u2022 جمع المئات: $level3scoreArabic من $maxLevel3ScoreArabic',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 22.0,
                        color: Colors.black,
                        fontFamily: 'ReadexPro-Regular',
                        fontWeight: FontWeight.bold),
                  ),
                  // Text(
                  //   'المجموع:',
                  //   textDirection: TextDirection.rtl,
                  //   textAlign: TextAlign.right,
                  //   style: TextStyle(
                  //       decoration: TextDecoration.none,
                  //       fontSize: 28.0,
                  //       color: Colors.black,
                  //       fontFamily: 'ReadexPro-Regular',
                  //       fontWeight: FontWeight.bold),
                  // ),
                ],
              ),
            ),
            SizedBox(height: 10),
            NiceButtons(
                stretch: false,
                startColor: Colors.lightBlueAccent,
                endColor: Colors.lightBlueAccent,
                borderColor: Color(0xFF3489e9),
                width: 200,
                height: 60,
                borderRadius: 60.0,
                gradientOrientation: GradientOrientation.Horizontal,
                //Navigate to learn page
                onTap: (finish) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => learn_page()),
                  );
                },
                child: Text('تم',
                    //'حسنا'
                    //'العودة'
                    //'رؤية النتيجة في الصفحة الشخصية'
                    //'العودة إلى الصفحة الرئيسية'
                    //'لعودة الى صفحة التعلم'
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 24.0,
                        color: Colors.white,
                        fontFamily: 'ReadexPro-Regular',
                        fontWeight: FontWeight.bold)))
          ]),
        ]),
      ],
    );
  }
}
