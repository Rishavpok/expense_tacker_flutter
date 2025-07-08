import 'package:dio/dio.dart';
import 'package:expense_tracker/core/services/api_service.dart';
import 'package:expense_tracker/services/token_service.dart';

class ProfileService {
  Future<dynamic> getProfile() async {
    final token = await TokenService.getToken();

    if (token == null || token.isEmpty) {
      throw Exception('Token not found');
    }
    try {
      final response = await ApiService().get('/users/details');
      return response['data'];
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Profile loading failed');
    }
  }
}
