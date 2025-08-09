import 'package:flutter/material.dart';
import 'package:practice_api/screens/create_and_edit_screen/widgets/primary_button.dart';
import 'package:practice_api/screens/list_friend_screen/models/friend_model.dart';
import 'package:provider/provider.dart';

import '../../list_friend_screen/widgets/friend_controller.dart';
import 'delete_button.dart';
import 'input_date_time_field.dart';
import 'input_field.dart';

class BuildDetailBodyWidget extends StatelessWidget {
  const BuildDetailBodyWidget({super.key, required this.friendModel});
  final FriendModel? friendModel;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<FriendController>(context, listen: true);
    if (controller.editName == null && controller.editBirthdate == null) {
      controller.initState(friendModel);
    }
    final isUpdate = friendModel != null;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            InputField(
              hintText: "Enter in field",
              onChanged: controller.updateName,
              maxLines: 3,
              initialValue: controller.editName,
            ),
            SizedBox(height: 16),
            InputDateTimeField(
              selectedDate: controller.editBirthdate,
              onChanged: controller.updateBirthdate,
            ),
            SizedBox(height: 16),
            PrimaryButton(
              title: isUpdate ? "Update" : "Create",
              onTap: () async {
                if (controller.editName == null ||
                    controller.editBirthdate == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please fill in all fields")),
                  );
                  return;
                }
                if (isUpdate) {
                  await controller.updateFriend(
                    id: friendModel!.id,
                    name: controller.editName!,
                    birthdate: controller.editBirthdate!,
                  );
                } else {
                  await controller.addFriend(
                    name: controller.editName!,
                    birthdate: controller.editBirthdate!,
                  );
                }
                Navigator.of(context).pop();
              },
            ),
            SizedBox(height: 16),
            if (isUpdate) ...{
              DeleteButton(
                title: "Delete",
                onTap: () async {
                  final result = _showDeleteDialog(context) as bool?;
                  if (result == true) {
                    await controller.deleteFriend(id: friendModel!.id);
                  } else {
                    return;
                  }
                },
              ),
            },
          ],
        ),
      ),
    );
  }

  Future<void> _showDeleteDialog(BuildContext context) async {
    final controller = Provider.of<FriendController>(context, listen: true);
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Friend'),
          content: Text('Are you sure you want to delete this friend?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                controller.deleteFriend(id: friendModel!.id);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
