import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnakeBarApp extends StatelessWidget {
  const SnakeBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:SnakeBar() ,
    );

  }
}
class SnakeBar extends StatefulWidget {
  const SnakeBar({Key? key}) : super(key: key);

  @override
  State<SnakeBar> createState() => _SnakeBarState();
}

class _SnakeBarState extends State<SnakeBar> {

  var state = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('the Snake Bar '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(48)
                  ),
                  onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('the button is pressed '),
                        action: SnackBarAction(
                            label:'Undo',
                            onPressed:(){}
                        ),
                      ),
                    );
                  },
                  child: const Text('press here to show the snake Bar ')
              ),
            )
          ]
        ),
      ),
    );
  }
}

