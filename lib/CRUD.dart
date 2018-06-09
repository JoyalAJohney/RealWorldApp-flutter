import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';


final FirebaseApp app = FirebaseApp(
  options : FirebaseOptions(
    googleAppID: '1:384879824773:android:2829db78c9f41dc6',
    apiKey: 'AIzaSyCeZhHndpzBCGzX04FsTQft5lBQUb4RUO8',
    databaseURL: 'https://my-first-project-bdf7a.firebaseio.com',
  )
);



class CrudOperation extends StatefulWidget {
  @override
  _CrudOperationState createState() => _CrudOperationState();
}

class _CrudOperationState extends State<CrudOperation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crud Operations"),
      ),
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Flexible(),
          Flexible(),
        ],
      )
    );
  }
}


class Item{
  String key;
  String title;
  String body;

  Item(this.title,this.body);

  Item.fromSnapshot(DataSnapshot snapshot){
    key = snapshot.key;
    title = snapshot.value["title"];
    body = snapshot.value["body"];
  }      

  toJson(){
    return{
      "title" : title,
      "body"  : body,
    };  
  }

}