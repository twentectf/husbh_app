import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:husbh_app/screens/learn_page.dart';
import 'package:nice_buttons/nice_buttons.dart';
// import 'package:fabexdateformatter/fabexdateformatter.dart';

class subtractionResultScreen extends StatelessWidget {
  final singlescore;
  final tensscore;
  final hundredscore;
  final maxSingleScore;
  final maxTensScore;
  final maxHundredScore;
  final List qustions;
  final List answers;
  final List userAnswer;
  ArabicNumbers arabicNumber = ArabicNumbers();
  late final singlescoreArabic;
  late final maxSingleScoreArabic;
  late final tensscoreArabic;
  late final maxtensscoreArabic;
  late final hundredscoreArabic;
  late final maxhundredscoreArabic;
  // final singlescoreArabic = arabicNumber.convert(singlescore),

  subtractionResultScreen({
    this.singlescore,
    this.tensscore,
    this.hundredscore,
    this.maxSingleScore,
    this.maxTensScore,
    // this.singlescoreArabic,
    this.maxHundredScore,
    required this.qustions,
    required this.answers,
    required this.userAnswer,
  });

  @override
  Widget build(BuildContext context) {
    singlescoreArabic = arabicNumber.convert(singlescore);
    maxSingleScoreArabic = arabicNumber.convert(maxSingleScore);
    tensscoreArabic = arabicNumber.convert(tensscore);
    maxtensscoreArabic = arabicNumber.convert(maxTensScore);
    hundredscoreArabic = arabicNumber.convert(hundredscore);
    maxhundredscoreArabic = arabicNumber.convert(maxHundredScore);

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
                    '\u2022 طرح الآحاد: $singlescoreArabic من $maxSingleScoreArabic \n'
                    '\u2022 طرح العشرات: $tensscoreArabic من $maxtensscoreArabic \n'
                    '\u2022 طرح المئات: $hundredscoreArabic من $maxhundredscoreArabic',
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
