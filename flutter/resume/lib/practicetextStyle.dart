import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PracticeTextStyle extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title : const Text('the textStyle')
        ),
          body:  const Column(

          children:[
            Text(
              'data',
              style: TextStyle(
                color:Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'data',
              style: TextStyle(
              color:Color.fromRGBO(0, 255, 0, 1),
              backgroundColor:Colors.black,
              ),
            ),
            Text(
              'data',
              style: TextStyle(
              color:Colors.red,
              fontSize: 100, // the is on pixel
              ),
            ),
            Text(
              'data data data data',
              style: TextStyle(
              color:Colors.amber,
              letterSpacing: -10,
              ),
            ),
            Text(
              'data data data data',
              style: TextStyle(
              color:Colors.blue,
              wordSpacing: -10,
              ),
            ),
          ],
        ),
      ),
    );
  }

}