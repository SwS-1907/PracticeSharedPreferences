import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey[700]!),
        // useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _obscureText = true;

  void _login() {
    setState(() {
      if (_user.text.isNotEmpty && _password.text.isNotEmpty){
        if (_user.text == "ussama" && _password.text == "ussama"){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('the login is being accused'),
                action: SnackBarAction(
                    label: 'UNDO',
                    onPressed:(){}),
              )
          );
        }
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('the field of username or password are empty'),
            action: SnackBarAction(
              label: 'UNDO',
              onPressed:(){}),
          )
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   title: Text(''),
      // ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.apple,
                size: 100,
              ),
              Container(
                width: double.infinity,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30,25,30,15),
                  child: TextField(
                    controller: _user,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      label: Text('username')
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30,0,30,15),
                  child: TextField(
                    controller: _password,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Colors.grey
                        )
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.grey
                        )
                      ),
                      label: Text('password'),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                      ),
                    ),
                    obscureText: _obscureText ,
                    obscuringCharacter: '#',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,0,30,15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forget Password ?',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.blue[300]
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40,),
              InkWell(
                onTap: _login,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30,0,30,15),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.black,
                    ),
                    width: double.infinity,
                    height: 50,
                    child: const Center(
                      child: Text(
                        'Sing in',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30,25,30,15),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        'Or youcan use',
                        style: TextStyle(
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      )
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.g_mobiledata,
                      size: 80,
                    ),
                    Text('|',
                      style: TextStyle(
                        fontSize: 30
                      ),
                    ),
                    SizedBox(width: 15,),
                    Icon(Icons.facebook,
                      size: 50,
                    ),
                  ],
                ),
              )
            ],

          ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
