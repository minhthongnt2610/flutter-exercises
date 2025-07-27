import 'package:flutter/material.dart';
import 'package:lesson_5/data/model/task_model.dart';
import 'package:lesson_5/data/model/task_priority.dart';

import '../../../constants/app_colors.dart';
import '../../../data/model/task_status.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.taskModel,
    required this.onStatusChanged,
    required this.onTap,
  });
  final VoidCallback onTap;
  final TaskModel taskModel;
  final ValueChanged<TaskStatus> onStatusChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.hex181818,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 15,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(7.5),
                  bottomLeft: Radius.circular(7.5),
                ),
                color: taskModel.taskPriority.color,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    taskModel.name,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_rounded,
                        color: Color.fromRGBO(255, 255, 255, 0.8),
                      ),
                      Text(
                        taskModel.displayDate,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(255, 255, 255, 0.8),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (taskModel.taskStatus == TaskStatus.complete) {
                  onStatusChanged.call(TaskStatus.incomplete);
                } else {
                  onStatusChanged.call(TaskStatus.complete);
                }
              },
              behavior: HitTestBehavior.translucent,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  taskModel.taskStatus.icon,
                  width: 26,
                  height: 26,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
