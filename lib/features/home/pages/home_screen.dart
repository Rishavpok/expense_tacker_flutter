import 'package:expense_tracker/screens/dashboard_screen.dart';
import 'package:expense_tracker/screens/profile_screen.dart';
import 'package:expense_tracker/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';




@RoutePage(name: 'HomeScreenRoute', deferredLoading: true)
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    DashboardScreen(),
    ProfileScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap:
            (index) => setState(() {
              _currentIndex = index;
            }),

            items:  const [
              BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
            ],
      ),
    );
  }
}
