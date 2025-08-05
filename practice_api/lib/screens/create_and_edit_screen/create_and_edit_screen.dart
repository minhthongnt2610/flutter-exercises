import 'package:flutter/material.dart';
import 'package:practice_api/screens/create_and_edit_screen/widgets/delete_button.dart';
import 'package:practice_api/screens/create_and_edit_screen/widgets/input_date_time_field.dart';
import 'package:practice_api/screens/create_and_edit_screen/widgets/input_field.dart';
import 'package:practice_api/screens/create_and_edit_screen/widgets/primary_button.dart';
class CreateAndEditScreen extends StatefulWidget
{
    const CreateAndEditScreen({super.key});
    static const routeName = '/create-and-edit';
    @override
    State<CreateAndEditScreen> createState() => _CreateAndEditScreenState();
}

class _CreateAndEditScreenState extends State<CreateAndEditScreen>
{
    @override
    Widget build(BuildContext context)
    {
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
                        InputDateTimeField(selectedDate: null),
                        SizedBox(height: 16,),
                        PrimaryButton(title: "Create", onTap: (){}),
                        SizedBox(height: 16,),
                        DeleteButton(title: "Delete", onTap: (){}),
                    ]
                )

            ),
        );
    }
}
