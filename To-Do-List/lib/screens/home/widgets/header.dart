import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class Header extends StatelessWidget {
  final String title;
  final VoidCallback onSeeTab;
  const Header({
    required this.title,
    super.key,
    required this.onSeeTab,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: onSeeTab,
            child: const Text(
              "See All",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.hexBA83DE,
              ),
            ),
          )
        ],
      ),
    );
  }
}
