import 'package:flutter/material.dart';
import 'package:practice_firebase/common_widgets/primary_button.dart';
import 'package:practice_firebase/screens/update_profile/widgets/input_date_time_field.dart';

import '../../contants/app_colors.dart';
import '../login_screen/widgets/filed_widget.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});
  final String routeName = '/update_profile';

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final isUpdate = true;

    int height = MediaQuery.of(context).size.height.toInt();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          isUpdate ? 'Update Profile' : 'Create Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColor.hex1F4F70, AppColor.hex8FC9F0],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 150 * height / 928),

                    FiledWidget(
                      labelText: 'Name',
                      hintText: 'Enter your name',
                      isPassword: false,
                      suffixIcon: null,
                      onChange: (String value) {},
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 50 * height / 928),

                    InputDateTimeField(selectedDate: DateTime.now(), onChanged: (DateTime? value) {

                    },),
                    SizedBox(height: 50 * height / 928),
                    FiledWidget(
                      labelText: 'Email address',
                      hintText: 'Enter your email',
                      isPassword: false,
                      suffixIcon: null,
                      onChange: (String value) {},
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 50 * height / 928),
                    PrimaryButton(
                      title: 'Update',
                      isColor: true,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
