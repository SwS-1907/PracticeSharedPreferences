import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PracticeButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _But();
}

class _But extends State<PracticeButton> {
  String title = 'Unknown';
  String appbar = 'The Button is ';
  callback(fruit) {
    setState(() {
      title = fruit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appbar + title),
        ),
        body: Center(
          child: Column(
            children: [
              TheButton(title: 'Banana', callback: callback),
              TheButton(title: 'Orange ', callback: callback),
              TheButton(title: 'Apple', callback: callback),
              // ElevatedButton(onPressed: (){}, child:const Text('A'),),
              // TextButton(onPressed:(){} , child:const  Text('B')),
              // OutlinedButton(onPressed: (){} , child: const Text('C'))
            ],
          ),
        ),
      ),
    );
  }
}

class TheButton extends StatelessWidget {
  final String title;
  final Function callback;

  TheButton({required this.title, required this.callback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          callback(title);
        },
        child: Text(this.title));
  }
}
