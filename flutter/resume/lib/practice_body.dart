import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PracticeBody extends StatelessWidget{

  //the body is the must part that we work on
  // the body it can be one of the invisible
  //    that contain a widget or one widget directly
  @override
  Widget build(BuildContext context) {
    return const MaterialApp ( // use const
      home : Scaffold(
        body: Center(
            child: const Text("the fist text.")
        ),
      )
    );
  }

}