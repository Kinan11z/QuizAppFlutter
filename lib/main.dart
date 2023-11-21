import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          // backgroundColor: Colors.white,
          body: Center(
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(285, 51, 30, 69),
              child: Text(
                'Skip',
                style: TextStyle(
                    color: Color.fromRGBO(139, 168, 181, 1),
                    fontSize: 17,
                    fontFamily: "Comfortaa"),
              )),
          FlutterLogo(
            size: 100,
          ),
          Padding(
              padding: const EdgeInsets.only(top: 71),
              child: Text(
                "Write Lists",
                style: TextStyle(fontSize: 24, fontFamily: "Poppins"),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 129),
            child: Text('Write your tasks in a list and\ncheck them when done!',
                style: TextStyle(
                    color: Color.fromRGBO(153, 153, 153, 1),
                    fontSize: 20,
                    fontFamily: 'Poppins')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(size: 15),
              FlutterLogo(size: 15),
              FlutterLogo(size: 15)
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 29),
            child: Container(
                height: 54,
                width: 317,
                // margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(139, 168, 181, 1),
                    borderRadius: BorderRadius.circular(20)),
                // color: Color.fromRGBO(139, 168, 181, 1),
                child: const Text("Next",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: 'Poppins')),
                alignment: Alignment.center),
          )
        ]),
      )),
    );
  }
}
