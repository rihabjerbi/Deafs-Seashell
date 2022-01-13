import 'package:deafsseashell/ResetPassword.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'LogIn.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(children: [
            SizedBox(
              height: 20.0,
            ),
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
              height: 25.0,
            ),
            Text(
              ' S  E  T  T  I  N  G  S ',
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20.0,
                ),
                Icon(
                  Icons.person,
                  size: 30.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Lato',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Edit profile',
                    style: TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ],
              ),
            ),
            //SizedBox(height: 15.0,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Change password',
                    style: TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => ResetPassword()));
                    },
                    icon: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20.0,
                ),
                Icon(
                  Icons.settings_sharp,
                  size: 30.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Other',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Lato',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notifications',
                    style: TextStyle(fontSize: 18),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  )
                ],
              ),
            ),
            //SizedBox(height: 15.0,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Language',
                    style: TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.keyboard_arrow_down_sharp,size: 40,),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0,),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 30.0,),
              padding: EdgeInsets.symmetric(vertical: 2.0,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Color(0xffA59EBD),
              ),
              child: TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => LogIn()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout_outlined,color: Colors.black,),
                    SizedBox(width: 10.0,),
                    Center(child: Text('Logout',style: TextStyle(fontSize: 18,color: Colors.black,),)),

                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.grey;
  }
}
