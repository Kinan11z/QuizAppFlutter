import 'package:dio/dio.dart';

getDataPhoto() async {
  Dio dio = Dio();

  Response response =
      await dio.get('https://jsonplaceholder.typicode.com/photos');
  return response;
}
