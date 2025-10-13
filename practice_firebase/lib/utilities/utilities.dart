class Utilities {
  /// Kiểm tra định dạng email hợp lệ
  static bool isValidEmail(String email) {
    final emailRegex =
    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  /// Kiểm tra mật khẩu có đủ mạnh (chứa chữ hoa, chữ thường, số và ký tự đặc biệt, tối thiểu 8 ký tự)
  static bool isValidPassword(String password) {
    final passwordRegex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return passwordRegex.hasMatch(password);
  }

  static String cleanErrorMessage(dynamic exception) {
    return exception.toString().replaceAll('Exception: ', '');
  }
}
