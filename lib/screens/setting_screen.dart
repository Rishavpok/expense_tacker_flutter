import 'package:expense_tracker/screens/login_screen.dart';
import 'package:expense_tracker/services/token_service.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          await TokenService.clearToken();
          final successMessage = 'Logout successfully';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(successMessage),
              duration: Duration(seconds: 3),
            ),
          );
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
          );
        },
        child: Text('Log out'),
      ),
    );
  }
}
