import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: FirstWidget());
  }
}

Map<String, List<String>> data = {
  'Name': [
    'Moni',
    'Esha',
    'Kaosar',
    'Sam',
    'Moni',
    'Esha',
    'Kaosar',
    'Sam',
    'Moni',
    'Esha',
    'Kaosar',
    'Sam',
    'Moni',
    'Esha',
    'Kaosar'
  ],
  'Image': [
    'asset/Moni.jfif',
    'asset/Esha.jfif',
    'asset/Kaosar.jfif',
    'asset/Sam.jfif',
    'asset/AvatarEnd.jfif',
    'asset/Moni.jfif',
    'asset/Esha.jfif',
    'asset/Kaosar.jfif',
    'asset/Sam.jfif',
    'asset/AvatarEnd.jfif',
    'asset/Moni.jfif',
    'asset/Esha.jfif',
    'asset/Kaosar.jfif',
    'asset/Sam.jfif',
    'asset/AvatarEnd.jfif'
  ],
  'Points': [
    '223',
    '160',
    '140',
    '130',
    '120',
    '223',
    '160',
    '140',
    '130',
    '120',
    '223',
    '160',
    '140',
    '130',
    '120'
  ]
};

class FirstWidget extends StatefulWidget {
  const FirstWidget({super.key});

  @override
  State<FirstWidget> createState() => _FirstWidgetState();
}

class _FirstWidgetState extends State<FirstWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(164, 47, 193, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(164, 47, 193, 1),
        elevation: 0.0,
        leading: Icon(Icons.arrow_back),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.8),
              radius: 23,
              child: CircleAvatar(
                backgroundImage: AssetImage('asset/avatar1.jfif'),
                radius: 20,
              ),
            ),
          )
        ],
      ),
      body: Column(children: [
        //Todo Container1
        Container(
          height: 330,
          color: Color.fromRGBO(164, 47, 193, 1),
          child: Column(children: [
            //Todo Row1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Today',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                Text(
                  'Month',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  'All Times',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
              //Todo Row2
            ),
            Stack(children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 55),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('asset/avatar2.jfif'),
                        radius: 35,
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('asset/avatar3.jfif'),
                      radius: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 55),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('asset/avatar4.jfif'),
                        radius: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            Container(
              width: double.infinity,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: ClipPath(
                      clipper: Rectangle1(),
                      child: Container(
                        alignment: Alignment.topCenter,
                        width: 152,
                        height: 166,
                        color: Color.fromRGBO(221, 144, 240, 0.70),
                        child: RotationTransition(
                          turns: AlwaysStoppedAnimation(-10 / 360),
                          child: Column(
                            children: [
                              Text(
                                '2',
                                style: TextStyle(
                                    fontSize: 75,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                '442pt',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 220,
                    child: ClipPath(
                      clipper: Rectangle3(),
                      child: Container(
                        width: 110,
                        height: 166,
                        color: Color.fromRGBO(221, 144, 240, 0.70),
                        child: RotationTransition(
                          turns: AlwaysStoppedAnimation(10 / 360),
                          child: Column(
                            children: [
                              Text(
                                '3',
                                style: TextStyle(
                                    fontSize: 75,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                '433pt',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 140,
                    child: ClipPath(
                      clipper: Rectangle2(),
                      child: Container(
                        width: 90,
                        height: 203,
                        color: Color.fromRGBO(221, 144, 240, 0.70),
                        child: Column(
                          children: [
                            Text(
                              '1',
                              style: TextStyle(
                                  fontSize: 75,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              '453pt',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
        //Todo Container2
        Container(
          height: 356,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: data.values.elementAt(1).length,
              itemBuilder: (BuildContext context, int index) {
                index += 4;
                String indexx = index.toString().padLeft(2, '0');
                return ListTile(
                    leading: Text(indexx, style: TextStyle(fontSize: 15)),
                    trailing: Container(
                      height: 26,
                      width: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(251, 236, 255, 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        data.values.elementAt(2)[index - 4] + 'pt',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    title: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage(data.values.elementAt(1)[index - 4]),
                          radius: 30,
                        ),
                        Text('      ' + data.values.elementAt(0)[index - 4]),
                      ],
                    ));
              }),
        )
      ]),
    );
  }
}

class Rectangle1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.4, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.75, size.height * 0.15);
    path.lineTo(size.width * 0.04, size.height * 0.1);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class Rectangle2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, size.height * 0.1);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class Rectangle3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.2, size.height * 0.04);
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(size.width, size.height * 0.2);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
