import 'package:flutter/material.dart';
import 'package:lesson_5/constants/app_colors.dart';
import 'package:lesson_5/screens/screen_all_task/widgets/all_tasks_screen_argument.dart';

import '../../common_widgets/primary_app_bar.dart';
import '../../data/model/task_model.dart';
import '../home/widgets/task_item.dart';
import '../home_screen.dart';

class ScreenAllTask extends StatefulWidget {
  const ScreenAllTask({
    super.key,
    required this.arguments,
  });
  static const routeName = '/screen_all_task';

  final AllTasksScreenArgument arguments;
  @override
  State<ScreenAllTask> createState() => _ScreenAllTaskState();
}

class _ScreenAllTaskState extends State<ScreenAllTask> {
  late List<TaskModel> allTasks;
  @override
  void initState() {
    super.initState();
    allTasks = widget.arguments.tasks;
  }

  @override
  Widget build(BuildContext context) {
    final todayTasks = allTasks.where((tasks) {
      return DateUtils.isSameDay(
        tasks.date,
        DateTime.now(),
      );
    }).toList();
    final tomorrowTasks = allTasks.where((tasks) {
      return DateUtils.isSameDay(
          tasks.date,
          DateTime.now().add(
            const Duration(days: 1),
          ));
    }).toList();
    return DefaultTabController(
      // initialIndex: widget.selectedTab,
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.hex020206,
        appBar: AppBar(
          backgroundColor: AppColors.hex020206,
          automaticallyImplyLeading: false,
          title: PrimaryAppBar(
            title: "All Tasks",
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
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: AppColors.hexDE83B0,
            labelColor: AppColors.hexDE83B0,
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            dividerHeight: 3,
            dividerColor: Colors.white30,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(
                text: "All",
              ),
              Tab(
                text: "Today",
              ),
              Tab(
                text: "Tomorrow",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTabBarContentView(tasks: allTasks),
            _buildTabBarContentView(tasks: todayTasks),
            _buildTabBarContentView(tasks: tomorrowTasks),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBarContentView({
    required List<TaskModel> tasks,
  }) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      // physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return TaskItem(
          taskModel: tasks[index],
          onStatusChanged: (taskStatus) {},
          onTap: () {},
        );
      },
      itemCount: tasks.length,
    );
  }
}
