// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:media_player_app/Features/audio_player/data/Repository/app_settings_repository.dart';
import 'package:media_player_app/Features/audio_player/data/Repository/audio_repository.dart';
import 'package:media_player_app/Features/audio_player/data/Repository/audio_player_repository.dart';
import 'package:media_player_app/Features/audio_player/data/db/app_database.dart';
import 'package:media_player_app/Features/audio_player/data/Repository/playback_sessions_repository.dart';

import 'package:media_player_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final audioRepository = AudioRepository();
    final audioPlayerRepository = AudioPlayerRepository();
    final database = AppDatabase(); // Or  test database instance
    final playbackSessionRepository = PlaybackSessionRepository(database);
    // Build our app and trigger a frame
    final appSettingsRepository = AppSettingsRepository(database);
    await tester.pumpWidget(
      MyApp(
        audioRepository: audioRepository,
        audioPlayerRepository: audioPlayerRepository,
        playbackSessionRepository: playbackSessionRepository,
        appSettingsRepository: appSettingsRepository,
        database: database,
      ),
    );

    // Allow any pending microtasks (like ThemeBloc's LoadThemeEvent DB read) to complete
    await tester.pumpAndSettle();

    // Verify that the app builds and renders without crashing
    expect(find.byType(MyApp), findsOneWidget);
    // // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);

    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
