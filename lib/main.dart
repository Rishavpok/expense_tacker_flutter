import 'package:expense_tracker/core/services/api_service.dart';
import 'package:expense_tracker/core/services/notification_service.dart';
import 'package:expense_tracker/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appRouter = AppRouter();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService.initializeFirebase();
  await NotificationService.initializeLocalNotifications();

  ApiService().init();

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Expense tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
