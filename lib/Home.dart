import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Translation.dart';
import 'learn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'SideBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final auth = FirebaseAuth.instance;
  User? user;
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    user=auth.currentUser;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _globalKey,
        drawer: NavigationDrawerWidget(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height:20.0 ,),
                Stack (
                  children: [
                    IconButton(onPressed: (){
                      _globalKey.currentState!.openDrawer();
                    }, icon: Icon(Icons.menu_rounded,size: 40.0,),
                      color: Colors.black,),
                    Row(
                      children: [
                        SizedBox(width: 70.0,),
                        Image(image: AssetImage('Images/logo.png'),height: 70,width: 63,),
                        SizedBox(width: 20.0,),
                        Text(
                          'D e a f \' s  S e a s h e l l',
                          style: TextStyle(fontSize: 24,fontFamily: 'Aladin'),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 40.0,),
                Text('Hi ${user!.displayName}, Welcome ',style: TextStyle(fontSize: 30,fontFamily: 'Lato',color: Color(0xffDCCBC4),),),
                Stack(
                  children: [
                    SvgPicture.asset('Images/shape.svg'),
                    Column(
                      children: [
                        SizedBox(height: 120.0,),
                        Text('Choose a topic to focus on : ',style:TextStyle(color: Color(0xffA1A4B2),fontFamily: 'Lato',fontSize: 20,),),
                        SizedBox(height: 20.0,),
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Translation()));
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 20.0,bottom: 15.0,top: 15.0),
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffeebeb1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Translation',style: TextStyle(color: Color(0xff3F414E),fontSize: 18,fontFamily: 'Lato'),),
                                Image(image: AssetImage('Images/111.png'),height: 93.0,width: 230.0,),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Learn()));
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 20.0,bottom: 15.0,top: 15.0),
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffeebeb1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Learn',style: TextStyle(color: Color(0xff3F414E),fontSize: 18,fontFamily: 'Lato'),),
                                Image(image: AssetImage('Images/22.png'),height: 93.0,width: 230.0,),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        TextButton(
                          onPressed: (){},
                          child: Container(
                            padding: EdgeInsets.only(left: 20.0,bottom: 15.0,top: 15.0),
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffeebeb1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Chat',style: TextStyle(color: Color(0xff3F414E),fontSize: 18,fontFamily: 'Lato'),),
                                Image(image: AssetImage('Images/33.png'),height: 93.0,width: 230.0,),
                              ],
                            ),
                          ),
                        ),
                      ],
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
