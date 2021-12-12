// ignore_for_file: deprecated_member_use

import 'package:deafsseashell/Verification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Verification.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final auth = FirebaseAuth.instance;
  String email = '';
  String name = '';
  String password = '';
  String passwordconfirmation = '';
  bool loading = false;
  bool isHidden = true;
  bool isHidden2 = true;

  void validation() {
    if (name.trim().isEmpty ) {
      Fluttertoast.showToast(msg: 'Please Enter your name',gravity: ToastGravity.BOTTOM,);
      return;
    }

    if (email.trim().isEmpty ) {
      Fluttertoast.showToast(msg: 'Please Enter your email',gravity: ToastGravity.BOTTOM,);
      return;
    }
    if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      Fluttertoast.showToast(msg: 'Please Enter a valid email',gravity: ToastGravity.BOTTOM,);
      return;
    }

    if (password.trim().isEmpty || !RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(password) && password.length < 8 ) {
      Fluttertoast.showToast(msg: 'Please Enter a valid password',gravity: ToastGravity.BOTTOM,);
      return;
    }
    if (passwordconfirmation.trim().isEmpty  || passwordconfirmation.trim() != password.trim()) {
      Fluttertoast.showToast(msg: 'Invalid passwordConf',gravity: ToastGravity.BOTTOM,);

      return;
    }
    else {
      setState(() {
        loading = false;
      });
      return;
    }}


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
                              child: Text('Create your account',
                                style: TextStyle(color: Color(0xff3F414E),
                                    fontFamily: 'Lato',
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold),)),
                          SizedBox(height: 80.0,),
                          Container(
                            margin: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Color(0xff7583CA),
                            ),
                            child: TextButton(onPressed: () {

                            }, child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('Images/fbicon.svg'),
                                  SizedBox(width: 10.0,),
                                  Text('CONTINUE WITH FACEBOOK',
                                    style: TextStyle(color: Colors.white,
                                      fontFamily: 'Lato',
                                      fontSize: 14,),)
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
                            child: TextButton(
                              onPressed: () => signInWithGoogle(),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('Images/googleicon.svg'),
                                    SizedBox(width: 15.0,),
                                    Text('CONTINUE WITH GOOGLE  ',
                                      style: TextStyle(color: Color(0xff3F414E),
                                        fontFamily: 'Lato',
                                        fontSize: 14,),)
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
                    margin: EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20.0),
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
                        hintStyle: TextStyle(fontSize: 16.0, color: Color(
                            0xffA1A4B2), fontFamily: 'Lato'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20.0),
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
                        hintStyle: TextStyle(fontSize: 16.0, color: Color(
                            0xffA1A4B2), fontFamily: 'Lato'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20.0),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          password = value.trim();
                        });
                      },
                      obscureText: isHidden,
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
                        hintStyle: TextStyle(fontSize: 16.0, color: Color(
                            0xffA1A4B2), fontFamily: 'Lato'),
                        suffixIcon: IconButton(
                          icon: isHidden ? Icon(Icons.visibility_off): Icon(Icons.visibility),
                          onPressed: (){
                            setState(() {
                              isHidden =!isHidden;
                            });
                          },
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,


                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20.0),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          passwordconfirmation = value.trim();
                        });
                      },
                      obscureText: isHidden2,
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
                        hintStyle: TextStyle(fontSize: 16.0, color: Color(
                            0xffA1A4B2), fontFamily: 'Lato'),
                        suffixIcon: IconButton(
                          icon:
                          isHidden2 ? Icon(Icons.visibility_off): Icon(Icons.visibility),
                          onPressed: (){
                            setState(() {
                              isHidden2 =!isHidden2;
                            });
                          },
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 100.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Color(0xffA59EBD),
                      ),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              validation();
                              userSetup(name);
                            });
                            _signin(name,email, password);

                          } ,
                          child: Text(
                            'Get started', style: TextStyle(color: Colors.white, fontFamily: 'Lato'),),),),
                  SizedBox(height: 20.0,),
                ],
              ),
            ),
          ),
        ),
      );
    }


    _signin(String name, String email, String password) async {

        await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Verification()));
        User? user;
        user=FirebaseAuth.instance.currentUser;
        user!.updateProfile(displayName: name);

    }
}


  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth = await googleuser!.authentication;

    final
    OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken
    );
    Fluttertoast.showToast(msg: "Account created");
    return await FirebaseAuth.instance.signInWithCredential(credential);

  }

Future <void> userSetup(String displayname) async{
  FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  String uid = auth.currentUser!.uid.toString();
  users.add({
    'Name': displayname, uid : uid,
  });

  return;
}