import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/PracticeDropdown.dart';
import 'package:untitled/PractieApi.dart';

class PracticeSevrelWayOfMenuApp extends StatelessWidget {
  const PracticeSevrelWayOfMenuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu in sevrel Way',
      home: PracticeSevrelWayOfMenu(),
    );
  }
}


class PracticeSevrelWayOfMenu extends StatefulWidget {
  const PracticeSevrelWayOfMenu({Key? key}) : super(key: key);

  @override
  State<PracticeSevrelWayOfMenu> createState() => _PracticeSevrelWayOfMenuState();
}

class _PracticeSevrelWayOfMenuState extends State<PracticeSevrelWayOfMenu> {

  var _selecteditem = 0 ;
  var _selectedpopup = 0 ;
  var val = '';
  var lst = ['item1','item2','item3','item4',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menue in sevrel way'),
      ),
      body:  SizedBox(
        width: double.infinity,
        height: 700,
        child: Center(
          child: PopupMenuButton(
            initialValue: _selectedpopup,
            onSelected: (item){
              setState(() {
                _selectedpopup = item ;
              });
            },
            itemBuilder : (context) {
              return  [
                PopupMenuItem(
                  value: 1,
                  child: Text('MenuPage'),
                ),
                PopupMenuItem(
                  value: 1,
                  onTap: (){
                    setState(() {
                      Navigator.of(context).push( MaterialPageRoute(
                          builder:(_){
                           return const PracticeApiApp();
                          }));
                    });
                  },
                  child: Text('API'),
                ),
                PopupMenuItem(
                  value: 1,
                  onTap: (){
                    setState(() {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder:(_){
                            return const PracticeDropdownApp();
                          }));
                    });
                  },
                  child: Text('Dropdown'),
                ),
              ];
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _selecteditem = index ;
          });
        },
        currentIndex: _selecteditem,
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Ajouter'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_display),
            label: 'Afficher',


          ),
        ]
      ),
      drawer:Drawer(
        child:ListView(
          children: const [
            DrawerHeader(
              decoration:BoxDecoration(
                color: Colors.blueGrey,
              ),
              child:Row(
                children: [
                  Text('the header of drawer .'),
                  Icon(Icons.ac_unit),
                ],
              )
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('home'),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Ajouter'),
            ),
            ListTile(
              leading: Icon(Icons.smart_display),
              title: Text('Afficher'),
            ),
          ],
        )
      ),
    );
  }
}

