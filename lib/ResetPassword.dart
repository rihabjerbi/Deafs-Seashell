import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  String email='';
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 30.0,),
                Row(
                  children: [
                    SizedBox(width: 40.0,),
                    Image(image: AssetImage('Images/logo.png'),height: 70,width: 63,),
                    SizedBox(width: 20.0,),
                    Text(
                      'D e a f \' s  S e a s h e l l',
                      style: TextStyle(fontSize: 24,fontFamily: 'Aladin'),
                    ),
                  ],
                ),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 80.0),
                    child: Text('Reset Password',style: TextStyle(color: Color(0xff3F414E),fontFamily: 'Lato',fontSize: 28,fontWeight: FontWeight.w500),),
                ),
                SizedBox(height: 20.0,),
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
                SizedBox(height: 20.0,),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 100.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color(0xffA59EBD),
                    ),
                    child: TextButton(onPressed: (){
                      auth.sendPasswordResetEmail(email: email);
                      Navigator.of(context).pop();
                    },
                        child: Text('Send Request',style: TextStyle(color: Colors.white,fontFamily: 'Lato'),)),
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
