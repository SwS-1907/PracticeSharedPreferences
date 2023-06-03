import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:resume/PracticeDataBase.dart';
import 'package:resume/PracticeDropdown.dart';
import 'package:resume/PracticeSevrelWayOfMenu.dart';
import 'package:resume/pactcecontainer.dart';
import 'package:resume/practice_body.dart';
import 'package:resume/practiceappbar.dart';
import 'package:resume/practicebutton.dart';
import 'package:resume/practicelistview.dart';
import 'package:resume/practicetextStyle.dart';
import 'PractieApi.dart';
import 'Snakbar.dart';

void main()async {

  runApp(const SnakeBarApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('the title for page')),
//         body: Text('the body of page '),) ,
//     );
//   }
//
// }