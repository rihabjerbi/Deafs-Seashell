import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Home.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final auth = FirebaseAuth.instance;
  User? user;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    user=auth.currentUser;
    user!.sendEmailVerification();
    timer =  Timer.periodic(Duration(seconds: 5),(timer){
      chechEmailVerified();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage('Images/Background.png'),
        ),
      ),
      child: Scaffold(
        body: Center(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
            ),
            child: Text('An email has been sent to ${user!.email} please verify'),
          ),
        ),
      ),
    );
  }

  Future<void> chechEmailVerified()async{
    user = auth.currentUser;
    await user!.reload();
    if(user!.emailVerified){
      timer.cancel();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    }

  }
}
