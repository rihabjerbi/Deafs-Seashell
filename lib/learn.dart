import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'learn/Food.dart';


class Learn extends StatefulWidget{
  const Learn({Key?key}):super(key: key);

  
  @override
  _LearnState createState() => _LearnState();
  }

class _LearnState extends State<Learn>{

  

  List info=[];


  _initData(){
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      info=json.decode(value);

    });
  }

  @override
  void initState(){
    super.initState();
    _initData();
  }
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      home:Scaffold(
       
        body: SafeArea(
         
            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 0, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Image.asset("Images/logo1.png"),
                      Text(
                        "Hi,Afsar",
                        style: TextStyle(fontSize: 24,fontFamily: 'Nunito Sans'),),
                      SvgPicture.asset("Images/Vector.svg"),
                    ],
                  ),
                  ActionList(),
                  
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: info.length.toDouble()~/2,
                      itemBuilder: (_,i){
                        int a=2*i;
                        int b=2*i+1;
                        return Row(
                          children: [
                  
                               
                           
                              
                              
                                GestureDetector(
                                  onTap: (){
                                   Navigator.push(
                                     context,
                                     MaterialPageRoute(builder: (context) => Food()),
                          );  
                                  },
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
                                                info[a]['img']
                                            ) ),
                                                            
                                    ),
                                    child:Center(
                                      child: Align(
                                        alignment:Alignment.bottomCenter,
                                        child: Text(
                                          info[a]['title'],
                                          style:TextStyle(
                                            fontFamily: 'Nunito Sans',
                                            fontSize: 20,
                                            color: Colors.brown[600],
                                           )
                                  
                                          ),
                                      )),
                                     
                                                            
                                                              ),
                                ),
                                
                        
                            
                  
                            
                           
                               GestureDetector(
                                 onTap: (){
                                    Navigator.push(
                                     context,
                                     MaterialPageRoute(builder: (context) => Food()),
                          );
                                  },
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
                                                info[b]['img']
                                            ) ),
                                                          
                                    ),
                                    child:Center(
                                      child: Align(
                                        alignment:Alignment.bottomCenter,
                                        child: Text(
                                          info[b]['title'],
                                          style:TextStyle(
                                            fontFamily: 'Nunito Sans',
                                            fontSize: 20,
                                            color: Colors.brown[600],
                                           )
                                          ),
                                      )),
                                                          
                                  ),
                               ),
                              
                            
                  
                            
                            
                          ],);
                      },
                    ),
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
      margin: EdgeInsets.symmetric(vertical: 20.0 / 2),
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
              // At end item it add extra 20 right  padding
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

