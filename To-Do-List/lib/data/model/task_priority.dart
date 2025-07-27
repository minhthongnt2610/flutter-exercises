import 'package:flutter/material.dart';
import 'package:lesson_5/constants/app_colors.dart';

enum TaskPriority {
  high,
  medium,
  low,
}

extension TaskPriorityExtension on TaskPriority {
  Color get color {
    switch (this) {
      case TaskPriority.high:
        return AppColors.hexFACBBA;
      case TaskPriority.medium:
        return AppColors.hexD7F0FF;
      case TaskPriority.low:
        return AppColors.hexFAD9FF;
    }
  }

  String get title {
    switch (this) {
      case TaskPriority.high:
        return "High";
      case TaskPriority.medium:
        return "Medium";
      case TaskPriority.low:
        return "Low";
    }
  }
}
