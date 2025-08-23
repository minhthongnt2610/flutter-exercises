import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_flutter_project/data/data_sources/local/db/db_controller.dart';

class BuildBodyWidget extends StatelessWidget {
  const BuildBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DbController>(context, listen: true);
    if (controller.friendList.isEmpty) {}
  }
}
