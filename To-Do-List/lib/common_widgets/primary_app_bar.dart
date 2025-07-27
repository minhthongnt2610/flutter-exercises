import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lesson_5/constants/app_colors.dart';
import 'package:lesson_5/constants/app_icons.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar({
    super.key,
    required this.title,
    required this.onBack,
  });
  final String title;
  final VoidCallback onBack;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.hex020206,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      // leadingWidth: 69,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: GestureDetector(
          onTap: onBack,
          child: SizedBox(
            width: 44,
            height: 44,
            child: Center(
              child: Image.asset(
                AppIcons.back,
                width: 29,
                height: 29,
              ),
            ),
          ),
        ),
      ),
      titleSpacing: 20,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
