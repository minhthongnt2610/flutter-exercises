import 'package:flutter/material.dart';
import 'package:lesson_5/constants/app_colors.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});
  static const routeName = '/setting';
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.hex181818,
      body: Center(
        child: Text(
          'Setting Screen',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
