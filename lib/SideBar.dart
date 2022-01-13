import 'package:deafsseashell/Profile.dart';
import 'package:deafsseashell/aboutUs.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Profile.dart';
import 'LogIn.dart';
//import 'help.dart';
import 'settings.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  final auth = FirebaseAuth.instance;
  User? user;
  @override
  void initState() {
    user=auth.currentUser;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final name = user!.displayName.toString();
    final email = user!.email.toString();
    final photoURL ='https://library.kissclipart.com/20191119/oxq/kissclipart-interface-icon-user-icon-profile-user-icon-ecaea47ab8810f35.png';
    return Drawer(
      child: Material(
        color: Color(0xffeebeb1),
        child: ListView(
          children: <Widget>[
            buildHeader(
                urlImage: photoURL,
                name: name,
                email: email,
                onClicked: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Profile()));
                }),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Divider(color: Colors.white70),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Profile',
                    icon: Icons.person,
                    onClicked: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Profile())),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Settings',
                    icon: Icons.settings_sharp,
                    onClicked: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Settings())),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'About',
                    icon: Icons.workspaces_outline,
                    onClicked: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AboutUs())),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Help',
                    icon: Icons.help_outline,
                    onClicked: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AboutUs())),
                  ),
                  const SizedBox(height: 24),
                  Divider(color: Colors.white70),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Logout',
                    icon: Icons.logout_outlined,
                    onClicked: () async{
                      await FirebaseAuth.instance.signOut();
                      Navigator.push(context,MaterialPageRoute(builder: (context) => LogIn()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
}


  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),

            ],
          ),
        ),
      );



  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();


    }
  }
