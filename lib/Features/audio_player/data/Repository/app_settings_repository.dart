import 'package:media_player_app/Features/audio_player/data/db/app_database.dart';

class AppSettingsRepository {
  final AppDatabase _db;

  AppSettingsRepository(this._db);

  //setting key-value pair

  Future<void> setSetting (String key, String value) async{
    await _db.into(_db.appSettings).insertOnConflictUpdate(
      AppSettingsCompanion.insert(key: key, value: value),
    );

  }

  //Getting a setting value with key
  Future<String?> getSetting(String key) async{
    final query = _db.select(_db.appSettings)..where((t)=> t.key.equals(key));
    final result = await query.getSingleOrNull();
    return result?.value;
  }
}