import 'package:dio/dio.dart';

void main() async {
  final dio = Dio();
  final response = await dio.get('http://localhost:3001/user/');
  print(response.data);
}