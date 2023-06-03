import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PracticeListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlistView();
  }

}
class _PlistView extends State<PracticeListView>{

  var lstName = ["ussama",'simo','mehdi'];
  var _valueSelected = '' ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Practice ListView'),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height:100,
                child: ListView(
                  children:lstName.map((e)=> Text(e)).toList() ,
                ),
              ),
              Container(
                width: 100,
                height:200,
                child: ListView.builder(
                  itemCount: lstName.length,
                    itemBuilder:(context, index) {
                      return ListTile(
                        title : Text(lstName[index]),
                        onTap: (){
                          setState(() {
                            _valueSelected = lstName[index];
                          });
                        },
                      );
                    },
                    
                )
              ),
              Text('the value selected is $_valueSelected',
                style:const TextStyle(
                  color: Colors.red
                )
              )
            ],
          ),
        ),
      ),
    );
  }

}