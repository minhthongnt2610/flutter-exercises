import 'package:lesson_5/data/model/task_model.dart';

class AllTasksScreenArgument {
  const AllTasksScreenArgument({
    required this.tasks,
  });
  final List<TaskModel> tasks;
}
