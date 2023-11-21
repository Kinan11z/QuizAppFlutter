import 'package:flutter/material.dart';

void main() {
  runApp(const FirstWidget());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PageView(
          children: const [FirstWidget()],
        ));
  }
}

class FirstWidget extends StatefulWidget {
  const FirstWidget({super.key});

  @override
  State<FirstWidget> createState() => _FirstWidgetState();
}

class _FirstWidgetState extends State<FirstWidget> {
  int state = 0;
  Color color_gray = Color.fromRGBO(139, 168, 181, 1);
  Color color_white = Colors.white;
  bool magic_1 = true;
  bool magic_2 = true;
  bool magic_3 = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          // backgroundColor: Colors.white,
          body: Center(
        child: Column(children: [
          Visibility(
            visible: magic_3,
            child: const Padding(
                padding: EdgeInsets.fromLTRB(285, 51, 30, 69),
                child: Text(
                  'Skip',
                  style: TextStyle(
                      color: Color.fromRGBO(139, 168, 181, 1),
                      fontSize: 17,
                      fontFamily: "Comfortaa"),
                )),
          ),
          Visibility(
            visible: magic_1,
            child: Image.asset(
              'asset/cuate1.png',
              height: 220,
              width: 220.57,
            ),
          ),
          Visibility(
            visible: magic_1,
            child: const Padding(
                padding: EdgeInsets.only(top: 71),
                child: Text(
                  "Write Lists",
                  style: TextStyle(fontSize: 24, fontFamily: "Poppins"),
                )),
          ),
          Visibility(
            visible: magic_1,
            child: const Padding(
              padding: EdgeInsets.only(top: 120),
              child: Text(
                  'Write your tasks in a list and\ncheck them when done!',
                  style: TextStyle(
                      color: Color.fromRGBO(153, 153, 153, 1),
                      fontSize: 20,
                      fontFamily: 'Poppins')),
            ),
          ),
          Visibility(
              visible: !magic_2,
              child: Image.asset(
                'asset/cuate2.png',
                height: 219,
                width: 260,
              )),
          Visibility(
            visible: !magic_2,
            child: const Padding(
                padding: EdgeInsets.only(top: 68),
                child: Text(
                  "Stay Organized",
                  style: TextStyle(fontSize: 24, fontFamily: "Poppins"),
                )),
          ),
          Visibility(
            visible: !magic_2,
            child: const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 90),
              child: Text('Group your tasks and keep\nthem organized',
                  style: TextStyle(
                      color: Color.fromRGBO(153, 153, 153, 1),
                      fontSize: 20,
                      fontFamily: 'Poppins')),
            ),
          ),
          Visibility(
            visible: !magic_3,
            child: Padding(
              padding: const EdgeInsets.only(top: 152),
              child: Image.asset('asset/cuate3.png', height: 220, width: 220),
            ),
          ),
          Visibility(
            visible: !magic_3,
            child: const Padding(
                padding: EdgeInsets.only(top: 68),
                child: Text(
                  "Check Progress",
                  style: TextStyle(fontSize: 24, fontFamily: "Poppins"),
                )),
          ),
          Visibility(
            visible: !magic_3,
            child: const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 90),
              child: Text('See how much you have \ndone from your tasks',
                  style: TextStyle(
                      color: Color.fromRGBO(153, 153, 153, 1),
                      fontSize: 20,
                      fontFamily: 'Poppins')),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                replacement: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 10,
                  width: 10,
                  decoration:
                      BoxDecoration(color: color_white, shape: BoxShape.circle),
                ),
                visible: magic_1,
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 10,
                  width: 10,
                  decoration:
                      BoxDecoration(color: color_gray, shape: BoxShape.circle),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Visibility(
                  replacement: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: color_gray, shape: BoxShape.circle),
                  ),
                  visible: magic_2,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: color_white, shape: BoxShape.circle),
                  ),
                ),
              ),
              Visibility(
                replacement: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 10,
                  width: 10,
                  decoration:
                      BoxDecoration(color: color_gray, shape: BoxShape.circle),
                ),
                visible: magic_3,
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 10,
                  width: 10,
                  decoration:
                      BoxDecoration(color: color_white, shape: BoxShape.circle),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 29),
            child: InkWell(
              onTap: () {
                state += 1;
                setState(() {
                  if (state == 1) {
                    magic_1 = false;
                    magic_2 = false;
                    magic_3 = true;
                  }
                  if (state == 2) {
                    magic_1 = false;
                    magic_2 = true;
                    magic_3 = false;
                  }
                });
              },
              child: Container(
                height: 54,
                width: 317,
                // margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(139, 168, 181, 1),
                    borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.center,
                // color: Color.fromRGBO(139, 168, 181, 1),
                child: Text(!magic_3 ? "Let’s Start" : "Next",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: 'Poppins')),
              ),
            ),
          )
        ]),
      )),
    );
  }
}
