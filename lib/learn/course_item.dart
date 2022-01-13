


import 'package:flutter/material.dart';

class CoursesItem extends StatelessWidget{
  final String id;
  final String title;
  final String img;

  CoursesItem(this.id,this.title,this.img);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
                              width: 144,
                              height: 144,
                              margin:EdgeInsets.only(left: 15,bottom: 10) ,
                              padding:EdgeInsets.only(bottom:2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.brown[50],
                                  image: DecorationImage(
                                    alignment: Alignment.center,
                                      image: AssetImage(
                                          img
                                      ) ),
                          
                              ),
                              child:Center(
                                child: Align(
                                  alignment:Alignment.bottomCenter,
                                  child: Text(
                                    title,
                                    style:TextStyle(
                                      fontFamily: 'Nunito Sans',
                                      fontSize: 20,
                                      color: Colors.brown[600],
                                     )

                                    ),
                                )),
                               
                          
                            ),

    );
  }


}