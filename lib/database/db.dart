// ignore_for_file: avoid_print

import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  static Future<void> createDatabase(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      title TEXT,
      photo TEXT,
      description TEXT,
      number INTEGER,
      summ INTEGER
    )
""");
  }

  static Future<sql.Database> db() async {
    print('Databasa ochildi');
    return sql.openDatabase(
      'malumot.db',
      version: 1,
      onCreate: (sql.Database database, version) async {
        print("Table was created");
        await createDatabase(database);
      },
    );
  }

  static Future<int> createItems(
      {required String title,
      required String photo,
      required String description,
      required int number,
      required int summ}) async {
    final db = await DBHelper.db();
    final data = {
      'title': title,
      'photo': photo,
      'description': description,
      'number': number,
      'summ': summ
    };
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    print('Databasaga  qoshildi');
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    try {
      print('Databasa yuklanmoqda');
      final db = await DBHelper.db();
      final datalar = await db.query('items', orderBy: 'id');
      print('Databasa yuklandi');
      return datalar;
    } catch (e) {
      print('Error getting items: $e');
      return [];
    }
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    try {
      final db = await DBHelper.db();
      return await db.query('items', where: 'id=?', whereArgs: [id], limit: 1);
    } catch (e) {
      print('Error getting item with id $id: $e');
      return [];
    }
  }

  static Future<int> updateItems(
      {required int id,
      required String title,
      required String photo,
      required String description,
      required int number,
      required int summ}) async {
    final db = await DBHelper.db();
    final data = {
      'title': title,
      'photo': photo,
      'description': description,
      'number': number,
      'summ': summ
    };
    final result =
        await db.update('items', data, where: 'id=?', whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItems(int id) async {
    final db = await DBHelper.db();
    try {
      await db.delete('items', where: 'id=?', whereArgs: [id]);
    } catch (e) {
      print('Something error is here: $e');
    }
  }
}
