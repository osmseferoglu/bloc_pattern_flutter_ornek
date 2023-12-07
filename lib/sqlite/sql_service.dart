// ignore_for_file: avoid_print

import "package:bloc_pattern_flutter_ornek/entity/person.dart";
import "package:sqflite/sqflite.dart";
import "package:path/path.dart";

class SqliteService {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Kisiler(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, phone TEXT NOT NULL)",
        );
      },
      version: 2,
    );
    
  }

  Future<int> insertPerson(int kisi_id, String kisi_ad,String kisi_tel ) async {
    var kisi = Kisi(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel);
    int result = 0;
    final Database db = await initializeDB();
    result = await db.insert('Kisiler', kisi.toMap());
    print(result);
    return result;
  }

  Future<List<Kisi>> getPersons() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('Kisiler');
    return queryResult.map((e) => Kisi.fromMap(e)).toList();
  }

  Future<int> deletePerson(int id) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.delete('Kisiler', where: 'id=?', whereArgs: [id]);
    return result;
  }
}
