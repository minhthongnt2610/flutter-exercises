import 'package:flutter/material.dart';
import 'package:lesson_5/constants/app_colors.dart';
import 'package:lesson_5/screens/home_screen.dart';
import 'package:lesson_5/screens/setting_screen/setting_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const routeName = '/main';
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        backgroundColor: AppColors.hex181818,
        selectedItemColor: AppColors.hexBA83DE,
        unselectedItemColor: Colors.white.withOpacity(0.8),
        iconSize: 24,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget _buildBody() {
    switch (currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const SettingScreen();
      default:
        return const Placeholder();
    }
  }
}
