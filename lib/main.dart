import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    accentColor: Colors.red,
  ),
  home: RealWorldApp(),
));


class RealWorldApp extends StatelessWidget {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithGoogle(
      idToken: gSA.idToken,
      accessToken: gSA.accessToken
    );

    print("User Name: ${user.displayName}");
    return user;
  }

  void _signOut(){
    googleSignIn.signOut();
    print("User Signed Out");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Real World App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              onPressed: ()=> _signIn().then((FirebaseUser user)=>print(user)).catchError((e)=>print(e)),
              child: Text("Sign In"),
              color: Colors.green,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            RaisedButton(
              onPressed: _signOut,
              child: Text("Sign Out"),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}