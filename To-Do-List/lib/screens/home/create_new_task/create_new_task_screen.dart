import 'package:flutter/material.dart';
import 'package:lesson_5/common_widgets/primary_app_bar.dart';
import 'package:lesson_5/constants/app_colors.dart';
import 'package:lesson_5/data/model/task_model.dart';
import 'package:lesson_5/data/model/task_priority.dart';
import 'package:lesson_5/data/model/task_status.dart';
import 'package:lesson_5/screens/home/create_new_task/model/new_tasks_screen_argument.dart';
import 'package:lesson_5/screens/home/create_new_task/widgets/header_new_task.dart';
import 'package:lesson_5/screens/home/create_new_task/widgets/input_text_filed.dart';
import 'package:lesson_5/screens/home/create_new_task/widgets/priority_item.dart';
import 'package:lesson_5/screens/home/create_new_task/widgets/set_date.dart';
import 'package:lesson_5/screens/home/create_new_task/widgets/set_time.dart';
import 'package:lesson_5/screens/home_screen.dart';
import 'package:uuid/uuid.dart';

import '../../../common_widgets/primary_button.dart';
import '../../../constants/app_icons.dart';

class CreateNewTaskScreen extends StatefulWidget {
  const CreateNewTaskScreen({super.key, required this.arguments});
  static const routeName = '/create_new_task';
  final NewTasksScreenArgument arguments;

  @override
  State<CreateNewTaskScreen> createState() => _createNewTaskScreen();
}

class _createNewTaskScreen extends State<CreateNewTaskScreen> {
  String? name;
  String? description;
  late DateTime selectedDate;
  late TimeOfDay startTime;
  late TimeOfDay endTime;
  TaskPriority? selectedTaskPriority;
  bool _isEditing = false;
  @override
  void initState() {
    super.initState();
    final taskModel = widget.arguments.taskModel;
    if (taskModel != null) {
      /// Cập nhật thông tin công việc cần chỉnh sửa
      selectedDate = taskModel.date;
      startTime = taskModel.startTime;
      endTime = taskModel.endTime;
      name = taskModel.name;
      description = taskModel.description;
      selectedTaskPriority = taskModel.taskPriority;
      _isEditing = true;
    } else {
      /// Cài đặt thông tin mặc định cho công việc mới
      selectedDate = DateTime.now();
      startTime = TimeOfDay.now();
      endTime = startTime.replacing(hour: startTime.hour + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: PrimaryAppBar(
          title: _isEditing ? 'Edit task' : 'Create new task',
          onBack: () {
            Navigator.of(context).pop(
              MaterialPageRoute(
                builder: (context) {
                  return const HomeScreen();
                },
              ),
            );
          },
        ),
        backgroundColor: AppColors.hex020206,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SetDate(
                date: DateTime.now(),
                selectedDate: DateTime.now(),
                onDateChanged: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),
              const HeaderNewTask(
                title: 'Schedule',
                opacity: 1,
                fontSize: 22,
              ),
              InputTextFiled(
                hint: 'Name',
                maxLines: 1,
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              InputTextFiled(
                hint: 'Description',
                maxLines: 3,
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SetTime(
                        title: "Start Time",
                        onChanged: (time) {
                          setState(() {
                            startTime = time;
                          });
                        },
                        time: startTime,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SetTime(
                        title: "End Time",
                        onChanged: (time) {
                          setState(() {
                            endTime = time;
                          });
                        },
                        time: endTime,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const HeaderNewTask(
                title: 'Priority',
                opacity: 1,
                fontSize: 22,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PriorityItem(
                  taskPriority: selectedTaskPriority,
                  taskPrioritis: TaskPriority.values,
                  onTaskpriorityChanged: (taskPriority) {
                    setState(
                      () {
                        selectedTaskPriority = taskPriority;
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Expanded(
                    child: HeaderNewTask(
                      title: 'Get alert for this task',
                      opacity: 1,
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Image.asset(
                      AppIcons.on,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: PrimaryButton(
                  title: _isEditing ? "Edit task " : "Create Task",
                  onTap: () {
                    debugPrint('Date: $selectedDate');
                    debugPrint('Name: $name');
                    debugPrint('Description: $description');
                    final newTaskModel = TaskModel(
                      id: const Uuid().v4(),
                      name: name ?? '',
                      description: description ?? '',
                      startTime: startTime,
                      endTime: endTime,
                      date: selectedDate,
                      taskPriority: selectedTaskPriority ?? TaskPriority.medium,
                      taskStatus: TaskStatus.incomplete,
                    );
                    Navigator.of(context).pop(newTaskModel);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
