import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';

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
  File? image;
  Future pickImage() async{
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image==null)return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
        user!.updatePhotoURL(imageTemporary.toString());
      });
    }on PlatformException catch(e){
      print('Failed to pick image : $e');
    }
  }
  Future uploadPic(BuildContext context) async{
    String fileName = basename(image!.path);
    Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = firebaseStorageRef.putFile(image!);
    TaskSnapshot taskSnapshot = await uploadTask;
    setState(() {
      print("Profile Picture uploaded");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
    });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    //final color = Theme.of(context).colorScheme.primary;
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
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
                  height: 10.0,
                ),
                Text(
                  'M y  P r o f i l e',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0,),

                Center(
                  child: Stack(
                    children: [
                      buildImage(),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: buildEditIcon(Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.0,),
                Container(
                  height: height * 0.4,
                  width: width * 0.8,
                  child: LayoutBuilder(builder: (context, contraints) {
                    double innerHeight = contraints.maxHeight;
                    double innerWidth = contraints.maxWidth;
                    return Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: innerHeight * 0.65,
                          width: innerWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Color(0xffeebeb1),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 50.0),
                              Text('${user!.displayName}',style: TextStyle(fontFamily: 'Lato',fontWeight:FontWeight.w400,fontSize: 24),),
                              SizedBox(height: 10.0,),
                              Text('${user!.email}',style: TextStyle(fontFamily: 'Lato',fontWeight:FontWeight.w400,fontSize: 24),),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.0),

                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),

                  child: TextButton(
                      onPressed: (){
                        uploadPic(context);
                      },
                      child: Text('update Profile',style: TextStyle(color: Colors.white,fontSize: 16),)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildImage() {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: image!=null ? ClipOval(child: Image.file(
          image!,width: 160,height: 160,fit: BoxFit.cover,)) : Image.network('https://www.pngitem.com/pimgs/m/20-203432_profile-icon-png-image-free-download-searchpng-ville.png',height: 130,),

      ),
    );

  }
  Widget buildEditIcon(Color color) => buildCircle(
    color: Colors.white,
    all: 3,
    child: buildCircle(
      color: color,
      all: 0,
      child: IconButton(
        onPressed: (){
          pickImage();
          userSetup(image!);
          user!.updatePhotoURL(image.toString());
        },
        icon: Icon(Icons.camera_alt_outlined,size: 20,),
        color: Colors.white,

      ),
    ),
  );
}




Widget buildCircle({
  required Widget child,
  required double all,
  required Color color,
}) =>
    ClipOval(
      child: Container(
        padding: EdgeInsets.all(all),
        color: color,
        child: child,
      ),
    );

Future <void> userSetup(File photoURL) async{
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  String uid = auth.currentUser!.uid.toString();

  users.add({
    'Image': photoURL, uid : uid,
  });

  return;
}