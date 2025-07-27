import 'package:lesson_5/constants/app_icons.dart';

enum TaskStatus {
  complete,
  incomplete,
}

extension TaskStatusExtension on TaskStatus {
  String get icon {
    switch (this) {
      case TaskStatus.complete:
        return AppIcons.check;
      case TaskStatus.incomplete:
        return AppIcons.uncheck;
    }
  }
}
