
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';

import '../db/app_database.dart';

class PlaybackSessionRepository {
  final AppDatabase database;

  PlaybackSessionRepository(this.database);

  Future<void> saveSession({
    required String songId,
    required Duration position,
    required List<String> queueSongIds,
    required List<String> originalQueueSongIds,
    required int currentIndex,
    required bool isShuffle,
    required String repeatMode,
  }) async {
    await database.into(database.playbackSessions).insertOnConflictUpdate(
      PlaybackSessionsCompanion.insert(
        id: const Value(1),
        songId: songId,
        position: Value(position.inMilliseconds),
        queueSongIds: jsonEncode(queueSongIds),
        originalQueueSongIds: Value(
          jsonEncode(originalQueueSongIds),
        ),
        currentIndex: currentIndex,
        isShuffle: Value(isShuffle),
        repeatMode: Value(repeatMode),
      ),
    );
  }

  Future<SavedPlaybackSession?> getSavedSession() async {
    final result = await database
        .select(database.playbackSessions)
        .getSingleOrNull();

    if (result == null) return null;

    try {
      return SavedPlaybackSession(
        songId: result.songId,
        position: Duration(milliseconds: result.position),
        queueSongIds: List<String>.from(
          jsonDecode(result.queueSongIds) as List,
        ),
        originalQueueSongIds: List<String>.from(
          jsonDecode(result.originalQueueSongIds) as List,
        ),
        currentIndex: result.currentIndex,
        isShuffle: result.isShuffle,
        repeatMode: result.repeatMode,
      );
    } catch (e, stackTrace) {
      // Ignore an invalid saved session
      debugPrint('Failed to restore playback session: $e\n$stackTrace');
      return null;
    }
  }

  Future<void> clearSession() async {
    await database.delete(database.playbackSessions).go();
  }
}

class SavedPlaybackSession {
  final String songId;
  final Duration position;
  final List<String> queueSongIds;
  final List<String> originalQueueSongIds;
  final int currentIndex;
  final bool isShuffle;
  final String repeatMode;

  SavedPlaybackSession({
    required this.songId,
    required this.position,
    required this.queueSongIds,
    required this.originalQueueSongIds,
    required this.currentIndex,
    required this.isShuffle,
    required this.repeatMode,
  });
}
