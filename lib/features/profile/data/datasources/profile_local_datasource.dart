import 'package:sqflite/sqflite.dart';

class ProfileLocalDataSource {
  final Database database;

  ProfileLocalDataSource(this.database);

  Future<void> savePersonalInfo(Map<String, dynamic> data) async {
    final List<Map<String, dynamic>> results =
        await database.query('personal_info');

    if (results.isEmpty) {
      await database.insert('personal_info', data);
      return;
    }

    final int? id = data['id'];

    if (id != null) {
      final List<Map<String, dynamic>> existingRecords = await database.query(
        'personal_info',
        where: 'id = ?',
        whereArgs: [id],
      );

      if (existingRecords.isNotEmpty) {
        await database.update(
          'personal_info',
          data,
          where: 'id = ?',
          whereArgs: [id],
        );
      } else {
        await database.insert('personal_info', data);
      }
    } else {
      await database.insert('personal_info', data);
    }
  }

  Future<Map<String, dynamic>> getPersonalInfo() async {
    final List<Map<String, dynamic>> results =
        await database.query('personal_info');
    if (results.isNotEmpty) {
      print(results);
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> clearPersonalInfo() async {
    await database.delete('personal_info');
  }
}
