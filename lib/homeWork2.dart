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
        home: PageView(
          children: const [FirstWidget(), SecoundWidget(), ThirdWidget()],
        ));
  }
}

class FirstWidget extends StatelessWidget {
  const FirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          // backgroundColor: Colors.white,
          body: Center(
        child: Column(children: [
          const Padding(
              padding: EdgeInsets.fromLTRB(285, 51, 30, 69),
              child: Text(
                'Skip',
                style: TextStyle(
                    color: Color.fromRGBO(139, 168, 181, 1),
                    fontSize: 17,
                    fontFamily: "Comfortaa"),
              )),
          Image.asset(
            'asset/cuate1.png',
            height: 220,
            width: 220.57,
          ),
          const Padding(
              padding: EdgeInsets.only(top: 71),
              child: Text(
                "Write Lists",
                style: TextStyle(fontSize: 24, fontFamily: "Poppins"),
              )),
          const Padding(
            padding: EdgeInsets.only(top: 120),
            child: Text('Write your tasks in a list and\ncheck them when done!',
                style: TextStyle(
                    color: Color.fromRGBO(153, 153, 153, 1),
                    fontSize: 20,
                    fontFamily: 'Poppins')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(139, 168, 181, 1),
                    shape: BoxShape.circle),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(217, 217, 217, 1),
                      shape: BoxShape.circle),
                ),
              ),
              Container(
                height: 10,
                width: 10,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(217, 217, 217, 1),
                    shape: BoxShape.circle),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 29),
            child: Container(
              height: 54,
              width: 317,
              // margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(139, 168, 181, 1),
                  borderRadius: BorderRadius.circular(20)),
              alignment: Alignment.center,
              // color: Color.fromRGBO(139, 168, 181, 1),
              child: const Text("Next",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'Poppins')),
            ),
          )
        ]),
      )),
    );
  }
}

class SecoundWidget extends StatelessWidget {
  const SecoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          // backgroundColor: Colors.white,
          body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                  padding: EdgeInsets.fromLTRB(285, 51, 30, 69),
                  child: Text(
                    'Skip',
                    style: TextStyle(
                        color: Color.fromRGBO(139, 168, 181, 1),
                        fontSize: 17,
                        fontFamily: "Comfortaa"),
                  )),
              Image.asset('asset/cuate2.png', height: 219, width: 260),
              const Padding(
                  padding: EdgeInsets.only(top: 68),
                  child: Text(
                    "Stay Organized",
                    style: TextStyle(fontSize: 24, fontFamily: "Poppins"),
                  )),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 90),
                child: Text('Group your tasks and keep\nthem organized',
                    style: TextStyle(
                        color: Color.fromRGBO(153, 153, 153, 1),
                        fontSize: 20,
                        fontFamily: 'Poppins')),
              ),
              Container(
                width: 46,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(217, 217, 217, 1),
                          shape: BoxShape.circle),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(139, 168, 181, 1),
                            shape: BoxShape.circle),
                      ),
                    ),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(217, 217, 217, 1),
                          shape: BoxShape.circle),
                    )
                  ],
                ),
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
                  alignment: Alignment.center,
                  // color: Color.fromRGBO(139, 168, 181, 1),
                  child: const Text("Next",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Poppins')),
                ),
              )
            ]),
      )),
    );
  }
}

class ThirdWidget extends StatelessWidget {
  const ThirdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          // backgroundColor: Colors.white,
          body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 152),
                child: Image.asset('asset/cuate3.png', height: 220, width: 220),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 68),
                  child: Text(
                    "Check Progress",
                    style: TextStyle(fontSize: 24, fontFamily: "Poppins"),
                  )),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 90),
                child: Text('See how much you have \ndone from your tasks',
                    style: TextStyle(
                        color: Color.fromRGBO(153, 153, 153, 1),
                        fontSize: 20,
                        fontFamily: 'Poppins')),
              ),
              Container(
                width: 46,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(217, 217, 217, 1),
                          shape: BoxShape.circle),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(217, 217, 217, 1),
                            shape: BoxShape.circle),
                      ),
                    ),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(139, 168, 181, 1),
                          shape: BoxShape.circle),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 29),
                child: Container(
                  height: 54,
                  width: 317,
                  // margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(139, 168, 181, 1),
                      borderRadius: BorderRadius.circular(20)),
                  // color: Color.fromRGBO(139, 168, 181, 1),
                  alignment: Alignment.center,
                  child: const Text("Let’s Start",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Poppins')),
                ),
              )
            ]),
      )),
    );
  }
}
