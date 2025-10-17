import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice_firebase/common_widgets/info_dialog.dart';
import 'package:practice_firebase/common_widgets/primary_button.dart';
import 'package:practice_firebase/data/data_sources/remote/firebase/auths/auth_email_service.dart';
import 'package:provider/provider.dart';

import '../../contains/app_colors.dart';
import '../../providers/user_provider.dart';
import '../../services/dialog_service.dart';
import '../login_screen/login_screen.dart';
import '../login_screen/widgets/filed_widget.dart';
import '../../utilities/utilities.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({super.key});
  static const String routeName = '/forgot_password';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String? _email;
  final TextEditingController emailController = TextEditingController();
  final AuthEmailService _authEmailService = AuthEmailService();
  final _formKey = GlobalKey<FormState>();
  final _dialogService = DialogService();

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<UserProvider>();
    int height = MediaQuery.of(context).size.height.toInt();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
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
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30 * height / 928),
                    Text(
                      "Please enter your email address. You will receive a link to create a new password via email.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40 * height / 928),

                    FieldWidget(
                      labelText: 'Email address',
                      hintText: 'Enter your email',
                      isPassword: false,
                      suffixIcon: null,
                      onChange: (String value) {
                        setState(() {
                          _email = value;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      controller: emailController,
                      initialValue: profileProvider.emailUser,
                    ),
                    SizedBox(height: 50 * height / 928),
                    PrimaryButton(
                      title: 'Reset Password',
                      isColor: true,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _resetPassword(email: _email!);
                        }
                      },
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

  ///ẩn bàn phím
  void _hideKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  ///kiểm tra giá trị email hợp lệ trước khi gửi yêu cầu reset password
  String? _checkCredentials({required String? email}) {
    if (email!.isEmpty ?? true) {
      return 'Please enter your email';
    }
    if (!Utilities.isValidEmail(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  ///Hiển thị hộp thoại thông báo sau khi gửi email reset mật khẩu thành công.
  void _showResetPasswordDialog({required BuildContext context}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return InfoDialog(
          title: 'Reset Password',
          content:
              'Please check your email to reset your password. Then login again. Thank you!',
          confirmButtonTitle: "Ok",
          onConfirm: () {
            Navigator.of(context).pop(); // đóng dialog
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil(LoginScreen.routeName, (route) => false);
          },
        );
      },
    );
  }

  ///Thực hiện toàn bộ quy trình reset mật khẩu (quên mật khẩu) cho người dùng.
  Future<void> _resetPassword({required String email}) async {
    final error = _checkCredentials(email: email);

    ///bắt lỗi của email
    if (!mounted) {
      return;
    }
    if (error != null) {
      ///nếu có lỗi thì hiển thị lỗi lên
      _dialogService.showErrorDialog(context: context, error: error);
    } else {
      try {
        ///hiển thị tiến trình
        _dialogService.showProgressDialog(context);

        ///nếu không có lỗi thì gửi email reset mật khẩu
        await _authEmailService.sendPasswordResetEmail(email: email);
        if (!mounted) {
          return;
        }

        ///ẩn tiến trình
        _dialogService.hideProgressDialog(context);

        ///ẩn bàn phím
        _hideKeyBoard();

        ///hiển thị hộp thoại thông báo chuyển tới email
        _showResetPasswordDialog(context: context);
      } on FirebaseAuthException catch (error) {
        ///ẩn tiến trình
        _dialogService.hideProgressDialog(context);

        ///nếu có lỗi thì hiển thị lỗi lên
        _dialogService.showErrorDialog(
          context: context,
          error: Utilities.cleanErrorMessage(error),
        );
      }
    }
  }
}
