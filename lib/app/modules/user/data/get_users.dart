import 'package:dio/dio.dart';

// Future<void> makeRequest() async {
// final dio = Dio();
//   try {
//     final response = await dio.get('http://192.168.0.105:3009/user');
//     print(response.data[0]);
//   } catch (e) {
//     print(e);
//   }
// }

class LoginService {
  final Dio _dio = Dio();

  Future<bool> login(String email, String password) async {
    try {
      final response = await _dio.post(
        'http://localhost:3001/user/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
