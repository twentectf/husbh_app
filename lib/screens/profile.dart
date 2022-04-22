import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:husbh_app/screens/login_screen.dart';
import 'WaitingScreen.dart';
import 'dart:math' as math;
import 'package:percent_indicator/percent_indicator.dart';

//bool WaitingScreen = false;
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MaterialApp(debugShowCheckedModeBanner: false, home: ProfilePage()));
// }

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
  //const ProfilePage({Key? key}) : super(key: key);
  String? email;
}

class _ProfilePageState extends State<ProfilePage> {
  late User user;
  final _auth = FirebaseAuth.instance;
  late User signedInUser;
  var id;
  var email;
  var name;
  var age;
  var sex;
  @override
  void initState() {
    super.initState();
    onRefresh(FirebaseAuth.instance.currentUser);
    getCurrentUser();
  }

  onRefresh(userCare) {
    setState(() {
      user = userCare;
    });
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        //  email = signedInUser.email;
        id = signedInUser.uid;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc["email"] != null && doc["email"] == signedInUser.email) {
          email = doc['email'];
          name = doc['name'];
          age = doc['age'];
          if (age == '٢') {
            age = 'سنتان';
          }
          else {
            age = age+ ' سنوات ';
          }
          sex = doc['sex'];
          print(name);
        }
      });
    });
  }

  Future<void> _signOut() async {
    try {
      await _auth.signOut();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    getData();
    return StreamBuilder<Object>(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (context, snapshot) {
          return FutureBuilder(
            future: getData(),
            builder: (context, snapshot) => snapshot.connectionState ==
                    ConnectionState.waiting
                ? Scaffold(
                    body: Stack(
                      children: [
                        Container(
                          width: MediaQuery.maybeOf(context)?.size.width,
                          decoration: BoxDecoration(
                              color: Theme.of(context).canvasColor,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30))),
                          // child: Text("plase wait")
                        ),
                        WaitingScreen(),
                      ],
                    ),
                  )

                // محتوى الصفحة
                : Directionality(
                    textDirection: TextDirection.rtl,
                    child: Scaffold(
                      backgroundColor: Colors.amber[300],
                      extendBodyBehindAppBar: true,
                      body: SafeArea(
                        child: Stack(
                          children: [
                            //زر الرجوع
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back_ios),
                                color: Color(0xff4A4857),
                              ),
                            ),
                            //زر تسجيل الخروج
                            Align(
                                alignment: Alignment.topLeft,
                                child: Transform.rotate(
                                  angle: 180 * math.pi / 180,
                                  child: IconButton(
                                    onPressed: () {
                                      AwesomeDialog(
                                        //if there is missing info this will be displayed
                                        context: context,
                                        dialogType: DialogType.WARNING,
                                        borderSide: BorderSide(
                                            color: Colors.green, width: 2),
                                        width: 280,

                                        buttonsBorderRadius: BorderRadius.all(
                                            Radius.circular(2)),
                                        headerAnimationLoop: false,
                                        animType: AnimType.BOTTOMSLIDE,
                                        title:
                                            'هل تريد تسجيل الخروج من التطبيق؟',
                                        btnCancelText: "إلغاء",
                                        btnOkText: "نعم",
                                        // desc:
                                        //     'هل أنت متأكد؟',
                                        btnCancelOnPress: () {},
                                        btnOkOnPress: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()),
                                          );
                                        },
                                        showCloseIcon: true,
                                      ).show();
                                    },
                                    icon: Icon(Icons.logout_rounded),
                                    color: Color(0xff4A4857),
                                  ),
                                )),


                              //الجزء الابيض اللي فيه المحتوى
                            Container(
                              margin: EdgeInsets.only(top: 110.0),
                              height: height,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                ),
                              ),
                            ),

                            // progress
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 150, right: 20),
                              child: Row(
                                children: [

                                  //الكونتينر الأبيض حق تقاريري
                                  Container(
                                    height: height / 2,
                                    width: width * 0.42,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 5,
                                          blurRadius: 5,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          SizedBox(height: 10),
                                          Text(
                                            'تقاريري',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'ReadexPro',
                                              color: Colors.brown,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          // تقاريري
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 40,
                                              vertical: 20,
                                            ),
                                            child: GridView(
                                                shrinkWrap: true,
                                                children: [
                                                  //الكونتينر البرتقالي حق الجمع
                                                  GestureDetector(
                                                    onTap: () {
                                                      print("add");

                                                      //البوب اب ويندو
                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              content: Stack(
                                                                overflow:
                                                                    Overflow
                                                                        .visible,
                                                                children: <
                                                                    Widget>[
                                                                  Positioned(
                                                                    right:
                                                                        -40.0,
                                                                    top: -40.0,
                                                                    child:
                                                                        InkResponse(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                      child:
                                                                          CircleAvatar(
                                                                        child: Icon(
                                                                            Icons.close),
                                                                        backgroundColor:
                                                                            Colors.red,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width:
                                                                        width /
                                                                            2,
                                                                    height:
                                                                        height,
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          });
                                                    },

                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color:
                                                            Colors.orange[500],
                                                        border: Border.all(
                                                          color: Colors
                                                              .orange[400]!,
                                                          width: 2,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.2),
                                                            spreadRadius: 5,
                                                            blurRadius: 5,
                                                            offset: Offset(0,
                                                                3), // changes position of shadow
                                                          ),
                                                        ],
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          '+',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 35,
                                                            fontFamily:
                                                                'ReadexPro',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),

                                                  //الكونتينر البرتقالي حق الطرح
                                                  GestureDetector(
                                                    onTap: () {
                                                      print("subtract");
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color:
                                                            Colors.orange[400],
                                                        border: Border.all(
                                                          color: Colors
                                                              .orange[300]!,
                                                          width: 2,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.2),
                                                            spreadRadius: 5,
                                                            blurRadius: 5,
                                                            offset: Offset(0,
                                                                3), // changes position of shadow
                                                          ),
                                                        ],
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          '-',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 35,
                                                            fontFamily:
                                                                'ReadexPro',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),

                                                  //الكونتينر البرتقالي حق الضرب
                                                  GestureDetector(
                                                    onTap: () {
                                                      print("multiplcation");
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color:
                                                            Colors.orange[300],
                                                        border: Border.all(
                                                          color: Colors
                                                              .orange[200]!,
                                                          width: 2,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.2),
                                                            spreadRadius: 5,
                                                            blurRadius: 5,
                                                            offset: Offset(0,
                                                                3), // changes position of shadow
                                                          ),
                                                        ],
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'x',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 30,
                                                            fontFamily:
                                                                'ReadexPro',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),

                                                  //الكونتينر البرتقالي حق القسمة
                                                  GestureDetector(
                                                    onTap: () {
                                                      print("division");
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color:
                                                            Colors.orange[200],
                                                        border: Border.all(
                                                          color: Colors
                                                              .orange[100]!,
                                                          width: 2,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.2),
                                                            spreadRadius: 5,
                                                            blurRadius: 5,
                                                            offset: Offset(0,
                                                                3), // changes position of shadow
                                                          ),
                                                        ],
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          '÷',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 35,
                                                            fontFamily:
                                                                'ReadexPro',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount:
                                                      2, // how much coulmn
                                                  crossAxisSpacing:
                                                      10, // vertical space
                                                  mainAxisSpacing: 10,
                                                  mainAxisExtent:
                                                      50, // here set custom Height You Want
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 18),

                                  //الكونتينر الابيض حق نقاطي
                                  Container(

                                    height: height / 2,
                                    width: width / 2,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 5,
                                          blurRadius: 5,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 10),
                                        Text(
                                          'نقاطي',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'ReadexPro',
                                            color: Colors.brown,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.0, vertical: 20),

                                              //النسب المئوية
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  print('add points');
                                                },
                                                child:
                                                    new CircularPercentIndicator(
                                                  radius: 40.0,
                                                  lineWidth: 13.0,
                                                  animation: true,
                                                  percent: 0.7,
                                                  center: new Text(
                                                    " ٧۰ %",
                                                    style: new TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15.0,
                                                      fontFamily: 'ReadexPro',
                                                    ),
                                                  ),
                                                  footer: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8.0),
                                                    child: new Text(
                                                      "عملية الجمع",
                                                      style: new TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12.0,
                                                        fontFamily: 'ReadexPro',
                                                      ),
                                                    ),
                                                  ),
                                                  circularStrokeCap:
                                                      CircularStrokeCap.round,
                                                  progressColor: Colors.purple,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  print('subtraction points');
                                                },
                                                child:
                                                    new CircularPercentIndicator(
                                                  radius: 40.0,
                                                  lineWidth: 13.0,
                                                  animation: true,
                                                  percent: 0.5,
                                                  center: new Text(
                                                    " ٥۰ %",
                                                    style: new TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15.0,
                                                      fontFamily: 'ReadexPro',
                                                    ),
                                                  ),
                                                  footer: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8.0),
                                                    child: new Text(
                                                      "عملية الطرح",
                                                      style: new TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12.0,
                                                        fontFamily: 'ReadexPro',
                                                      ),
                                                    ),
                                                  ),
                                                  circularStrokeCap:
                                                      CircularStrokeCap.round,
                                                  progressColor: Colors.green,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  print(
                                                      'multiplication points');
                                                },
                                                child:
                                                    new CircularPercentIndicator(
                                                  radius: 40.0,
                                                  lineWidth: 13.0,
                                                  animation: true,
                                                  percent: 0.35,
                                                  center: new Text(
                                                    " ۳٥ %",
                                                    style: new TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15.0,
                                                      fontFamily: 'ReadexPro',
                                                    ),
                                                  ),
                                                  footer: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8.0),
                                                    child: new Text(
                                                      "عملية الضرب",
                                                      style: new TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12.0,
                                                        fontFamily: 'ReadexPro',
                                                      ),
                                                    ),
                                                  ),
                                                  circularStrokeCap:
                                                      CircularStrokeCap.round,
                                                  progressColor: Colors.red,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  print('division points');
                                                },
                                                child:
                                                    new CircularPercentIndicator(
                                                  radius: 40.0,
                                                  lineWidth: 13.0,
                                                  animation: true,
                                                  percent: 0.17,
                                                  center: new Text(
                                                    " ۱٧ %",
                                                    style: new TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15.0,
                                                      fontFamily: 'ReadexPro',
                                                    ),
                                                  ),
                                                  footer: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8.0),
                                                    child: new Text(
                                                      "عملية القسمة",
                                                      style: new TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12.0,
                                                        fontFamily: 'ReadexPro',
                                                      ),
                                                    ),
                                                  ),
                                                  circularStrokeCap:
                                                      CircularStrokeCap.round,
                                                  progressColor:
                                                      Colors.lightBlue,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),


                              //معلومات الطفل اللي تطلع فوق
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 65, top: 10),
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: sex == "boy"
                                              ? AssetImage(
                                                  "images/husbh_boy.png")
                                              : AssetImage(
                                                  "images/husbh_girl.png"),
                                          scale: 0.02,
                                        ),
                                        border: Border.all(
                                          color: Colors.grey.shade200,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(40),
                                        boxShadow: [
                                          BoxShadow(
                                            // color: Colors
                                            //     .yellow
                                            //     .shade100,
                                            color: Colors.grey.shade300,
                                          )
                                        ]),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 17.0),
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.ende,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            name,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                color: Colors.brown,
                                                fontSize: 25,
                                                fontFamily: 'ReadexPro',
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(width: 20, height: 1),
                                          Text(age ,
                                              style: TextStyle(
                                                  color: Colors.brown,
                                                  fontSize: 10,
                                                  fontFamily: 'ReadexPro',
                                                  fontWeight: FontWeight.w700)),
                                          SizedBox(width: 20, height: 5),
                                          Text(email,
                                              style: TextStyle(
                                                  color: Colors.brown,
                                                  fontSize: 10,
                                                  fontFamily: 'ReadexPro',
                                                  fontWeight: FontWeight.w700))
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
          );
        });
  }
}
