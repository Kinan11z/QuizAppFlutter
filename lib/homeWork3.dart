import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

PageController controller = PageController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: controller,
          children: [
            FirstWidget(),
            SecoundWidget(),
            ThirdWidget(),
            FirstWidget()
          ]),
    );
  }
}

class FirstWidget extends StatelessWidget {
  const FirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 230, 202, 0.922),
      body: Center(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              child: Image.asset(
            'asset/cup3.png',
          )),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Text(
              'COFFEE SHOP',
              style: TextStyle(
                  fontSize: 36,
                  fontFamily: 'Josefin Sans',
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 37, bottom: 121),
            child: Text(
              'Enjoy the drink coffee .',
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),
            ),
          ),
          InkWell(
              onTap: () {
                controller.nextPage(
                    duration: Duration(seconds: 2), curve: Curves.ease);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
                width: 333,
                height: 47,
                child: Text(
                  'SHOP NOW',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Color.fromRGBO(254, 230, 202, 0.922),
                  ),
                ),
              ))
        ],
      )),
    );
  }
}

class SecoundWidget extends StatelessWidget {
  const SecoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 230, 202, 0.922),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('asset/cup3.png'),
          Padding(
            padding: const EdgeInsets.only(left: 29),
            child: Text(
              'Welcome \nBack!',
              style: TextStyle(
                  fontSize: 36,
                  fontFamily: 'Josefin Sans',
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 197, right: 30, left: 30, bottom: 13),
            child: InkWell(
                onTap: () {
                  controller.nextPage(
                      duration: Duration(seconds: 2), curve: Curves.ease);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  width: 333,
                  height: 47,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Color.fromRGBO(254, 230, 202, 0.922),
                    ),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 22),
            child: Container(
              width: 333,
              height: 47,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 2)),
              child: Text(
                'Create an account',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              'Forgot your password?',
              style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
            ),
          )
        ],
      ),
    );
  }
}

class ThirdWidget extends StatelessWidget {
  const ThirdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 230, 202, 0.922),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('asset/cup3.png'),
          Padding(
            padding: const EdgeInsets.only(left: 29),
            child: Text(
              'Welcome \nBack!',
              style: TextStyle(
                  fontSize: 36,
                  fontFamily: 'Josefin Sans',
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 13),
            child: Container(
              width: 332,
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    hintText: 'cetinselenay321@email.com',
                    labelText: 'Email',
                    floatingLabelBehavior: FloatingLabelBehavior.always),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
            child: Container(
              width: 332,
              child: TextField(
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                      hintText: '*******************',
                      labelText: 'Password',
                      floatingLabelBehavior: FloatingLabelBehavior.always)),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                  top: 22, right: 30, left: 30, bottom: 13),
              child: InkWell(
                onTap: () {
                  if (email.text.endsWith('.com') &&
                      password.text.contains('kinan123')) {
                    controller.nextPage(
                        duration: Duration(seconds: 2), curve: Curves.ease);
                  } else {}
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  width: 333,
                  height: 47,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Color.fromRGBO(254, 230, 202, 0.922),
                    ),
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 22),
            child: Container(
              width: 333,
              height: 47,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 2)),
              child: Text(
                'Create an account',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              'Forgot your password?',
              style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
            ),
          )
        ],
      ),
    );
  }
}
