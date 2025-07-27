import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/app_icons.dart';

Widget _buildAppBar() {
  return const DefaultTabController(
    length: 2,
    child: TabBar(
      indicatorColor: Colors.blue,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.label,
      dividerColor: Colors.transparent,
      tabs: [
        Tab(
          text: 'Following',
        ),
        Tab(
          text: 'For You',
        ),
      ],
    ),
  );
}

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    int height = MediaQuery.of(context).size.height.toInt();
    return AppBar(
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      title: _buildAppBar(),
      leading: IconButton(
        onPressed: () {},
        icon: Image.asset(
          AppIcons.live,
          width: 28 * height / 868,
          height: 28 * height / 868,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            AppIcons.search,
            width: 28 * height / 868,
            height: 28 * height / 868,
          ),
        ),
      ],
      centerTitle: true,
      titleSpacing: 10 * height / 868,
    );
  }
}
