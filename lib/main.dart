import 'package:flutter/material.dart';
// import './authenication.dart';
import './layout.dart';
import './productDisplay.dart';


void main() => runApp(MaterialApp(
  theme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
    accentColor: Colors.black,
  ),
  home: ProductDisplay(),
));


