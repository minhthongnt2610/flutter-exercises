import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_flutter_project/data/data_sources/local/db/db.table.dart';
import 'package:sqlite_flutter_project/data/models/db/db_friend_model.dart';
import 'package:sqlite_flutter_project/data/models/friend_model.dart';

class DbClient extends ChangeNotifier {
  DbClient();

  static const String dbName = 'friend_managerment.db'; // tên db
  static const int dbVersion = 1; // phiên bản db

  Database? _database; // biến lưu trữ database

  String? editName;
  String? editPhone;
  String? editEmail;

  void initState([FriendModel? friendModel]) {
    if (friendModel != null) {
      editName = friendModel.name;
      editPhone = friendModel.phone;
      editEmail = friendModel.email;
    } else {
      editName = null;
      editPhone = null;
      editEmail = null;
    }
  }

  void updateName(String name) {
    editName = name;
    notifyListeners();
  }

  void updatePhone(String phone) {
    editPhone = phone;
    notifyListeners();
  }

  void updateEmail(String email) {
    editEmail = email;
    notifyListeners();
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await init();
    return _database!;
  }

  Future<Database> init() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, dbName);

    _database = await openDatabase(
      dbPath,
      version: dbVersion,
      onCreate: _onCreate,
      onConfigure: _onConfigure,
      onUpgrade: _onUpgrade,
    );
    return _database!;
  }

  Future<void> _onCreate(Database db, int version) async {
    final batch = db
        .batch(); // Khởi tạo batch để thực hiện nhiều lệnh SQL cùng lúc
    await _createTable(db); // Tạo bảng trong cơ sở dữ liệu
    await batch.commit(); // Thực hiện các lệnh SQL đã được thêm vào batch
  }

  Future<void> _createTable(Database db) async {
    await _createFriendTable(db); // Tạo bảng bạn bè
  }

  Future<void> _createFriendTable(Database db) async {
    await db.execute(
      // Tạo bảng bạn bè với các trường id, name, phone, email
      'CREATE TABLE ${DbTableName.friend} ('
      '${DbFriendTableFields.id} INTEGER PRIMARY KEY AUTOINCREMENT, '
      '${DbFriendTableFields.name} TEXT NOT NULL, '
      '${DbFriendTableFields.phone} TEXT NOT NULL, '
      '${DbFriendTableFields.email} TEXT NOT NULL'
      ')',
    );
  }

  /// Phương thức _onUpgrade được gọi khi cơ sở dữ liệu được nâng cấp
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {}

  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  // Các phương thức truy vấn dữ liệu
  // Lay ra tat ca cac friend
  Future<List<DbFriendModel>> getAllFriends() async {
    final maps = await (await database).query(DbTableName.friend);
    return maps.map((map) => DbFriendModel.fromJson(map)).toList();
  }

  Future<int?> insert({required DbFriendModel dbFriendmodel}) async {
    try {
      final json = dbFriendmodel.toJson();

      final id = (await database).insert(
        DbTableName.friend,
        json,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      debugPrint('Insert success with id: $id');
      return id;
    } catch (e) {
      debugPrint('Insert failed with error: $e');
      return null;
    }
  }

  Future<int?> update({required DbFriendModel dbFriendmodel}) async {
    try {
      final json = dbFriendmodel.toJson();

      final id = (await database).update(
        DbTableName.friend,
        json,
        where: '${DbFriendTableFields.id} = ?',
        whereArgs: [dbFriendmodel.id],
      );
      debugPrint('Update success with id: $id');
      return id;
    } catch (e) {
      debugPrint('Update failed with error: $e');
      return null;
    }
  }

  Future<int?> delete({required int id}) async {
    try {
      final count = (await database).delete(
        DbTableName.friend,
        where: '${DbFriendTableFields.id} = ?',
        whereArgs: [id],
      );

      debugPrint('Delete success with count: $count');
      return count;
    } catch (e) {
      debugPrint('Delete failed with error: $e');
      return null;
    }
  }
}
