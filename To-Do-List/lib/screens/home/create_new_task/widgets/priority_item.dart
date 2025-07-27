import 'package:flutter/cupertino.dart';
import 'package:lesson_5/data/model/task_priority.dart';

import '../../../../common_widgets/secondary_button.dart';

class PriorityItem extends StatelessWidget {
  const PriorityItem({
    super.key,
    required this.taskPriority,
    required this.taskPrioritis,
    required this.onTaskpriorityChanged,
  });
  final TaskPriority? taskPriority;
  final List<TaskPriority> taskPrioritis;
  final ValueChanged<TaskPriority> onTaskpriorityChanged;
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    //chạy for để duyệt và lấy ra hết tất cả các phần tử có trong taskPriority
    //và tuyền vào trong secondaryButton.
    for (int i = 0; i < taskPrioritis.length; i++) {
      children.add(
        Expanded(
          child: SecondaryButton(
            title: taskPrioritis[i].title,
            isSelected: taskPriority == taskPrioritis[i],
            color: taskPrioritis[i].color,
            onTap: () {
              onTaskpriorityChanged.call(taskPrioritis[i]);
            },
          ),
        ),
      );
      if (i < taskPrioritis.length - 1) {
        children.add(const SizedBox(
          width: 9,
        ));
      }
    }
    return Row(
      children: children,
    );
  }
}
