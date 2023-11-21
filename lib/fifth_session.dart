import 'package:flutter/material.dart';

main() {
  runApp(TestWidget());
}

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  double width = 200;
  double height = 200;
  Color color = Colors.red;
  bool magic = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  print('object');
                  setState(() {
                    width = width + 30;
                    height = height + 30;
                    color = Colors.blue;
                  });
                },
                child: Visibility(
                  replacement: FlutterLogo(
                    size: 300,
                    duration: Duration(seconds: 4),
                  ),
                  visible: magic,
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color,
                    ),
                    duration: Duration(seconds: 1),
                    width: width,
                    height: height,
                  ),
                ),
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      magic = !magic;
                    });
                  },
                  child: Text(magic ? 'hide' : 'show'))
            ],
          ),
        ),
      ),
    );
  }
}
