import 'package:flutter/material.dart';

class PracticeContainer extends StatelessWidget {
  // the container is ain bwtween of invisible and
  //    visible widget if set a style of it .
  //    It's width and height get the the size of he's children

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('the Container'),
        ),
        body: Container(
          color: Colors.amber,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
          ],
        ),
          /**
              alignment:Alignment.center, // to set a position to content
              padding:const EdgeInsets.fromLTRB(10, 10, 10, 10), // set the padding
              color: Colors.amber, //set a backgrond to a container
              decoration:,
              this.foregroundDecoration,
              double? width,
              double? height,
              BoxConstraints? constraints,
              margin:EdgeInsets.fromLTRB(10, 10, 10, 10), // set he margin there is a sevrel class to do
              this.transform,
              this.transformAlignment,
              this.child,
           */

        ),
      ),
    );
  }

}
