import 'dart:async';
import 'package:dio/dio.dart';
import 'package:expense_tracker/services/token_service.dart';
import 'package:flutter/foundation.dart';
import 'package:expense_tracker/configs/app_config.dart';

class ApiService {
  ApiService._internal();

  static final ApiService _instance = ApiService._internal();

  // Factory constructor to return the same instance
  factory ApiService() => _instance;

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiBaseUrl,
      headers: {'Content-Type': 'application/json'},
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );

  void init() {
    dio.interceptors.clear();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await TokenService.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
      ),
    );
  }

  Future<dynamic> _request(Future<Response<dynamic>> future) async {
    try {
      final response = await future;
      return response.data;
    } on DioException catch (e) {
      // The interceptor will handle 401s, this catches other errors
      throw Exception(e);
    }
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> data) {
    return _request(dio.post(endpoint, data: data));
  }

  Future<dynamic> get(String endpoint) {
    return _request(dio.get(endpoint));
  }
}
