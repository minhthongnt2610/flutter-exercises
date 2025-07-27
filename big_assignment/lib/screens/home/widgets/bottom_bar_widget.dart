import 'package:big_assignment/constants/app_icons.dart';
import 'package:flutter/material.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      selectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          icon: Image(image: AssetImage(AppIcons.home)),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image(image: AssetImage(AppIcons.friend)),
          label: 'Friend',
        ),
        BottomNavigationBarItem(
          icon: Image(image: AssetImage(AppIcons.shape)),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image(image: AssetImage(AppIcons.message)),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Image(image: AssetImage(AppIcons.account)),
          label: 'Profile',
        ),
      ],
    );
  }
}
