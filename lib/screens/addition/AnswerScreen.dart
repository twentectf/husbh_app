import 'package:flutter/material.dart';
import 'package:husbh_app/main.dart';
import 'package:husbh_app/screens/learn_page.dart';
import 'package:nice_buttons/nice_buttons.dart';
// import 'package:fabexdateformatter/fabexdateformatter.dart';

class AnswerScreen extends StatelessWidget {
  final singlescore;
  final tensscore;
  final hundredscore;
  final maxSingleScore;
  final maxTensScore;
  final maxHundredScore;
  final List qustions;
  final List answers;
  final List userAnswer;

  AnswerScreen(
      {this.singlescore,
      this.tensscore,
      this.hundredscore,
      this.maxSingleScore,
      this.maxTensScore,
      this.maxHundredScore,
      required this.qustions,
      required this.answers,
      required this.userAnswer});

  @override
  Widget build(BuildContext context) {
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
                "${singlescore.toString()} من ${maxSingleScore.toString()} في جمع الآحاد",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 25,
                  fontFamily: 'ReadexPro-Regular',
                  color: Color(0XFF1ea366),
                )),
            //SizedBox(height: 30),
            Text(
                "${tensscore.toString()} من ${maxTensScore.toString()} في جمع العشرات",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 25,
                  fontFamily: 'ReadexPro-Regular',
                  color: Color(0XFF1ea366),
                )),
            // SizedBox(height: 30),
            Text(
                "${hundredscore.toString()} من ${maxHundredScore.toString()} في جمع المئات",
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
                  context, MaterialPageRoute(builder: (context) => learn_page())),
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
