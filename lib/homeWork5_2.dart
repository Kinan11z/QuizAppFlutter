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
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool visible1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: visible1,
              child: AnimatedDefaultTextStyle(
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 36, color: Colors.black),
                duration: Duration(seconds: 3),
                child: Text(
                  'Plan&Go',
                  // style: TextStyle(fontSize: 36, color: Colors.black),
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    visible1 = false;
                  });
                },
                child: Image.asset('asset/vector.png'))
          ],
        ),
      ),
    );
  }
}
