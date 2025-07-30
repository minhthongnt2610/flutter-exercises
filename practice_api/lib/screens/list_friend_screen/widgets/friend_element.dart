import 'package:flutter/material.dart';

class FriendElement extends StatefulWidget {
  const FriendElement({super.key});

  @override
  State<FriendElement> createState() => _FriendElementState();
}

class _FriendElementState extends State<FriendElement> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        color: Colors.red,

      ),
    );
  }
}
