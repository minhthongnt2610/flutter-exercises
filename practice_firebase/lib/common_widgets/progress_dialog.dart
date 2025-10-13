import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  final String message;

  const ProgressDialog({
    super.key,
    this.message = "Please wait...",
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 24),
            Text(message, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
