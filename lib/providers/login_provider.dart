import 'package:dio/dio.dart';
import 'package:expense_tracker/modals/users.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = Provider<LoginService>((ref) => LoginService());

class LoginService {
  final Dio _dio = Dio();

  Future<String?> login(Users user) async {
    try {
      final response = await _dio.post(
        'http://localhost:3000/api/users/login',
        data: user.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      return response.data['token'];
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Login failed');
    }
  }
}
