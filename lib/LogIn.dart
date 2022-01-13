import 'package:deafsseashell/ResetPassword.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'SignUp.dart';
import 'Home.dart';
import 'ResetPassword.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool isHidden = true;
  var loading = false ;

  Future<void> validation() async {
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

    else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isLoggedIn", true);
      setState(() {
        loading = false;
      });
      return;
    }}
  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;
    print(status);
    runApp(MaterialApp(home: status == true ? _login(email,password) : Home()));
  }

  void _logInWithFacebook() async {
    setState(() {loading = true;} );
    try{
      final facebookLoginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();
      final facebookAuthCredential = FacebookAuthProvider.credential(facebookLoginResult.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      await FirebaseFirestore.instance.collection('users').add({
        'email': userData['email'],
        'imageUrl': userData['picture']['data']['url'],
        'name':['name'],
      });
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>Home()), (route) => false);

    }on FirebaseAuthException catch (e){
      var title='';
      switch(e.code){
        case'account-exists-with-different-credential':
          title='This account exists with a different sign in provider';
          break;
        case'invalid-credential':
          title='Unknown error has occurred';
          break;
        case'operation-not-allowed':
          title='This operation is not allowed';
          break;
        case'user-disabled':
          title='The user you tried to log into is disabled ';
          break;
        case'user-not-found':
          title='he user you tried to log into was not found';
          break;
      }
      showDialog(context: context, builder: (context)=>AlertDialog(
        title: Text('Log in with facebook failed'),
        content: Text(title),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text('OK'))
        ],
      )

      );
    }
    finally{
      setState(() {
        loading = false;
      });
    }
  }
  void _logInWithGoogle() async {
    setState(() {
      loading=true;
    });
    final googleSignIn = GoogleSignIn(scopes:['email']);
    try{
      final googleSignInAccount = await googleSignIn.signIn();
      if(googleSignInAccount==null){
        setState(() {
          loading=false;
        });
        return;
      }
      final googleSignInAuthentification = await googleSignInAccount.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentification.accessToken,
        idToken: googleSignInAuthentification.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      await FirebaseFirestore.instance.collection('users').add({
        'email': googleSignInAccount.email,
        'imageUrl': googleSignInAccount.photoUrl,
        'name':googleSignInAccount.displayName,
      });
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>Home()), (route) => false);

    }on FirebaseAuthException catch (e){
      var title='';
      switch(e.code){
        case'account-exists-with-different-credential':
          title='This account exists with a different sign in provider';
          break;
        case'invalid-credential':
          title='Unknown error has occurred';
          break;
        case'operation-not-allowed':
          title='This operation is not allowed';
          break;
        case'user-disabled':
          title='The user you tried to log into is disabled ';
          break;
        case'user-not-found':
          title='he user you tried to log into was not found';
          break;
      }
      showDialog(context: context, builder: (context)=>AlertDialog(
        title: Text('Log in with google failed'),
        content: Text(title),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text('OK'))
        ],
      ),
      );
    }
    finally{
      setState(() {
        loading = false;
      });
    }
  }

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
                            onPressed: () {
                              _logInWithFacebook();
                            },
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
                            onPressed: () {
                              _logInWithGoogle();
                            },
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
                    obscureText: isHidden,
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
                          _login(email, password);

                        },
                        child: Text(
                          'Get started',
                          style: TextStyle(color: Colors.white, fontFamily: 'Lato'),
                        ),
                      ),

                ),
                TextButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ResetPassword(),),),
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
  _login(String email,String password) async {
    try{await auth.signInWithEmailAndPassword(email: email, password: password);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseAuthException catch(error){
      Fluttertoast.showToast(msg: error.message.toString(),gravity: ToastGravity.BOTTOM,);
    }

  }
}


