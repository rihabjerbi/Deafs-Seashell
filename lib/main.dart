import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'SplashScreen.dart';
import 'SignUp.dart';
import 'LogIn.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Home());
}

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child:Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20.0,left: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Deaf\'s',
                            style: TextStyle(fontSize: 24,fontFamily: 'Aladin'),
                          ),
                          Image(image: AssetImage('Images/logo.png'),height: 58,width: 54,),
                          Text(
                            'Seashell',
                            style: TextStyle(fontSize: 24,fontFamily: 'Aladin'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                        margin: EdgeInsets.only(left: 40.0,top: 0.0,right: 40.0,bottom: 0.0),
                        child: Image(image: AssetImage('Images/im1.png'),)),
                    SizedBox(height: 20,),
                    Stack(
                      children: [
                        SvgPicture.asset('Images/Frame.svg'),
                        Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 130.0),
                                alignment: Alignment.center,
                                child: Text('We are what we do',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color(0xff3F414E),fontFamily: 'Aladin'),)),
                            SizedBox(height: 20.0,),
                            Text('It\'s not a disability, it\'s a different ability',style: TextStyle(fontSize: 16,color: Color(0xffA1A4B2),fontFamily: 'Lato'),),
                            SizedBox(height: 40.0,),
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 100.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Color(0xffA59EBD),
                                ),
                                child: Builder(
                                  builder: (context) => Container(
                                    child: TextButton(onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => SignUp()),
                                      );
                                    }, child: Text('Sign up',style: TextStyle(color: Colors.white,fontFamily: 'Lato'),)),
                                  ),
                                )),
                            SizedBox(height: 20.0,),
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 100.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Color(0xffA59EBD),
                                ),
                                child: Builder(
                                  builder: (context) => Container(
                                    child: TextButton(onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => LogIn()),
                                      );
                                    }, child: Text('Log in',style: TextStyle(color: Colors.white,fontFamily: 'Lato'),)),
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
