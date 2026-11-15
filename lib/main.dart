import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_player_app/Features/Core/color_palettes.dart';
import 'package:media_player_app/Features/Core/splash_screen.dart';
import 'package:media_player_app/Features/audio_player/Logic/Audio/audio_bloc.dart';
import 'package:media_player_app/Features/audio_player/Logic/Audio/audio_event.dart';
import 'package:media_player_app/Features/audio_player/Logic/Library/library_bloc.dart';
import 'package:media_player_app/Features/audio_player/Logic/Player/player_bloc.dart';
import 'package:media_player_app/Features/audio_player/Logic/Theme/theme_bloc.dart';
import 'package:media_player_app/Features/audio_player/Logic/Theme/theme_state.dart';
import 'package:media_player_app/Features/audio_player/data/Repository/app_settings_repository.dart';
import 'package:media_player_app/Features/audio_player/data/Repository/audio_player_repository.dart';
import 'package:media_player_app/Features/audio_player/data/Repository/audio_repository.dart';
import 'package:media_player_app/Features/audio_player/data/Repository/playback_sessions_repository.dart';
import 'package:media_player_app/Features/audio_player/data/db/app_database.dart';
import 'package:media_player_app/Features/audio_player/Logic/Playlist/playlist_bloc.dart';
import 'package:media_player_app/Features/audio_player/Logic/Playlist/playlist_event.dart';
import 'package:media_player_app/Features/audio_player/data/Repository/playlist_repository.dart';
import 'package:just_audio_background/just_audio_background.dart';

import 'Features/Core/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.swarika.musicplayer.channel.audio',
    androidNotificationChannelName: 'Swarika Audio Playback',
    androidNotificationOngoing: true,
  );

  final audioRepository = AudioRepository();
  final audioPlayerRepository = AudioPlayerRepository();
  final database = AppDatabase();
  final playbackSessionRepository = PlaybackSessionRepository(database);
  final appSettingsRepository = AppSettingsRepository(database);
  runApp(
    MyApp(
      audioRepository: audioRepository,
      audioPlayerRepository: audioPlayerRepository,
      playbackSessionRepository: playbackSessionRepository,
      appSettingsRepository: appSettingsRepository,
      database: database,
    ),
  );
}

class MyApp extends StatelessWidget {
  final AudioRepository audioRepository;
  final AudioPlayerRepository audioPlayerRepository;
  final PlaybackSessionRepository playbackSessionRepository;
  final AppSettingsRepository appSettingsRepository;
  final AppDatabase database;
  const MyApp({
    super.key,
    required this.audioRepository,
    required this.audioPlayerRepository,
    required this.playbackSessionRepository,
    required this.appSettingsRepository,
    required this.database,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AppSettingsRepository>.value(
          value: appSettingsRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AudioBloc>(
            create: (context) =>
                AudioBloc(audioRepository: audioRepository)
                  ..add(FetchSongsEvent()),
          ),
          BlocProvider<PlayerBloc>(
            create: (context) => PlayerBloc(
              audioPlayerRepository: audioPlayerRepository,
              playbackSessionRepository: playbackSessionRepository,
            ),
          ),
          BlocProvider<LibraryBloc>(
            // Creates LibraryBloc and makes it available to HomeScreen.
            create: (context) => LibraryBloc(),
          ),
          BlocProvider<ThemeBloc>(
            create: (context) => ThemeBloc(appSettingsRepository),
          ),
          BlocProvider<PlaylistBloc>(
            create: (context) =>
                PlaylistBloc(repository: PlaylistRepository(database))
                  ..add(const LoadFavoritesEvent())
                  ..add(const LoadPlaylistsEvent()),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            final palette = colorPalettes.firstWhere(
              (palette) => palette.name == state.selectedPalette,
              orElse: () => colorPalettes.first,
            );
            return MaterialApp(
              title: 'Swarika',
              theme: AppTheme.lightTheme(palette),
              darkTheme: AppTheme.darkTheme(palette),
              themeMode: state.themeMode,
              debugShowCheckedModeBanner: false,
              home: const SplashScreen(),
            );
          },
        ),
      ),
    );
  }
}
