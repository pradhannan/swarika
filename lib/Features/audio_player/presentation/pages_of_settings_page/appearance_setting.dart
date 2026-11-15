import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_player_app/Features/Core/color_palettes.dart';
import 'package:media_player_app/Features/audio_player/Logic/Theme/theme_bloc.dart';
import 'package:media_player_app/Features/audio_player/Logic/Theme/theme_event.dart';
import 'package:media_player_app/Features/audio_player/Logic/Theme/theme_state.dart';
import 'package:media_player_app/Features/audio_player/presentation/widgets/collapsing_title.dart';
import 'package:media_player_app/Features/audio_player/presentation/widgets/setting_pages/container_settings.dart';

class AppearanceSettingsScreen extends StatelessWidget {
  const AppearanceSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            titleSpacing: 0,
            pinned: true,
            expandedHeight: 160,
            collapsedHeight: 64,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: CollapsingTitle(title: "Appearance"),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CHANGED: Test SettingsContainer
                  BlocBuilder<ThemeBloc, ThemeState>(
                    builder: (context, state) {
                      return SettingsContainer(
                        title: 'Dark Theme',
                        subtitle: 'Choose how the app looks',
                        switchValue: state.themeMode == ThemeMode.dark,
                        onSwitchChanged: (value) {
                          context.read<ThemeBloc>().add(
                            ThemeModeChanged(
                              value ? ThemeMode.dark : ThemeMode.light,
                            ),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 12),

                  SettingsContainer(
                    title: 'Cat Theme',
                    subtitle: 'Give your player a cat-inspired look',
                    switchValue: false,
                    onSwitchChanged: (value) {
                      final colors = Theme.of(context).colorScheme;

                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            content: Text(
                              '>"< Wait for upgraded version >.<',
                              style: TextStyle(
                                color: colors.onSurface,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            backgroundColor: colors.surface,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height - 100,
                              left: 16,
                              right: 16,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 18,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide(
                                color: colors.primary.withValues(alpha: 0.4),
                              ),
                            ),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                    },
                  ),

                  const SizedBox(height: 12),

                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: colors.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: colors.outline),
                      boxShadow: const [
                        BoxShadow(blurRadius: 6, offset: Offset(0, 3)),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Color Scheme',
                          style: TextStyle(
                            color: colors.onSurface,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Choose the look for your music player",
                          style: TextStyle(
                            color: colors.onSurfaceVariant,
                            fontSize: 14,
                          ),
                        ),
                        BlocBuilder<ThemeBloc, ThemeState>(
                          builder: (context, state) {
                            final isDark = state.themeMode == ThemeMode.dark;

                            return GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: colorPalettes.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12,
                                    childAspectRatio: 1.0,
                                  ),
                              itemBuilder: (context, index) {
                                final palette = colorPalettes[index];

                                final background = isDark
                                    ? palette.darkBackground
                                    : palette.lightBackground;

                                final surface = isDark
                                    ? palette.darkSurface
                                    : palette.lightSurface;

                                final primary = isDark
                                    ? palette.darkPrimary
                                    : palette.lightPrimary;

                                final text = isDark
                                    ? palette.darkText
                                    : palette.lightText;

                                final isSelected =
                                    state.selectedPalette == palette.name;

                                return GestureDetector(
                                  onTap: () {
                                    context.read<ThemeBloc>().add(
                                      ColorPaletteChanged(palette.name),
                                    );
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: surface,
                                      borderRadius: BorderRadius.circular(18),
                                      border: Border.all(
                                        color: isSelected
                                            ? primary
                                            : Theme.of(context).dividerColor
                                                  .withValues(alpha: 0.25),
                                        width: isSelected ? 2 : 1,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              11,
                                            ),
                                            child: Container(
                                              color: background,
                                              padding: const EdgeInsets.all(8),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Swarika',
                                                        style: TextStyle(
                                                          color: text,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .music_note_rounded,
                                                        color: primary,
                                                        size: 15,
                                                      ),
                                                    ],
                                                  ),

                                                  const SizedBox(height: 8),

                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: 35,
                                                        width: 35,
                                                        decoration: BoxDecoration(
                                                          color: primary,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                7,
                                                              ),
                                                        ),
                                                        child: const Icon(
                                                          Icons
                                                              .music_note_rounded,
                                                          color: Colors.white,
                                                          size: 19,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 7),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              height: 5,
                                                              width: 48,
                                                              decoration:
                                                                  BoxDecoration(
                                                                    color: text,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                          5,
                                                                        ),
                                                                  ),
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            Container(
                                                              height: 4,
                                                              width: 30,
                                                              decoration: BoxDecoration(
                                                                color: text
                                                                    .withValues(
                                                                      alpha:
                                                                          0.45,
                                                                    ),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      5,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  const Spacer(),

                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          height: 3,
                                                          decoration: BoxDecoration(
                                                            color: primary,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  5,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Icon(
                                                        Icons
                                                            .play_arrow_rounded,
                                                        color: primary,
                                                        size: 15,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),

                                        const SizedBox(height: 7),

                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                palette.name,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: text,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            if (isSelected)
                                              Icon(
                                                Icons.check_circle_rounded,
                                                color: primary,
                                                size: 17,
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
