import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class  Post{
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId,this.id,this.title,this.body});

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}



void main() => runApp(RealWorldApp());

class RealWorldApp extends StatefulWidget {
  @override
  _RealWorldAppState createState() => _RealWorldAppState();
}

class _RealWorldAppState extends State<RealWorldApp> {

  // var _isLoading = true;

  Future<Post> fetchPost() async {
    final response = await http.get('https://jsonplaceholder.typicode.com/posts/1');
    final responseJson = json.decode(response.body);

    return Post.fromJson(responseJson);
  }
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Real World App"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: (){
                print("Reloading....");
                // setState(() {
                  // _isLoading = false;                
                // });
                // _fetchData();
              },
            ),
          ],
        ),
        body: Center(
          child: FutureBuilder<Post>(
            future: fetchPost(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                return Text(snapshot.data.title);
              }else if (snapshot.hasError){
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            },
          )
        ),
      ),
    );
  }
}