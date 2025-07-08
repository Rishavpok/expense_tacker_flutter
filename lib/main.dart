import 'package:expense_tracker/core/services/api_service.dart';
import 'package:expense_tracker/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_tracker/routes/app_routes.dart';
import 'package:expense_tracker/routes/app_routes.gr.dart';

final appRouter = AppRouter();

void main() {
  ApiService().init();
  runApp(ProviderScope(child: const MainApp()));
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
