import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gfd_official/Login_data/Login.dart';
import 'package:gfd_official/Login_data/gSignin_data.dart';
import 'package:gfd_official/Mainhome.dart';
import 'package:gfd_official/paid_screens/Expert1year.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ghori fashion designer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySplashScreen(),
    );
  }
}

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

// ignore: camel_case_types
class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
        Duration(
          seconds: 3,
        ),
            () {});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          Usertype.saveUser(snapshot.data);
          return StreamBuilder(
              stream: FirebaseFirestore.instance.collection('users').doc(
                  snapshot.data.uid).snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  final user = snapshot.data.data();
                  if(user['role'] == 'fullexpert'){
                    return Expert1year();
                  }else{
                    return Mainhome();
                  }
                }
                return Material(
                  child: Center(child: CircularProgressIndicator(),),);
              });
        }
        return Loginpage();
      },
    );
  }
}
