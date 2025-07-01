import 'package:expense_tracker/services/profile_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final profileServiceProvider = Provider((ref) => ProfileService());

final profileProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final service = ref.read(profileServiceProvider);
  return await service.getProfile();
});
