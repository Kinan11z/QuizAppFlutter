import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(Customize());
}

class Customize extends StatefulWidget {
  const Customize({super.key});

  @override
  State<Customize> createState() => _CustomizeState();
}

class _CustomizeState extends State<Customize> {
  bool position1 = true;
  bool position2 = false;
  int press = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                  visible: position2,
                  child: Image.asset(
                    "asset/vector2.jpg",
                    scale: 0.8,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: position1,
                    child: Container(
                      width: 200,
                      height: 55,
                      child: Stack(children: [
                        Image.asset("asset/dash.png"),
                        Positioned(
                            top: 6,
                            left: 20,
                            child: Row(
                              children: [
                                Text(
                                  'Plan',
                                  style: TextStyle(fontSize: 36),
                                ),
                                Text(
                                  '&',
                                  style: TextStyle(
                                      fontSize: 36,
                                      color: Color.fromRGBO(153, 153, 153, 1)),
                                ),
                                Text(
                                  'Go',
                                  style: TextStyle(fontSize: 36),
                                ),
                              ],
                            )),
                      ]),
                    ),
                  ),

                  Visibility(
                    replacement: Text('stay organized',
                        style: TextStyle(
                            fontSize: 24,
                            color: Color.fromRGBO(153, 153, 153, 1))),
                    visible: !position2,
                    child: InkWell(
                        onTap: () {
                          press += 1;
                          setState(() {
                            if (press == 1) {
                              position1 = false;
                            }
                            if (press == 2) {
                              position2 = true;
                              print(position2);
                            }
                          });
                        },
                        child: Image.asset("asset/vector2.jpg")),
                  ),

                  // Visibility(
                  //   visible: position2,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(bottom: 50),
                  //     child: Image.asset("asset/vector2.jpg"),
                  //   ),
                  // )
                ],
              ),
              // Visibility(
              //   visible: position2,
              //   child: Text('stay organized',
              //       style: TextStyle(
              //           fontSize: 24, color: Color.fromRGBO(153, 153, 153, 1))),
              // ),
            ],
          )),
    );
  }
}
