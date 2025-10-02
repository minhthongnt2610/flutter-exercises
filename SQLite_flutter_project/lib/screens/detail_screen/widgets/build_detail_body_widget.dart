import 'package:flutter/material.dart';
import 'package:sqlite_flutter_project/data/data_sources/local/db/db_controller.dart';
import 'package:sqlite_flutter_project/data/models/friend_model.dart';
import 'package:sqlite_flutter_project/screens/detail_screen/widgets/primary_button.dart';

import 'delete_button.dart';
import 'input_field.dart';

class BuildDetailBodyWidget extends StatefulWidget {
  const BuildDetailBodyWidget({super.key, required this.friendModel});

  final FriendModel? friendModel;

  @override
  State<BuildDetailBodyWidget> createState() => _BuildDetailBodyWidgetState();
}

class _BuildDetailBodyWidgetState extends State<BuildDetailBodyWidget> {
  late DbController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = DbController();
    _controller.initState(widget.friendModel);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            InputField(
              hintText: "Enter Phone",
              onChanged: _controller.updatePhone,
              maxLines: 1,
              initialValue: _controller.editPhone,
            ),
            const SizedBox(height: 16),
            InputField(
              hintText: "Enter Email",
              onChanged: _controller.updateEmail,
              maxLines: 1,
              initialValue: _controller.editEmail,
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              title: isUpdate ? "Update" : "Create",
              onTap: () async {
                if (isUpdate) {
                  // TODO: thêm logic cập nhật dữ liệu trong database
                  await _controller.updateFriend(
                    id: widget.friendModel!.id!,
                    name: _controller.editName!,
                    phone: _controller.editPhone!,
                    email: _controller.editEmail!,
                  );
                } else {
                  // TODO: thêm logic thêm dữ liệu mới vào database
                  await _controller.insertFriend(
                    name: _controller.editName!,
                    phone: _controller.editPhone!,
                    email: _controller.editEmail!,
                  );
                }
                if (mounted) {
                  Navigator.of(context).pop(true);
                }
              },
            ),
            const SizedBox(height: 16),
            if (isUpdate) ...[
              DeleteButton(
                title: "Delete",
                onTap: () async {
                  final result = await _showDeleteDialog(context);
                  if (result == true && mounted) {
                    // TODO: thêm logic xóa dữ liệu trong database
                    await _controller.deleteFriend(id: widget.friendModel!.id!);
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

  Future<bool?> _showDeleteDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Friend'),
          content: const Text('Are you sure you want to delete this friend?'),
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
