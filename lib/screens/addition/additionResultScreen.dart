import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:husbh_app/screens/learn_page.dart';
import 'package:nice_buttons/nice_buttons.dart';

class additionResultScreen extends StatelessWidget {
  final addsinglescore;
  final addtensscore;
  final addhundredscore;
  final maxSingleScore;
  final maxTensScore;
  final maxHundredScore;
  final List qustions;
  final List answers;
  final List userAnswer;
  //total score
  late final totalAddScore;
  late final maxTotalAddScore;
  ArabicNumbers arabicNumber = ArabicNumbers();
  late final addsinglescoreArabic;
  late final maxSingleScoreArabic;
  late final addtensscoreArabic;
  late final maxtensscoreArabic;
  late final addhundredscoreArabic;
  late final maxhundredscoreArabic;
  //total score in arabic
  late final totalAddScoreArabic;
  late final maxTotalAddScoreArabic;

  additionResultScreen({
    this.addsinglescore,
    this.addtensscore,
    this.addhundredscore,
    this.maxSingleScore,
    this.maxTensScore,
    this.maxHundredScore,
    required this.qustions,
    required this.answers,
    required this.userAnswer,
  });

  @override
  Widget build(BuildContext context) {
    //calculate total score
    totalAddScore = addsinglescore + addtensscore + addhundredscore;
    maxTotalAddScore = maxSingleScore + maxTensScore + maxHundredScore;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    addsinglescoreArabic = arabicNumber.convert(addsinglescore);
    maxSingleScoreArabic = arabicNumber.convert(maxSingleScore);
    addtensscoreArabic = arabicNumber.convert(addtensscore);
    maxtensscoreArabic = arabicNumber.convert(maxTensScore);
    addhundredscoreArabic = arabicNumber.convert(addhundredscore);
    maxhundredscoreArabic = arabicNumber.convert(maxHundredScore);
    //convert total score to arabic
    totalAddScoreArabic = arabicNumber.convert(totalAddScore);
    maxTotalAddScoreArabic = arabicNumber.convert(maxTotalAddScore);

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
                    'النتيجة\n',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 26.0,
                        color: Colors.brown,
                        fontFamily: 'ReadexPro',
                        fontWeight: FontWeight.bold),
                  ),
                  //The results
                  Text(
                    '\u2022 جمع الآحاد      :  $addsinglescoreArabic من $maxSingleScoreArabic \n'
                    '\u2022 جمع العشرات  :   $addtensscoreArabic من $maxtensscoreArabic \n'
                    '\u2022 جمع المئات     :   $addhundredscoreArabic من $maxhundredscoreArabic',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20.0,
                        color: Colors.brown,
                        fontFamily: 'ReadexPro',
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
                  // Text(
                  //   '',
                  //   textDirection: TextDirection.rtl,
                  //   textAlign: TextAlign.right,
                  //   style: TextStyle(
                  //       decoration: TextDecoration.none,
                  //       fontSize: 20.0,
                  //       color: Colors.brown,
                  //       fontFamily: 'ReadexPro',
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
                        fontFamily: 'ReadexPro',
                        fontWeight: FontWeight.bold)))
          ]),
        ]),
      ],
    );
  }
}
