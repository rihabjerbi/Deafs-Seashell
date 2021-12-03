import 'package:deafsseashell/Verification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Verification.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}
bool validator(final value) {
  if (value == null || value.isEmpty) {
    return false;
  }
  return true;
}
class _SignUpState extends State<SignUp> {
  final auth = FirebaseAuth.instance;
  String email='';
  String name='';
  String password='';
  String passwordconfirmation='';

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
                            child: Text('Create your account',style: TextStyle(color: Color(0xff3F414E),fontFamily: 'Lato',fontSize: 36,fontWeight: FontWeight.bold),)),
                        SizedBox(height: 80.0,),
                        Container(
                          margin: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Color(0xff7583CA),
                          ),
                          child: TextButton(onPressed: (){}, child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('Images/fbicon.svg'),
                                SizedBox(width: 10.0,),
                                Text('CONTINUE WITH FACEBOOK',style: TextStyle(color: Colors.white,fontFamily: 'Lato',fontSize: 14,),)
                              ],
                            ),
                          ),),),
                          SizedBox(height: 20.0,),
                          Container(
                            margin: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Color(0xffEBEAEC),
                            ),
                            child: TextButton(onPressed: (){}, child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('Images/googleicon.svg'),
                                  SizedBox(width: 15.0,),
                                  Text('CONTINUE WITH GOOGLE  ',style: TextStyle(color: Color(0xff3F414E),fontFamily: 'Lato',fontSize: 14,),)
                                ],
                              ),
                            ),
                            ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        name = value.trim();
                      });

                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffF2F3F7),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: const Color(0xffF2F3F7),
                            )
                        ),
                        hintText: 'Full name',
                        hintStyle: TextStyle(fontSize: 16.0, color: Color(0xffA1A4B2),fontFamily: 'Lato'),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
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
                              color: const Color(0xffF2F3F7),
                              width: 2
                          )
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(fontSize: 16.0, color: Color(0xffA1A4B2),fontFamily: 'Lato'),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
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
                              color: const Color(0xffF2F3F7),
                              width: 2
                          )
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(fontSize: 16.0, color: Color(0xffA1A4B2),fontFamily: 'Lato'),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        passwordconfirmation = value.trim();
                      });

                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffF2F3F7),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: const Color(0xffF2F3F7),
                              width: 2
                          )
                      ),
                      hintText: 'Password confirmation',
                      hintStyle: TextStyle(fontSize: 16.0, color: Color(0xffA1A4B2),fontFamily: 'Lato'),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 100.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color(0xffA59EBD),
                    ),
                    child: TextButton(onPressed: (){
                      auth.createUserWithEmailAndPassword(email: email, password: password).then((_) => {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Verification()))
                      });

                    }, child: Text('Get started',style: TextStyle(color: Colors.white,fontFamily: 'Lato'),))),
                SizedBox(height: 20.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
