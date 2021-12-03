import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'SignUp.dart';
import 'Home.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

bool validator(final value) {
  if (value == null || value.isEmpty) {
    return false;
  }
  return true;
}

class _LogInState extends State<LogIn> {
  final auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    SvgPicture.asset('Images/Frame2.svg'),
                    Column(
                      children: [
                        Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 80.0),
                            child: Text(
                              'WELCOME BACK!',
                              style: TextStyle(
                                  color: Color(0xff3F414E),
                                  fontFamily: 'Lato',
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 80.0,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Color(0xff7583CA),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('Images/fbicon.svg'),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'CONTINUE WITH FACEBOOK',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Lato',
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Color(0xffEBEAEC),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('Images/googleicon.svg'),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Text(
                                    'CONTINUE WITH GOOGLE  ',
                                    style: TextStyle(
                                      color: Color(0xff3F414E),
                                      fontFamily: 'Lato',
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 100.0),
                            child: Text(
                              'OR LOG IN WITH EMAIL',
                              style: TextStyle(
                                  color: Color(0xffA1A4B2),
                                  fontFamily: 'Lato',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {
                        email = value.trim();
                      });

                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffF2F3F7),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: const Color(0xffF2F3F7), width: 2)),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xffA1A4B2),
                          fontFamily: 'Lato'),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        password = value.trim();
                      });
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffF2F3F7),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: const Color(0xffF2F3F7), width: 2)),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xffA1A4B2),
                          fontFamily: 'Lato'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 2.0, horizontal: 100.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color(0xffA59EBD),
                  ),
                  child: TextButton(
                        onPressed: () {
                          auth.signInWithEmailAndPassword(email: email, password: password).then((_) => {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()))
                          });
                        },
                        child: Text(
                          'Get started',
                          style: TextStyle(color: Colors.white, fontFamily: 'Lato'),
                        ),
                      ),

                ),
                TextButton(onPressed: (){},
                  child:Text('Forgot Password?',style:TextStyle(color: Color(0xff3F414E),fontSize: 10,fontFamily: 'Lato'),),),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('YOU DON’T HAVE AN ACCOUNT?',style: TextStyle(color: Color(0xffA1A4B2),fontSize: 12,fontFamily: 'Lato'),),
                    Builder(
                      builder: (context) => Container(
                        child: TextButton(onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );


                        },
                          child:Text('SIGN UP',style:TextStyle(color: Color(0xff8E97FD),fontSize: 12,fontFamily: 'Lato'),),),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
