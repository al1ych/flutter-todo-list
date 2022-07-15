import 'package:dio/dio.dart';
import 'package:get/get.dart';

class BoardService {
  final String baseUrl = 'https://gorest.co.in/public/v2/todos';
  Dio dio = Dio();

  Future fetchTasks() async {
    final res = await dio.get(baseUrl);
    print("res $res");
    return res.data;
  }
}