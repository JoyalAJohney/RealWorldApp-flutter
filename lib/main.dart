import 'package:flutter/material.dart';

void main() => runApp(RealWorldApp());

class RealWorldApp extends StatefulWidget {
  @override
  _RealWorldAppState createState() => _RealWorldAppState();
}

class _RealWorldAppState extends State<RealWorldApp> {

  var _isLoading = true;

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