// import 'package:flutter/material.dart';
// import 'package:practice_api/screens/create_and_edit_screen/widgets/primary_button.dart';
// import 'package:practice_api/screens/list_friend_screen/models/friend_model.dart';
// import 'package:provider/provider.dart';
//
// import '../../list_friend_screen/widgets/friend__controller.dart';
// import 'delete_button.dart';
// import 'input_date_time_field.dart';
// import 'input_field.dart';
//
// class BuildDetailBodyWidget extends StatelessWidget {
//   const BuildDetailBodyWidget({super.key, required this.friendModel});
//   final FriendModel? friendModel;
//
//   @override
//   Widget build(BuildContext context) {
//     final _controller = Provider.of<Friend_controller>(context, listen: true);
//     if (_controller.editName == null && _controller.editBirthdate == null) {
//       _controller.initState(friendModel);
//     }
//     final isUpdate = friendModel != null;
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             InputField(
//               hintText: "Enter in field",
//               onChanged: _controller.updateName,
//               maxLines: 3,
//               initialValue: _controller.editName,
//             ),
//             SizedBox(height: 16),
//             InputDateTimeField(
//               selectedDate: _controller.editBirthdate,
//               onChanged: _controller.updateBirthdate,
//             ),
//             SizedBox(height: 16),
//             PrimaryButton(
//               title: isUpdate ? "Update" : "Create",
//               onTap: () async {
//                 if (_controller.editName == null ||
//                     _controller.editBirthdate == null) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text("Please fill in all fields")),
//                   );
//                   return;
//                 }
//                 if (isUpdate) {
//                   await _controller.updateFriend(
//                     id: friendModel!.id,
//                     name: _controller.editName!,
//                     birthdate: _controller.editBirthdate!,
//                   );
//                 } else {
//                   await _controller.addFriend(
//                     name: _controller.editName!,
//                     birthdate: _controller.editBirthdate!,
//                   );
//                 }
//                 Navigator.of(context).pop();
//               },
//             ),
//             SizedBox(height: 16),
//             if (isUpdate) ...{
//               DeleteButton(
//                 title: "Delete",
//                 onTap: () async {
//                   final result = await _showDeleteDialog(context) as bool?;
//                   if (result == true) {
//                     await _controller.deleteFriend(id: friendModel!.id);
//                   } else {
//                     return;
//                   }
//                 },
//               ),
//             },
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _showDeleteDialog(BuildContext context) async {
//     final _controller = Provider.of<Friend_controller>(context, listen: true);
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Delete Friend'),
//           content: Text('Are you sure you want to delete this friend?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 _controller.deleteFriend(id: friendModel!.id);
//               },
//               child: Text('Delete'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:practice_api/screens/create_and_edit_screen/widgets/primary_button.dart';
import 'package:practice_api/screens/list_friend_screen/models/friend_model.dart';
import 'package:provider/provider.dart';

import '../../list_friend_screen/widgets/friend_controller.dart';
import 'delete_button.dart';
import 'input_date_time_field.dart';
import 'input_field.dart';

class BuildDetailBodyWidget extends StatefulWidget
{
    const BuildDetailBodyWidget({super.key, required this.friendModel});
    final FriendModel? friendModel;

    @override
    State<BuildDetailBodyWidget> createState() => _BuildDetailBodyWidgetState();
}

class _BuildDetailBodyWidgetState extends State<BuildDetailBodyWidget>
{
    late FriendController _controller;

    @override
    void initState() 
    {
        super.initState();
        _controller = Provider.of<FriendController>(context, listen: false);
        _controller.initState(widget.friendModel); // chỉ gọi 1 lần
    }

    @override
    Widget build(BuildContext context) 
    {
        // final _controller = Provider.of<Friend_controller>(context, listen: true);
        final isUpdate = widget.friendModel != null;

        return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
                child: Column(
                    children: [
                        InputField(
                            hintText: "Enter name",
                            onChanged: _controller.updateName,
                            maxLines: 1,
                            initialValue: _controller.editName,
                        ),
                        const SizedBox(height: 16),
                        InputDateTimeField(
                            selectedDate: _controller.editBirthdate,
                            onChanged: _controller.updateBirthdate,
                        ),
                        const SizedBox(height: 16),
                        PrimaryButton(
                            title: isUpdate ? "Update" : "Create",
                            onTap: () async
                            {
                                if (_controller.editName == null ||
                                    _controller.editBirthdate == null) 
                                {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text("Please fill in all fields")),
                                    );
                                    return;
                                }

                                if (isUpdate) 
                                {
                                    await _controller.updateFriend(
                                        id: widget.friendModel!.id,
                                        name: _controller.editName!,
                                        birthdate: _controller.editBirthdate!,
                                    );
                                }
                                else 
                                {
                                    await _controller.addFriend(
                                        name: _controller.editName!,
                                        birthdate: _controller.editBirthdate!,
                                    );
                                }
                                if (mounted) 
                                {
                                    Navigator.of(context).pop(true);
                                }

                            },
                        ),
                        const SizedBox(height: 16),
                        if (isUpdate) ...[
                            DeleteButton(
                                title: "Delete",
                                onTap: () async
                                {
                                    final result = await _showDeleteDialog(context);
                                    if (result == true) 
                                    {
                                        await _controller.deleteFriend(id: widget.friendModel!.id);
                                    }
                                    if (mounted)
                                    {
                                        Navigator.of(context).pop(true);
                                    }
                                },
                            ),
                        ],
                    ],
                ),
            ),
        );
    }

    Future<bool?> _showDeleteDialog(BuildContext context) 
    {
        return showDialog<bool>(
            context: context,
            builder: (context)
            {
                return AlertDialog(
                    title: const Text('Delete Friend'),
                    content:
                    const Text('Are you sure you want to delete this friend?'),
                    actions: [
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text('Cancel'),
                        ),
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text('Delete'),
                        ),
                    ],
                );
            },
        );
    }
}
