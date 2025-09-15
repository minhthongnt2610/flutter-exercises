class AuthSharedPrefs {
    static const String _uidKey = 'uid';

/// 1. Lưu UID sau khi đăng nhập

static Future<void> saveUid(String uid) async {

}

// Khi user đăng nhập bằng Email / Google / Facebook, Firebase trả về một User (có uid).
// Ta lưu uid này vào SharedPreferences → để lần sau mở app, không cần đăng nhập lại (auto login).
}





///2. Xóa UID khi logout
//
// Khi user bấm Đăng xuất, ta xóa UID khỏi SharedPreferences.
// Điều này đảm bảo lần sau mở app, hệ thống biết user chưa đăng nhập.
//
/// 3. Lấy UID đã lưu
//
// Khi app khởi động (ví dụ trong SplashScreen), ta kiểm tra xem SharedPreferences có uid không.
// Nếu có → user đã đăng nhập trước đó → chuyển thẳng vào HomeScreen.
// Nếu không → chuyển vào LoginScreen.

