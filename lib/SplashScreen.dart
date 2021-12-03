import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 5000),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyHomePage(title: 'Flutter Demo')));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage('Images/Background.png'),
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(50.0, 100.0, 50.0,0.0),
                      child: Image(image: AssetImage('Images/logo2.png'),)),
                  SizedBox(height: 20.0,),
                  Text('Deaf\'s Seashell',style: TextStyle(fontSize: 48,fontFamily: 'Lato',fontWeight: FontWeight.bold,color: Colors.white),),
                  SizedBox(height: 70.0,),
                  Text('Your ear to hear the world',style: TextStyle(fontSize: 18,fontFamily: 'Lato',color: Colors.white)),
                  SizedBox(height: 50.0,),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
