import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PracticeApiApp extends StatelessWidget {
  const PracticeApiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: PracticeApi()
    );
  }
}
class PracticeApi extends StatefulWidget {
  const PracticeApi({Key? key}) : super(key: key);

  @override
  State<PracticeApi> createState() => _PracticeApiState();
}

class _PracticeApiState extends State<PracticeApi> {

  var res = '' ;

  Future<List<Posts>> getApi() async {
    List<Posts> lst = <Posts>[];
    const url = 'https://jsonplaceholder.typicode.com/posts';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      var title, body;
      for (var i in jsonResponse) {
        title = i['title'];
        body = i['body'];
        lst.add(Posts(title, body));
      }
      return lst;
      // return response.body;
    }else{
      throw Exception('the code note response .');
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: const Text('Practice Api'), ),
        body: FutureBuilder<List<Posts>>(
          future: getApi(),
          builder: (BuildContext context, AsyncSnapshot<List<Posts>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 300,
                  child:ListView(
                    children: snapshot.data!.map((e) =>Text('${e.toString()} \n')).toList(),
                  ),
                ),
              );
            }
          },
        ),

    );
  }
}


class Posts{

  var title;
  var body;

  Posts(this.title,this.body);

  @override
  String toString() {
    // TODO: implement toString
    return 'title :$title / body :$body';
  }
}
