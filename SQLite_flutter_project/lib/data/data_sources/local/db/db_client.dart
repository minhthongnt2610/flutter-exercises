import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_flutter_project/data/data_sources/local/db/db.table.dart';
import 'package:sqlite_flutter_project/data/models/db/db_friend_model.dart';

class DbClient {
  DbClient();

  static const String dbName = 'friend_managerment.db'; // tên db
  static const int dbVersion = 1; // phiên bản db

  Database? _database; // biến lưu trữ database

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
      onConfigure: _onConfigure,
      onUpgrade: _onUpgrade,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE ${DbTableName.friend} (
            ${DbFriendTableFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${DbFriendTableFields.name} TEXT NOT NULL,
            ${DbFriendTableFields.phone} TEXT NOT NULL,
            ${DbFriendTableFields.email} TEXT NOT NULL
          )
        ''');
      },
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

  Future<int?> insert({required DbFriendModel model}) async {}

  Future<int?> update({required DbFriendModel model}) async {}

  Future<int?> delete({required DbFriendModel model}) async {}
}
