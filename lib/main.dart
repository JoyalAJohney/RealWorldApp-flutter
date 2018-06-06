import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() => runApp(RealWorldApp());

class RealWorldApp extends StatefulWidget {
  @override
  _RealWorldAppState createState() => _RealWorldAppState();
}

class _RealWorldAppState extends State<RealWorldApp> {

  var _isLoading = true;

  _fetchData() async {
    print("Attempting to fetch data from internet");
    final String url = "http://api.letsbuildthatapp.com/youtube/home_feed";
    final response = await http.get(url);
    
    if (response.statusCode == 200){
      print(response.body);
    }
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
                setState(() {
                  _isLoading = false;                
                });
                _fetchData();
              },
            ),
          ],
        ),
        body: Center(
          child: _isLoading ? CircularProgressIndicator() : Text("Finished Loading...."),
        ),
      ),
    );
  }
}