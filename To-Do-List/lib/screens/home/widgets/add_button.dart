import 'package:flutter/material.dart';
import 'package:lesson_5/constants/app_colors.dart';
import 'package:lesson_5/constants/app_icons.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: 71,
        height: 71,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              AppColors.hexDE83B0,
              AppColors.hexC59ADF,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Image.asset(
            AppIcons.plus,
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}
