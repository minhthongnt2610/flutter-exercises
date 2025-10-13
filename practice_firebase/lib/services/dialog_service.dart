import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_firebase/common_widgets/info_dialog.dart';

class DialogService {
  ///hiển thị error dialog
  Future<void> showErrorDialog({
    required BuildContext context,
    required String error,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return InfoDialog(
          title: 'Error',
          content: error,
          confirmButtonTitle: "OK",
          onConfirm: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  ///hiển thị tiến trình
  void showProgressDialog(BuildContext context) {
    showDialog(context: context,barrierDismissible: false, builder: (BuildContext context){
      return ProgressDialog();
    });
  }

  ///ẩn tiến trình
  void hideProgressDialog(BuildContext context) {}
}
