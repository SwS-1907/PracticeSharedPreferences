import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PracticeDropdownApp extends StatelessWidget {
  const PracticeDropdownApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Practice DropDown',
      home: PracticeDropdown(),
    );
  }
}
class PracticeDropdown extends StatefulWidget {
  const PracticeDropdown({Key? key}) : super(key: key);

  @override
  State<PracticeDropdown> createState() => _PracticeDropdownState();
}


class _PracticeDropdownState extends State<PracticeDropdown> {

  var  lst = ['name1','name2','name3','name4','name5','name6','name7',];
  var val = 'name1';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar :AppBar(
        title: Text('Practice Dropdown'),
      ),
      body: Center(
        child :Row(
          children : [
            Text('Names :'),
            DropdownButton<String>(
              value: val ,
              onChanged: (value){
                setState(() {
                  val = value! ;
                });
              },
              items: lst.map((e){
                return DropdownMenuItem(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
            ),
            Text('the value selected is $val'),
          ],
        ) ,
      ),
    );
  }
}

