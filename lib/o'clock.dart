import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClockWidget(),
    );
  }
}

class ClockWidget extends StatelessWidget {
  // final angle = 2 * pi / 12;
  // final radius = 150;
  const ClockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: getClock(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            dynamic temp = snapshot.data;
            print(temp);
            return Center(
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 86, 174, 246),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue, width: 20)),
                child: Stack(children: [
                  NumbersOclock(),
                  Center(
                    child: Transform.rotate(
                      angle: (pi / 180 * 6 * time.values.elementAt(0)),
                      child: Transform.flip(
                        flipY: true,
                        origin: Offset(0, -30),
                        child: Container(
                          width: 1,
                          height: 120,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Transform.rotate(
                      angle: (pi / 180 * 6 * time.values.elementAt(1)),
                      child: Transform.flip(
                        flipY: true,
                        origin: Offset(0, -25),
                        child: Container(
                          width: 3,
                          height: 110,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Transform.rotate(
                      angle: (pi / 180 * 6 * time.values.elementAt(2)),
                      child: Transform.flip(
                        flipY: true,
                        origin: Offset(0, -23),
                        child: Container(
                          width: 5,
                          height: 100,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            );
          } else
            return CircularProgressIndicator();
        },
      ),
    );
  }
}

int secounds = 0;
int minutes = 0;
int hours = 0;
Map<String, int> time = {
  'secounds': secounds,
  'minutes': minutes,
  'hours': hours
};
Stream getClock() async* {
  for (var i = 0;; i++) {
    yield time;
    secounds += 1;
    time['secounds'] = secounds;
    await Future.delayed(Duration(seconds: 1));
    if (secounds == 60) {
      secounds = 0;
      time['secounds'] = secounds;
      minutes += 1;
      time['minutes'] = minutes;
      yield time;
    }
    if (minutes == 60) {
      minutes = 0;
      time['minutes'] = minutes;
      hours += 1;
      time['hours'] = hours;
      yield time;
    }
    if (hours == 12) {
      hours = 0;
      time['hours'] = hours;
    }
  }
}

// final x = math.cos(i * angle - math.pi / 2) * radius;
// final y = math.sin(i * angle - math.pi / 2) * radius;

class NumbersOclock extends StatelessWidget {
  const NumbersOclock({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Transform.translate(
            offset: Offset(0, -115),
            child: Container(
              child: Text(
                '12',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        Center(
          child: Transform.rotate(
            angle: (pi / 180 * 30),
            child: Transform.translate(
              offset: Offset(0, -115),
              child: Transform.rotate(
                angle: (pi / 180 * -30),
                child: Container(
                  child: Text(
                    '1',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Transform.rotate(
            angle: (pi / 180 * 60),
            child: Transform.translate(
              offset: Offset(0, -115),
              child: Transform.rotate(
                angle: (pi / 180 * -60),
                child: Container(
                  child: Text(
                    '2',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Transform.translate(
            offset: Offset(115, 0),
            child: Container(
              child: Text(
                '3',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        Center(
          child: Transform.rotate(
            angle: (pi / 180 * 120),
            child: Transform.translate(
              offset: Offset(0, -115),
              child: Transform.rotate(
                angle: (pi / 180 * -120),
                child: Container(
                  child: Text(
                    '4',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Transform.rotate(
            angle: (pi / 180 * 150),
            child: Transform.translate(
              offset: Offset(0, -115),
              child: Transform.rotate(
                angle: (pi / 180 * -150),
                child: Container(
                  child: Text(
                    '5',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Transform.translate(
            offset: Offset(0, 115),
            child: Container(
              child: Text(
                '6',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        Center(
          child: Transform.rotate(
            angle: (pi / 180 * 210),
            child: Transform.translate(
              offset: Offset(0, -115),
              child: Transform.rotate(
                angle: (pi / 180 * -210),
                child: Container(
                  child: Text(
                    '7',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Transform.rotate(
            angle: (pi / 180 * 240),
            child: Transform.translate(
              offset: Offset(0, -115),
              child: Transform.rotate(
                angle: (pi / 180 * -240),
                child: Container(
                  child: Text(
                    '8',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Transform.translate(
            offset: Offset(-115, 0),
            child: Container(
              child: Text(
                '9',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        Center(
          child: Transform.rotate(
            angle: (pi / 180 * -60),
            child: Transform.translate(
              offset: Offset(0, -115),
              child: Transform.rotate(
                angle: (pi / 180 * 60),
                child: Container(
                  child: Text(
                    '10',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Transform.rotate(
            angle: (pi / 180 * -30),
            child: Transform.translate(
              offset: Offset(0, -115),
              child: Transform.rotate(
                angle: (pi / 180 * 30),
                child: Container(
                  child: Text(
                    '11',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
