import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Learn extends StatefulWidget{
  const Learn({Key?key}):super(key: key);


  @override
  _LearnState createState() => _LearnState();
}

class _LearnState extends State<Learn>{
  final auth = FirebaseAuth.instance;
  User? user;

  List info=[];
  _initData(){
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      info=json.decode(value);
    });
  }
  @override
  void initState(){
    super.initState();
    user=auth.currentUser;
    _initData();
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home:Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.0,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 30.0,),
                    Image.asset("Images/logo.png",height: 65,width: 58, ),
                    SizedBox(width: 20.0,),
                    Text("Hi, ${user!.displayName}", style: TextStyle(fontSize: 30,fontFamily: 'Lato',),),
                  ],
                ),
                Stack(
                  children: [
                    SvgPicture.asset('Images/shape.svg'),
                    Column(
                      children: <Widget>[
                        SizedBox(height: 40.0,),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 40.0),
                            child: ActionList(),
                        ),
                        SizedBox(height: 20.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: (){},
                              child: Container(
                                height: 144,
                                width: 144,
                                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.grey[300],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image(image: AssetImage('Images/letters.png'),),
                                    Text('Letters',style: TextStyle(fontFamily: 'Lato',color: Colors.brown,fontSize: 18),),
                                  ],
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: (){},
                              child: Container(
                                height: 144,
                                width: 144,
                                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.grey[300],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image(image: AssetImage('Images/presentation.png',),),
                                    Text('Presentation',style: TextStyle(fontFamily: 'Lato',color: Colors.brown,fontSize: 18),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: (){},
                              child: Container(
                                height: 144,
                                width: 144,
                                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.grey[300],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image(image: AssetImage('Images/polite.png'),),
                                    Text('Politeness',style: TextStyle(fontFamily: 'Lato',color: Colors.brown,fontSize: 18),),
                                  ],
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: (){},
                              child: Container(
                                height: 144,
                                width: 144,
                                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.grey[300],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image(image: AssetImage('Images/food.png',),),
                                    Text('Food',style: TextStyle(fontFamily: 'Lato',color: Colors.brown,fontSize: 18),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: (){},
                              child: Container(
                                height: 144,
                                width: 144,
                                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.grey[300],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image(image: AssetImage('Images/animals.png'),),
                                    Text('Animals',style: TextStyle(fontFamily: 'Lato',color: Colors.brown,fontSize: 18),),
                                  ],
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: (){},
                              child: Container(
                                height: 144,
                                width: 144,
                                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.grey[300],
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Image(image: AssetImage('Images/clothes.png',),),
                                    Text('Clothes',style: TextStyle(fontFamily: 'Lato',color: Colors.brown,fontSize: 18),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: (){},
                              child: Container(
                                height: 144,
                                width: 144,
                                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.grey[300],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Image(image: AssetImage('Images/nature.png'),),
                                    Text('Nature',style: TextStyle(fontFamily: 'Lato',color: Colors.brown,fontSize: 18),),
                                  ],
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: (){},
                              child: Container(
                                height: 144,
                                width: 144,
                                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.grey[300],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Image(image: AssetImage('Images/feelings.png',),),
                                    Text('Feelings',style: TextStyle(fontFamily: 'Lato',color: Colors.brown,fontSize: 18),),
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

              ],
            ),
          ),

        ),
      ),

    );
  }
}

class ActionList extends StatefulWidget{
  @override
  _ActionListState createState()=>_ActionListState();

}

class _ActionListState extends State<ActionList> {
  // by default first item will be selected
  int selectedIndex=0;
  List actions=['Learn','Practice','Test'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0 / 2),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actions.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: 20.0,
              right: index == actions.length - 1 ? 20.0 : 0,
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: index == selectedIndex
                  ? Colors.brown.withOpacity(0.4)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              actions[index],
              style: TextStyle(color: Colors.brown),
            ),
          ),
        ),
      ),
    );
  }
}