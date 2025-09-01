import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common_widgets/delete_button.dart';
import '../../../common_widgets/input_field.dart';
import '../../../common_widgets/primary_button.dart';



class BuildDetailBodyWidget extends StatefulWidget
{
  const BuildDetailBodyWidget({super.key,});

  @override
  State<BuildDetailBodyWidget> createState() => _BuildDetailBodyWidgetState();
}

class _BuildDetailBodyWidgetState extends State<BuildDetailBodyWidget>
{


  @override
  Widget build(BuildContext context)
  {
    int width = MediaQuery.of(context).size.width.toInt();
    int height = MediaQuery.of(context).size.height.toInt();
    final isUpdate = true;

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 110 * height / 928),
            Text(
              isUpdate ? 'Update Friend' : 'Add Friend',
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
            InputField(
              hintText: 'Phone Number',
              onChanged: (value) {},
              maxLines: 1,
              initialValue: '',
            ),
            const SizedBox(height: 20),
            InputField(
              hintText: 'Email',
              onChanged: (value) {},
              maxLines: 1,
              initialValue: '',

              ),
            const SizedBox(height: 20),
            InputField(
              hintText: 'Address',
              onChanged: (value) {},
              maxLines: 1,
              initialValue: '',
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              title: isUpdate ? 'Update' : 'Add',
              isColor: true,
              onPressed: () {},

            ),
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