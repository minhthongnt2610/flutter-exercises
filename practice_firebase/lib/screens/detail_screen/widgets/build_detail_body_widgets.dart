import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_firebase/data/data_sources/remote/firebase/auths/auth_email_service.dart';
import 'package:practice_firebase/data/data_sources/remote/firebase/firestore_database/firestore_service.dart';
import 'package:practice_firebase/models/friend_model.dart';
import 'package:practice_firebase/screens/detail_screen/models/new_friend_screen_argument.dart';

import '../../../common_widgets/delete_button.dart';
import '../../../common_widgets/input_field.dart';
import '../../../common_widgets/primary_button.dart';
import 'input_date_time_field.dart';

class BuildDetailBodyWidget extends StatefulWidget {
  const BuildDetailBodyWidget({super.key, required this.argument});
  final NewFriendScreenArgument argument;
  @override
  State<BuildDetailBodyWidget> createState() => _BuildDetailBodyWidgetState();
}

class _BuildDetailBodyWidgetState extends State<BuildDetailBodyWidget> {
  String? name;
  DateTime? birthday;
  String? email;
  final _firestoreService = FirestoreService();
  final _authEmailService = AuthEmailService();
  bool _isEditing = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final friendModel = widget.argument.friendModel;
    if (friendModel != null) {
      _isEditing = true;
      name = friendModel.name;
      birthday = friendModel.birthday;
      email = friendModel.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    int height = MediaQuery.of(context).size.height.toInt();

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 110 * height / 928),
              Text(
                _isEditing ? 'Update Friend' : 'Create Friend',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              InputField(
                hintText: 'Name',
                onChanged: (value) {},
                maxLines: 1,
                initialValue: '',
              ),
              const SizedBox(height: 20),
              InputDateTimeField(
                selectedDate: DateTime.now(),
                onChanged: (DateTime? value) {},
              ),

              const SizedBox(height: 20),
              InputField(
                hintText: 'Email',
                onChanged: (value) {},
                maxLines: 1,
                initialValue: '',
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                title: _isEditing ? 'Update' : 'Create',
                isColor: true,
                onPressed: () async {
                  if (_isEditing) {
                    final editFriend = FriendModel(
                      name: name ?? '',
                      birthday: birthday ?? DateTime.now(),
                      email: email ?? '',
                    );
                    await _firestoreService.updateFriend(editFriend.toFbFriendModel());
                  } else {
                    final createFriend = FriendModel(
                      id: _authEmailService.currentUser!.uid.hashCode,
                      name: name ?? '',
                      birthday: birthday ?? DateTime.now(),
                      email: email ?? '',
                    );
                    await _firestoreService.addFriend(createFriend.toFbFriendModel());
                  }
                },
              ),
              const SizedBox(height: 20),
              //
              // if(_isEditing){
              //   DeleteButton(
              //     title: 'Delete',
              //     onTap: () {
              //       _showDeleteDialog(context);
              //     },
              //   ),
              // }
            ],
          ),
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
