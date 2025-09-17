import 'package:flutter/material.dart';
import 'package:practice_firebase/common_widgets/primary_button.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({
    super.key,
    required this.title,
    required this.content,
    required this.confirmButtonTitle,
    required this.onConfirm,
  });

  final String title;

  final String content;

  final String confirmButtonTitle;

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              content,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              title: confirmButtonTitle,
              isColor: false,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
