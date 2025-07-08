import 'package:dio/dio.dart';
import 'package:expense_tracker/core/services/api_service.dart';
import 'package:expense_tracker/modals/users.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = Provider<LoginService>((ref) => LoginService());

class LoginService {

  Future<String?> login(Users user) async {
    try {
      final response = await ApiService().post('/users/login', user.toJson());
      return response['token'];
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Login failed');
    }
  }
}
