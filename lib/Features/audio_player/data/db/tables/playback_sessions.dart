import 'package:drift/drift.dart';

class PlaybackSessions extends Table {
  //  one saved playback session
  IntColumn get id => integer().withDefault(const Constant(1))();

  // ID of the currently selected song
  TextColumn get songId => text()();

  // Last playback position in milliseconds
  IntColumn get position => integer().withDefault(const Constant(0))();

  // Queue song IDs stored as a JSON string
  TextColumn get queueSongIds => text()();

  // Index of the current song in the queue
  IntColumn get currentIndex => integer()();

  // Shuffle status
  BoolColumn get isShuffle => boolean().withDefault(const Constant(false))();

  // Repeat mode stored as a string
  TextColumn get repeatMode => text().withDefault(const Constant('off'))();

  TextColumn get originalQueueSongIds =>
      text().withDefault(const Constant('[]'))();

  @override
  Set<Column> get primaryKey => {id};
}
