import 'package:flutter/material.dart';

class PracticeAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // the appbar is separated to 3 main part :
      // 1- leading :first of appbar (it can be icon or text or ...)
      // 2- title :middle of appbar is must be text
      // 3- action : last of appbar is can be icons

    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.accessibility_sharp
          ),
          title: const Text("the app bar title"),
          actions: const [
            Icon(Icons.accessibility_sharp),
            Icon(Icons.accessibility_sharp),
            Text('the text in the acton part of the appbar'),
            Icon(Icons.accessibility_sharp)
          ],
        ),
      ),
    );
  }

}