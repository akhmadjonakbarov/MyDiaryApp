import 'dart:developer';

import 'package:mydiary/app/shared/models/tag.dart';

import '../../features/entry/models/entry.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLDatabaseManager {
  static const String _tableName = 'entries';

  // Singleton instance
  static final SQLDatabaseManager _instance = SQLDatabaseManager._internal();

  factory SQLDatabaseManager() => _instance;

  // Private constructor
  SQLDatabaseManager._internal();

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
            description TEXT,
            tag TEXT,
            createdDate TEXT
          )
        ''');
        await db.execute('''
         CREATE TABLE images (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            entry_id INTEGER,
            image TEXT,
            created TEXT,
             FOREIGN KEY (entry_id) REFERENCES $_tableName(id) ON DELETE CASCADE
          )
        ''');
        await db.execute('''
        
           CREATE TABLE tags (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
          value TEXT
          )
        
        ''');
      },
    );
  }

  Future<void> insertTag(Tag tag) async {
    final db = await database;
    await db.insert(
      'tags',
      tag.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getTags() async {
    final db = await database;
    return await db.rawQuery('''
    SELECT e.id, e.value  
    FROM tags e 
  ''');
  }

  Future<void> insertEntry(Entry entry) async {
    final db = await database;

    int entryId = await db.insert(
      'entries',
      entry.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    log("Inserted Entry ID: $entryId");

    if (entry.imagePaths.isNotEmpty) {
      await insertImage(entryId, entry.imagePaths);
    } else {
      log("No images to insert for entry ID: $entryId");
    }
  }

  Future<void> insertImage(int entryId, List<String> imagePaths) async {
    final db = await database;

    for (String element in imagePaths) {
      log("FROM INSERT IMAGES: $element"); // Debug log
      await db.insert(
        'images',
        {
          'entry_id': entryId,
          'image': element,
          'created': DateTime.now().toIso8601String(),
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<void> deleteEntry(int id) async {
    final db = await database;
    await db.execute('DELETE FROM $_tableName WHERE id =?', [id]);
    await db.execute('DELETE FROM images WHERE entry_id =?', [id]);
  }

  Future<List<Map<String, dynamic>>> getEntries() async {
    final db = await database;
    return await db.rawQuery('''
    SELECT e.id, e.title, e.description, e.tag, e.createdDate, i.image 
    FROM $_tableName e 
    LEFT JOIN images i ON e.id = i.entry_id
  ''');
  }

  Future<void> deleteEntries() async {
    final db = await database;
    await db.execute('DELETE FROM $_tableName');
    await db.execute('DELETE FROM images');
    await reset(_tableName);
    await reset('images');
  }

  Future<void> deleteTags() async {
    final db = await database;
    await db.execute('DELETE FROM tags');
    await reset('tags');
  }

  Future<void> reset(String tableName) async {
    final db = await database;
    await db.execute('DELETE FROM SQLITE_SEQUENCE WHERE name = ?', [tableName]);
  }
}
