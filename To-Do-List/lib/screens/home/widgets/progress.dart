import 'package:flutter/material.dart';
import 'package:lesson_5/constants/app_colors.dart';

class Progress extends StatelessWidget {
  const Progress({
    super.key,
    required this.numberOfTask,
    required this.numberOfCompleteTask,
  });

  final int numberOfTask;
  final int numberOfCompleteTask;

  @override
  Widget build(BuildContext context) {
    final progressBarWidth = MediaQuery.of(context).size.width - 2 * (20 + 20);
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.hex181818,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Daily Task",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "$numberOfCompleteTask/$numberOfTask Task Completed",
            style: const TextStyle(
              fontSize: 18,
              color: Color.fromRGBO(255, 255, 255, 0.8),
            ),
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  "You are almost done go ahead",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(255, 255, 255, 0.8),
                  ),
                ),
              ),
              Text(
                "${(numberOfCompleteTask / numberOfTask * 100).floor()}%",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Stack(
            children: [
              Container(
                height: 18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(188, 131, 222, 0.41),
                ),
              ),
              Container(
                height: 18,
                width: progressBarWidth * numberOfCompleteTask / numberOfTask,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.hexBA83DE,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
