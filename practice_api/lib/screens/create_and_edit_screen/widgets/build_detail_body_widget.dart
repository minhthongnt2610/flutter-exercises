import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../list_friend_screen/widgets/friend_controller.dart';

class BuildDetailBodyWidget extends StatelessWidget {
  const BuildDetailBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FriendController>(context, listen: true);
    return Container();
  }
}
