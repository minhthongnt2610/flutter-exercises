import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.color,
    required this.onTap,
  });
  final String title;
  final bool isSelected;
  final Color color;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            width: isSelected ? 0 : 2,
            color: color,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: isSelected ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
