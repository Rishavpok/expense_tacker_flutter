import 'package:expense_tracker/services/token_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = FutureProvider<bool>((ref) async {
  final token = await TokenService.getToken();
  return token != null && token.isNotEmpty;
});
