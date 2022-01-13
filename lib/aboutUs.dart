import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(child: Center(
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              Row(
                children: [
                  SizedBox(width: 50.0,),
                  Image(image: AssetImage('Images/logo.png'),height: 70,width: 63,),
                  SizedBox(width: 20.0,),
                  Text(
                    'D e a f \' s  S e a s h e l l',
                    style: TextStyle(fontSize: 24,fontFamily: 'Aladin'),
                  ),
                ],
              ),
              Container(
                  height: height*0.25,
                  child: Image(image:AssetImage('Images/aboutus.png'),)),
              SizedBox(height: 20.0,),
              Text('About Us',style: TextStyle(color: Color(0xff3F414E),
                  fontFamily: 'Lato',
                  fontSize: 36,
                  fontWeight: FontWeight.bold),),
              SizedBox(height: 30.0,),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text('Deaf\'s seashell is a mobile application aiming to provide the deaf community with a smart tool that spots and translates the voices around them, allows discussing with other users as well as learning sign language.',
                  style: TextStyle(fontFamily: 'Lato',
                    fontSize: 18,),)),
              SizedBox(height: 50.0,),
              Text('Developed by: Sup\'Com Students, Tunisia',style: TextStyle(fontFamily: 'Lato',
                fontSize: 10,fontWeight: FontWeight.bold),)

            ],
          ),
        )),
      ),
    );
  }
}
