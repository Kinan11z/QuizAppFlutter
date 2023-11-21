import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

PageController controller = PageController();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext contex) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

List<String> names = ['International Band Mu...', 'Jo Malone London’s Mo..'];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        width: double.infinity,
        height: double.infinity,
      ),
      Container(
        width: 375,
        height: 179,
        decoration: BoxDecoration(
            color: Color.fromRGBO(167, 99, 97, 1),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(33),
                bottomRight: Radius.circular(33))),
      ),
      Positioned(
        top: 42,
        left: 24,
        child: Icon(
          Icons.list,
          size: 40,
          color: Colors.white,
        ),
      ),
      Positioned(
        top: 77,
        left: 24,
        child: SizedBox(
          width: 130,
          child: TextField(
            decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.white),
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                )),
          ),
        ),
      ),
      Positioned(
        left: 276,
        top: 90,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.circle, color: Colors.white),
              Text(
                ' Filters',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Airbnb Cereal App'),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Color.fromRGBO(93, 86, 243, 1),
              borderRadius: BorderRadius.circular(20.963)),
          width: 75.77,
          height: 32.062,
        ),
      ),
      Positioned(
        left: 315,
        top: 44,
        child: Badge(
          offset: Offset(-4, 0),
          backgroundColor: Color.fromARGB(255, 2, 0, 129),
          isLabelVisible: true,
          label: Container(
              height: 9,
              width: 9,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(81, 226, 255, 1),
                  shape: BoxShape.circle)),
          child: Icon(
            Icons.notifications_none_outlined,
            color: Colors.white,
            size: 36,
          ),
        ),
      ),
      Positioned(
        top: 157,
        left: 0,
        right: 0,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 24, right: 12),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.sports_basketball, color: Colors.white),
                        Text(
                          ' Sports',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Airbnb Cereal App'),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(240, 99, 90, 1),
                        borderRadius: BorderRadius.circular(20.963)),
                    width: 106.77,
                    height: 39.062,
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.music_note, color: Colors.white),
                      Text(
                        ' Music',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Airbnb Cereal App'),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(245, 151, 98, 1),
                      borderRadius: BorderRadius.circular(20.963)),
                  width: 100.77,
                  height: 39.062,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.food_bank_sharp, color: Colors.white),
                      Text(
                        ' Food',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Airbnb Cereal App'),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(41, 214, 151, 1),
                      borderRadius: BorderRadius.circular(20.963)),
                  width: 95.77,
                  height: 39.062,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(70, 205, 251, 1),
                      borderRadius: BorderRadius.circular(20.963)),
                  width: 82.77,
                  height: 39.062,
                ),
              )
            ],
          ),
        ),
      ),
      Positioned(
        top: 218,
        left: 24,
        child: Text(
          'Upcoming Events',
          style: TextStyle(fontSize: 18),
        ),
      ),
      Positioned(
        top: 224,
        left: 295,
        child: Row(
          children: [
            Text(
              'See All',
              style: TextStyle(
                  fontSize: 14, color: Color.fromRGBO(116, 118, 136, 1)),
            ),
            Icon(
              Icons.play_arrow,
              size: 15,
              color: Color.fromRGBO(116, 118, 136, 1),
            )
          ],
        ),
      ),
      Positioned(
        top: 255,
        left: 33,
        child: SizedBox(
          width: 237,
          height: 255,
          child: ListView.separated(
            // childrenDelegate: ,
            separatorBuilder: (context, index) => Divider(
              color: Colors.red,
              indent: 20,
              endIndent: 30,
              thickness: 10,
              // height: 100,
            ),
            // cacheExtent: 300,
            // itemExtent: 300,
            // scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: names.length,
            // itemBuilder: (context, index) => Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: CircleAvatar(child: Text(index.toString()),),
            // ),
            itemBuilder: (context, index) => ListTile(
              // tileColor: Colors.red,
              isThreeLine: true,
              title: Text(names[index]),
              leading: CircleAvatar(
                child: Text(index.toString()),
              ),
              trailing: Badge(
                  // smallSize: 10,
                  // isLabelVisible: ,
                  // alignment: Alignment.topLeft,
                  offset: Offset(-20, -8),
                  label: Text('+999'),
                  child: Icon(Icons.facebook)),
              subtitle: Text(
                  'Eu occaecat eu et laborum sit laborum nostrud ipsum ea labore esse.'),
            ),
          ),
        ),
      )
    ]));
  }
}
