import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class RealWorldApp extends StatefulWidget {

  @override
  RealWorldAppState createState() {
    return new RealWorldAppState();
  }
}

class RealWorldAppState extends State<RealWorldApp> {

  String mytext = null;
  final DocumentReference documentReference = Firestore.instance.document("myData/dummy");

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

  void _add(){
    Map<String,String> data = <String,String>{
      "name" : "Joyal A Johney",
      "book" : "Ktu Mechanics Benjamin",
    };

    documentReference.setData(data).whenComplete((){
      print("Document Added");
    }).catchError((e){print(e);});
  }

  void _update(){
    Map<String,String> data = <String,String>{
      "name" : "Joyal A Johney Updated",
      "book" : "Ktu Mechanics Benjamin Updated",
    };
    documentReference.updateData(data).whenComplete((){
      print("Document Updated");
    }).catchError((e){print(e);});

  }

  void _delete(){
    documentReference.delete().whenComplete((){
      print("Deleted Successfully");
      setState(() {});
    }).catchError((e) => print(e));
  }

  void _fetch(){
  documentReference.get().then((datasnapshot){
    if(datasnapshot.exists){
      setState(() {
        mytext = datasnapshot.data['book'];        
      });
      
    }
  }); 
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
              onPressed: ()=> 
              _signIn().then((FirebaseUser user)=>print(user)).catchError((e)=>print(e)),
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
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            RaisedButton(
              onPressed: _add,
              child: Text("Add"),
              color: Colors.teal,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            RaisedButton(
              onPressed: _update,
              child: Text("Update"),
              color: Colors.purple,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            RaisedButton(
              onPressed: _delete,
              child: Text("Delete"),
              color: Colors.red,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            RaisedButton(
              onPressed: _fetch,
              child: Text("Fetch"),
              color: Colors.orange,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            mytext == null? Container(): 
            Text(
              mytext,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white
              ),
            )
          ],
        ),
      ),
    );
  }
}