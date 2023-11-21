import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/config/di.dart';
import 'package:flutter_ui/eighth_session.dart';
import 'package:flutter_ui/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (config.get<SharedPreferences>().getString('token') == null)
          ? LoginPage()
          : TokenPage(),
    );
  }
}

class TokenPage extends StatelessWidget {
  const TokenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('This is token',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.purple,
                    border: Border.all(color: Colors.black, width: 3)),
                child: Text(
                  config.get<SharedPreferences>().getString('token') ?? 'hello',
                  style: TextStyle(color: Colors.white),
                )),
          ),
          InkWell(
            onTap: () {
              config.get<SharedPreferences>().remove('token');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
            },
            child: Container(
              alignment: Alignment.center,
              width: 100,
              height: 40,
              color: Colors.deepPurple,
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// username: 'kminchelle',
// password: '0lelplR',
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController Password = TextEditingController();
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: 400,
            child: TextField(
              controller: username,
              decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: 400,
            child: TextField(
              obscureText: true,
              controller: Password,
              decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            await logIn(username.text, Password.text);
            if (config.get<SharedPreferences>().getString('token') != null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TokenPage(),
                  ));
            }
          },
          child: Container(
            alignment: Alignment.center,
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ]),
    );
  }
}

logIn(String username, String password) async {
  Dio dio = Dio();
  UserModel req = UserModel(username: username, password: password);
  Response response =
      await dio.post('https://dummyjson.com/auth/login', data: req.toJson());
  if (response.statusCode == 200) {
    print(response.data['token']);
    await config
        .get<SharedPreferences>()
        .setString('token', response.data['token']);
    return response.data['token'];
  } else {
    return 'Error';
  }
}
