import 'package:expense_tracker/features/authentication/pages/login_screen.dart';
import 'package:expense_tracker/features/authentication/pages/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../routes/app_routes.gr.dart';



@RoutePage(name: 'IntroScreenRoute', deferredLoading: true)
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/background.jpg', fit: BoxFit.cover),
          ),
          Center(
            child: Text(
              'Gain total control of your money',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Column(
            children: [
              Spacer(), // Pushes the buttons to the bottom
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: ElevatedButton(
                  onPressed: () {
                   AutoRouter.of(
                      context,
                    ).push(const AuthenticationModuleRoute(children: [RegistrationScreenRoute()]));
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 32.0),
                child: ElevatedButton(
                  onPressed: () {
                    AutoRouter.of(
                      context,
                    ).push(const AuthenticationModuleRoute(children: [LoginScreenRoute()]));
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    foregroundColor: Colors.blue,
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
