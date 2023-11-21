import 'package:flutter/material.dart';
import 'package:flutter_ui/config/di.dart';
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
        home: (config.get<SharedPreferences>().getString('login') == null)
            ? LoginPage()
            : HomePage());
  }
}

int selectedIndex = 0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'person'),
          NavigationDestination(icon: Icon(Icons.chat), label: 'chat')
        ],
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
    );
  }
}

List<Widget> pages = [
  Scaffold(backgroundColor: Colors.red),
  Scaffold(backgroundColor: Colors.blue),
  ExamplePage()
];

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text(
              config.get<SharedPreferences>().getString('login') ?? "Hello"),
          bottom: TabBar(tabs: [
            Tab(text: 'facebook'),
            Tab(text: 'instagram'),
            Tab(text: 'telegram'),
          ]),
        ),
        body: TabBarView(children: [
          Center(
            child: InkWell(
                onTap: () {
                  config.get<SharedPreferences>().remove('login');
                },
                child: FlutterLogo()),
          ),
          Center(
            child: FlutterLogo(
              size: 200,
            ),
          ),
          Center(
            child: FlutterLogo(
              size: 400,
            ),
          ),
        ]),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                controller: password,
                decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (username.text.contains('k') &&
                  password.text.contains('12345')) {
                config
                    .get<SharedPreferences>()
                    .setString('login', username.text);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              }
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            ),
          )
        ],
      ),
    );
  }
}
