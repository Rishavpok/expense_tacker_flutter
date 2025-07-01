import 'package:dio/dio.dart';
import 'package:expense_tracker/modals/registration.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registrationProvider = Provider<ResgistrationService>(
  (ref) => ResgistrationService(),
);

class ResgistrationService {
  final dio = Dio();

  Future register( Registration user ) async {
    try {
      final response = await dio.post(
        'http://localhost:3000/api/users/register',
        data: user.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Registration failed');
    }
  }
}
