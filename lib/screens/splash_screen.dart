// screens/splash_screen.dart
import 'package:expense_tracker/features/home/pages/home_screen.dart';
import 'package:expense_tracker/screens/intro_screen.dart';
import 'package:expense_tracker/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return authState.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Scaffold(
        body: Center(child: Text('Error: $error')),
      ),
      data: (isLoggedIn) {
        return isLoggedIn ? const HomeScreen() : const IntroScreen();
      },
    );
  }
}