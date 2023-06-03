import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


Database? database;
void main()async{
try{

  WidgetsFlutterBinding.ensureInitialized();
  database = await openDatabase(
      join(await getDatabasesPath(), 'practice.db'),
      version: 1,
      onCreate: (db , version) {
        return db.execute('create table person(num INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
      }
  );

}catch (e){
  print(e);
}

  runApp(const PracticeDatabaseApp());

}


class PracticeDatabaseApp extends StatelessWidget {
  const PracticeDatabaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PracticeDatabase();
  }
}

class PracticeDatabase extends StatefulWidget {
  const PracticeDatabase({Key? key}) : super(key: key);

  @override
  State<PracticeDatabase> createState() => _PracticeDatabaseState();
}

class _PracticeDatabaseState extends State<PracticeDatabase> {
  // Database? database ;
  var _name  = TextEditingController();
  var _num  = TextEditingController();
  // var _title;
  var _age = TextEditingController();

  late Future<List<Person>> _lst = findAllPersons();

  // WidgetsFlutterBinding.ensureInitialized();
  // final database =  openDatabase(
  //   'first_db',
  //   version: 1,
  //   onCreate: (db , version) {
  //     return db.execute('create table person(num INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
  //   }
  // );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Database'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('num '),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: TextField(
                        controller: _num,
                        decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('name'),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: TextField(
                        controller: _name,
                        decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('age'),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: TextField(
                        controller: _age,
                        decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                      ))
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        var p =Person(num :int.parse(_num.value.toString()) ,name: _name.value.toString() , age:int.parse(_age.value.toString()));
                        await createPerson(p);
                        setState(() {
                          _lst = findAllPersons();
                        });
                      },
                      child: const Text('Create')),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: ()async  {
                        var p =Person(num :int.parse(_num.value.toString()) ,name: _name.value.toString() , age:int.parse(_age.value.toString()));
                        await updatePerson(p);
                        setState(() {
                          _lst = findAllPersons() ;
                        });
                      },
                      child: const Text('Update')),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (_num.text.isNotEmpty){
                          var num = int.parse(_num.text.toString());
                          await deletePerson(num);
                          setState(() {
                            _lst = findAllPersons();
                          });

                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('click in item .'),
                              )
                          );
                        }
                      },
                      child: const Text('Delete')),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 400,
                child: FutureBuilder(
                  future: _lst,
                  builder: (context, data) {
                    if (data.hasError) {
                      print("error : ${data.error}");
                      return Center(
                        child: Text("the eroor is: ${data.error}"),
                      );
                    }if (data.hasData) {
                      // print("the length of list is ${snapshot.data?.length}");
                      // if (data.data != null) {
                        List<Person> lstperson = data.data!;

                        return ListView.builder(
                          itemCount: lstperson.length,
                          itemBuilder: (context, index) {
                            return
                              ListTile(
                                onTap: () {
                                  var p = lstperson[index];
                                  _name.text = p.name.toString();
                                  _age.text = p.age.toString();
                                },
                                title: Row(
                                  children: [
                                    SizedBox(width: 100,
                                        child: Text(
                                            lstperson[index].num.toString())),
                                    SizedBox(width: 100,
                                        child: Text(
                                            lstperson[index].name.toString())),
                                    SizedBox(width: 100,
                                        child: Text(
                                            lstperson[index].age.toString())),

                                  ],
                                ),
                              );
                          },
                        );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                        //si aucune donnée
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<void> createPerson(Person p) async  {
    var db = database! ;
    db.insert('person', p.toMap());
  }
  Future<void> deletePerson(int num) async {
    var db = database! ;
    db.delete('person', where: "num = ?",  whereArgs: [num],);
  }
  Future<void> updatePerson(Person p) async {
    var db = database! ;
    db.update('person', p.toMap(),where: "num = ?",  whereArgs: [p.num],);
  }
// Future<Person> findPerson(int num) async {
//   final List<Map<String, dynamic>> lstStagiaires = await db!.query('person',where: "num = ?",  whereArgs: [num]);
//   return lstStagiaires.map((p) => Person.fromJson(p)).toList()[0];
// }

  Future<List<Person>> findAllPersons() async {
    var db = database;
    // if (db == null){
    //   Future.error("there is a error");
    // }
    List<Map<String, dynamic>> lstPerson = await db!.query('person');
    return lstPerson.map<Person>((p) => Person.fromJson(p)).toList();
  }
}


class Person {
  int num ;
  String name ;
  int age ;

  Person({required this.num,required this.name,required this.age});

  Map<String, dynamic> toMap() {
    return {
      'num': num,
      'name': name,
      'age': age,
    };
  }

  static Person fromJson(Map<String, dynamic> obj) {
    return Person(
      num: obj['num'] as int,
      name: obj['name'] as String,
      age: obj['age'] as int,
    );
  }

  @override
  String toString() {
    return 'Person num : $num / name is : $name / the age is : $age';
  }


}
