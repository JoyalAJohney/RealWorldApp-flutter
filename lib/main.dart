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
              onPressed: null,
              child: Text("Sign In"),
              color: Colors.green,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            RaisedButton(
              onPressed: null,
              child: Text("Sign Out"),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}