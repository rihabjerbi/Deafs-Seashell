
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final auth = FirebaseAuth.instance;
  User? user;
  @override
  void initState() {
    user=auth.currentUser;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
                        SizedBox(height: 20.0,),
                        Row(
                          children: [
                            SizedBox(
                              width: 40.0,
                            ),
                            Image(
                              image: AssetImage('Images/logo.png'),
                              height: 70,
                              width: 63,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              'D e a f \' s  S e a s h e l l',
                              style: TextStyle(fontSize: 24, fontFamily: 'Aladin'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'M y  P r o f i l e',
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30.0,),
                        Container(
                          height: height*0.18,
                          child: Image(image: AssetImage('Images/personicon.png',)),
                        ),
                        Text(
                          'Be happy and smile',
                          style: TextStyle(
                            color: Color(0xffA1A4B2),
                              fontSize: 20,
                              fontFamily: 'Aladin',),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  margin: EdgeInsets.symmetric(horizontal: 40.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color(0xffeebeb1),
                  ),
                  child: Column(
                    children: [
                      Text('${user!.displayName}',style: TextStyle(fontFamily: 'Lato',fontWeight:FontWeight.w400,fontSize: 24,color: Colors.white),),
                      SizedBox(height: 20.0,),
                      Text('${user!.email}',style: TextStyle(fontFamily: 'Lato',fontWeight:FontWeight.w400,fontSize: 18,color: Colors.white),),

                    ],
                  ),

                ),
                SizedBox(height: 40.0,),
                TextButton(onPressed: (){}, child: Text('Update Profile',style: TextStyle(fontWeight:FontWeight.w400,fontSize: 18,color: Color(0xffA1A4B2)),)),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
