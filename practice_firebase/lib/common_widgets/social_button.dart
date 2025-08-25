import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.url, required this.onPressed});

  final String url;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    int width = MediaQuery.of(context).size.width.toInt();
    int height = MediaQuery.of(context).size.height.toInt();
    return Container(
      height: 50 * height / 928,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Image.network(
          url,
          width: 24,
          height: 24,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
