import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataStorage {
  static const String _tableName = 'notes';

  // Singleton instance
  static final DataStorage _instance = DataStorage._internal();

  factory DataStorage() => _instance;

  // Private constructor
  DataStorage._internal();

  // Database instance
  Database? _database;

  // Get database instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize database
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            text TEXT,
            created TEXT
          )
        ''');
        await db.execute('''
         CREATE TABLE images (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            note_id INTEGER,
            image TEXT,
            created TEXT,
             FOREIGN KEY (note_id) REFERENCES $_tableName(id) ON DELETE CASCADE
          )
        ''');
      },
    );
  }
}
