import 'package:flutter/material.dart';
import 'package:practice_api/screens/create_and_edit_screen/widgets/delete_button.dart';
import 'package:practice_api/screens/create_and_edit_screen/widgets/input_date_time_field.dart';
import 'package:practice_api/screens/create_and_edit_screen/widgets/input_field.dart';
import 'package:practice_api/screens/create_and_edit_screen/widgets/primary_button.dart';
import 'package:practice_api/screens/list_friend_screen/widgets/friend_controller.dart';
import 'package:provider/provider.dart';

class CreateAndEditScreen extends StatelessWidget
{
    const CreateAndEditScreen({super.key});
    static const routeName = '/create-and-edit';
    @override
    Widget build(BuildContext context)
    {
        return ChangeNotifierProvider(
            create: (_) => FriendController(),
            child: const CreateAndEditScreenBody(),
        );
    }
}

class CreateAndEditScreenBody extends StatelessWidget
{
    const CreateAndEditScreenBody({super.key});

    @override
    Widget build(BuildContext context)
    {
        final controller = Provider.of<FriendController>(context, listen: true);

        return Scaffold(
            appBar: AppBar(
                title: const Text('Create and Edit'),
                centerTitle: true,
            ),
            body:
            Padding(padding: 
                const EdgeInsets.all(20),
                child: Column(
                    children: [
                        InputField(
                            hintText: "Enter in field",
                            onChanged: (value)
                            {
                            },
                            maxLines: 3, initialValue: null),
                        SizedBox(height: 16,),
                        InputDateTimeField(selectedDate: DateTime.now(), onChanged: (DateTime? value) {

                        },),
                        SizedBox(height: 16,),
                        PrimaryButton(title: "Create", onTap: ()
                            {
                            }
                        ),
                        SizedBox(height: 16,),
                        DeleteButton(title: "Delete", onTap: ()
                            {
                            }
                        ),
                    ]
                )

            ),
        );
    }
}
