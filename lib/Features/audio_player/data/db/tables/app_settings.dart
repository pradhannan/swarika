import 'package:drift/drift.dart';

class AppSettings extends Table {
  // Examples: theme_mode, accent_color
  TextColumn get key => text()();

  // Examples: dark, light
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}
