import 'package:flutter/material.dart';
import 'package:husbh_app/main.dart';
import 'package:nice_buttons/nice_buttons.dart';
// import 'package:fabexdateformatter/fabexdateformatter.dart';
import 'package:arabic_numbers/arabic_numbers.dart';

class AnswerScreen extends StatelessWidget {
  // @override
  // AnswerScreen createState() => AnswerScreen(answers: const [], qustions: const [], userAnswer: const []);

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

  AnswerScreen({
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

    textDirection:
    TextDirection.rtl;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/farm.jpg'),
          fit: BoxFit.cover,
        ),
      ),

      //backgroundColor: Colors.white,
      child: Center(
        child: Column(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("لقد حصلت على: \n",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 25,
                  fontFamily: 'ReadexPro-Regular',
                  color: Color(0XFF1ea366),
                )),
            Text(
                "${singlescoreArabic.toString()} من ${maxSingleScoreArabic.toString()} في جمع الآحاد",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 25,
                  fontFamily: 'ReadexPro-Regular',
                  color: Color(0XFF1ea366),
                )),
            //SizedBox(height: 30),
            Text(
                "${tensscoreArabic.toString()} من ${maxtensscoreArabic.toString()} في جمع العشرات",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 25,
                  fontFamily: 'ReadexPro-Regular',
                  color: Color(0XFF1ea366),
                )),
            // SizedBox(height: 30),
            Text(
                "${hundredscoreArabic.toString()} من ${maxhundredscoreArabic.toString()} في جمع المئات",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 25,
                  fontFamily: 'ReadexPro-Regular',
                  color: Color(0XFF1ea366),
                )),
            // Text("OUT OF ${maxScore.toString()}",
            //     style: TextStyle(
            //       fontSize: 20,
            //       color: Colors.black,
            //     )),
            SizedBox(height: 30),
            NiceButtons(
              stretch: false,
              width: 80.0,
              height: 60.0,
              onTap: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MyApp())),
              child: Text("حسنا",
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontFamily: 'ReadexPro-Regular',
                      fontSize: 25)),
            ),
            SizedBox(
              height: 30,
            ),
            // MaterialButton(
            //   onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UserAnswerScreen(answers: answers, qustions: qustions, userAnswer: userAnswer))),
            //   child: Text("Check Your Answer", style: TextStyle(color: Colors.blueAccent)),
            // ),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
///Erase///////////////////////////////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:husbh_app/main.dart';
// import 'package:nice_buttons/nice_buttons.dart';
// // import 'package:fabexdateformatter/fabexdateformatter.dart';
// import 'package:arabic_numbers/arabic_numbers.dart';

// class AnswerScreen extends StatelessWidget { 
//   // @override
//   // AnswerScreen createState() => AnswerScreen(answers: const [], qustions: const [], userAnswer: const []);

//   final singlescore;
//   final tensscore;
//   final hundredscore;
//   final maxSingleScore;
//   final maxTensScore;
//   final maxHundredScore;
//   final List qustions;
//   final List answers;
//   final List userAnswer;
//   ArabicNumbers arabicNumber = ArabicNumbers();
//   late final singlescoreArabic;
//   late final maxSingleScoreArabic;
//   late final tensscoreArabic;
//   late final maxtensscoreArabic;
//   late final hundredscoreArabic;
//   late final maxhundredscoreArabic;
//   // final singlescoreArabic = arabicNumber.convert(singlescore),

//   AnswerScreen({
//     this.singlescore,
//     this.tensscore,
//     this.hundredscore,
//     this.maxSingleScore,
//     this.maxTensScore,
//     // this.singlescoreArabic,
//     this.maxHundredScore,
//     required this.qustions,
//     required this.answers,
//     required this.userAnswer,
//   });
//   @override
//   Widget build(BuildContext context) {
//     singlescoreArabic = arabicNumber.convert(singlescore);
//     maxSingleScoreArabic = arabicNumber.convert(maxSingleScore);
//     tensscoreArabic = arabicNumber.convert(tensscore);
//     maxtensscoreArabic = arabicNumber.convert(maxTensScore);
//     hundredscoreArabic = arabicNumber.convert(hundredscore);
//     maxhundredscoreArabic = arabicNumber.convert(maxHundredScore);

//     textDirection:
//     TextDirection.rtl;
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/farm.jpg'),
//           fit: BoxFit.cover,
//         ),
//       ),

//       //backgroundColor: Colors.white,
//       child: Center(
//         child: Column(
//           textDirection: TextDirection.rtl,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text("لقد حصلت على: \n",
//                 style: TextStyle(
//                   decoration: TextDecoration.none,
//                   fontSize: 25,
//                   fontFamily: 'ReadexPro-Regular',
//                   color: Color(0XFF1ea366),
//                 )),
//             Text(
//                 "${singlescoreArabic.toString()} من ${maxSingleScoreArabic.toString()} في جمع الآحاد",
//                 style: TextStyle(
//                   decoration: TextDecoration.none,
//                   fontSize: 25,
//                   fontFamily: 'ReadexPro-Regular',
//                   color: Color(0XFF1ea366),
//                 )),
//             //SizedBox(height: 30),
//             Text(
//                 "${tensscoreArabic.toString()} من ${maxtensscoreArabic.toString()} في جمع العشرات",
//                 style: TextStyle(
//                   decoration: TextDecoration.none,
//                   fontSize: 25,
//                   fontFamily: 'ReadexPro-Regular',
//                   color: Color(0XFF1ea366),
//                 )),
//             // SizedBox(height: 30),
//             Text(
//                 "${hundredscoreArabic.toString()} من ${maxhundredscoreArabic.toString()} في جمع المئات",
//                 style: TextStyle(
//                   decoration: TextDecoration.none,
//                   fontSize: 25,
//                   fontFamily: 'ReadexPro-Regular',
//                   color: Color(0XFF1ea366),
//                 )),
//             // Text("OUT OF ${maxScore.toString()}",
//             //     style: TextStyle(
//             //       fontSize: 20,
//             //       color: Colors.black,
//             //     )),
//             SizedBox(height: 30),
//             NiceButtons(
//               stretch: false,
//               width: 80.0,
//               height: 60.0,
//               onTap: () => Navigator.pushReplacement(
//                   context, MaterialPageRoute(builder: (context) => MyApp())),
//               child: Text("حسنا",
//                   style: TextStyle(
//                       color: Colors.white,
//                       decoration: TextDecoration.none,
//                       fontFamily: 'ReadexPro-Regular',
//                       fontSize: 25)),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             // MaterialButton(
//             //   onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UserAnswerScreen(answers: answers, qustions: qustions, userAnswer: userAnswer))),
//             //   child: Text("Check Your Answer", style: TextStyle(color: Colors.blueAccent)),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
