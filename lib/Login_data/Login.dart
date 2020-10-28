import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:gfd_official/Login_data/gSignin_data.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 360,
            ),
            Text(
              'Yaha par Login Kare',
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: GoogleSignInButton(
                onPressed: () async {
                  try {
                    await GSignInhelp.signInWithGoogle();
                  } catch (e) {
                    SnackBar(
                      backgroundColor: Colors.lightBlueAccent,
                        content: Text(
                      'There was a issue please try again',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                    ));
                  }
                },
                darkMode: true,
                textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Roboto",
                    color: Colors.white),
                borderRadius: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
