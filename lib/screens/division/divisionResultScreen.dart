import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:husbh_app/screens/learn_page.dart';
import 'package:nice_buttons/nice_buttons.dart';

class divisionResultScreen extends StatelessWidget {
  final divlevel1Score;
  final divlevel2Score;
  final divlevel3Score;
  final maxLevel1Score;
  final maxLevel2Score;
  final maxLevel3Score;
  final List qustions;
  final List answers;
  final List userAnswer;
  ArabicNumbers arabicNumber = ArabicNumbers();
  late final divlevel1scoreArabic;
  late final maxLevel1ScoreArabic;
  late final divlevel2scoreArabic;
  late final maxLevel2scoreArabic;
  late final divlevel3scoreArabic;
  late final maxLevel3scoreArabic;
  // final singlescoreArabic = arabicNumber.convert(singlescore),

  divisionResultScreen({
    this.divlevel1Score,
    this.divlevel2Score,
    this.divlevel3Score,
    this.maxLevel1Score,
    this.maxLevel2Score,
    // this.singlescoreArabic,
    this.maxLevel3Score,
    required this.qustions,
    required this.answers,
    required this.userAnswer,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    divlevel1scoreArabic = arabicNumber.convert(divlevel1Score);
    maxLevel1ScoreArabic = arabicNumber.convert(maxLevel1Score);
    divlevel2scoreArabic = arabicNumber.convert(divlevel2Score);
    maxLevel2scoreArabic = arabicNumber.convert(maxLevel2Score);
    divlevel3scoreArabic = arabicNumber.convert(divlevel3Score);
    maxLevel3scoreArabic = arabicNumber.convert(maxLevel3Score);

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
                  height: height * 0.26,
                  width: width * 0.19,
                  // height: 120,
                  // width: 120,
                )
              ],
            ),
            Container(
              height: height * 0.49,
              width: width * 0.44,
              // width: 380,
              // height: 200,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 250, 255, 253),
                // boxShadow: [
                //   BoxShadow(color: Colors.green, spreadRadius: 0.2)
                // ],
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 163, 163, 163).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(2, 8), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(55),
                // border: Border.all(
                //   color: Color.fromARGB(255, 33, 120, 36),
                //   width: 1,
                // ),
              ),
              child: Column(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'النتيجة',
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
                    '\u2022 المستوى الأول من القسمة :  $divlevel1scoreArabic من $maxLevel1ScoreArabic \n'
                    '\u2022 المستوى الثاني من القسمة :   $divlevel2scoreArabic من $maxLevel2scoreArabic \n'
                    '\u2022 المستوى الثالث من القسمة :   $divlevel3scoreArabic من $maxLevel3scoreArabic',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20.0,
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
