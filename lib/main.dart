import 'package:flutter/material.dart';
import './CRUD.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    accentColor: Colors.green,
  ),
  home: CrudOperation(),
));


