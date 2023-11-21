import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ui/model/comment_model.dart';
import 'package:flutter_ui/model/photo_model.dart';
import 'package:flutter_ui/service/get_data.dart';
import 'package:flutter_ui/service/get_data_photo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kinan The King',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      home: LayoutBuilder(builder: (context, Constraints) {
        if (Constraints.maxWidth > 500) {
          return FutureBuilderExample2();
        } else {
          return StreamBuilderExample();
        }
      }),
    );
  }
}

class FutureBilderExample extends StatelessWidget {
  const FutureBilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          dynamic temp = snapshot.data;
          List<CommentModel> result = List.generate(temp.data.length,
              (index) => CommentModel.fromMap(temp.data[index]));
          return ListView.separated(
            itemCount: result.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) => ListTile(
              leading: Text(result[index].name),
              title: Text(result[index].email),
              subtitle: Text(result[index].body),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(child: Text('Error'));
        }
      },
    ));
  }
}

class FutureBuilderExample2 extends StatelessWidget {
  const FutureBuilderExample2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getDataPhoto(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            dynamic temp = snapshot.data;
            List<PhotoModel> result = List.generate(temp.data.length,
                (index) => PhotoModel.fromMap(temp.data[index]));
            return ListView.separated(
              itemCount: result.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) => ListTile(
                leading: Image.network(result[index].url),
                title: Text(result[index].title),
                subtitle: Text(result[index].thumbnailUrl),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(child: Text('Error'));
          }
        },
      ),
    );
  }
}

class StreamBuilderExample extends StatelessWidget {
  const StreamBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: getStream(1000),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              dynamic temp = snapshot.data;
              print(temp);
              return Center(
                child: Transform.rotate(
                  angle: (pi / 180 * 6 * temp),
                  child: Container(
                    width: 10,
                    height: 200,
                    color: Colors.red,
                  ),
                ),
              );
            } else {
              return LinearProgressIndicator();
            }
          }),
    );
  }
}

Stream getStream(int count) async* {
  for (var i = 0; i < count; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}
