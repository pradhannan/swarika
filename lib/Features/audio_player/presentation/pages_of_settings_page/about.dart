import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:media_player_app/Features/audio_player/presentation/widgets/collapsing_title.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // CHANGED: Use the same collapsing app bar as ArtistsPage
          SliverAppBar(
            pinned: true,
            expandedHeight: 160,
            collapsedHeight: 64,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: const CollapsingTitle(title: 'About'),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/swarika_app_icon.png',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // App name
                  Text(
                    'S W A R I K A',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: colors.onSurface,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),

                  Text(
                    'Your Music. Your Rhythm.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: colors.primary,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.4,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Description
                  Text(
                    'A simple offline music player designed to give '
                    'you a clean and enjoyable way to listen to your '
                    'local music.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: colors.onSurface.withValues(alpha: 0.7),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      height: 1.7,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    'VERSION 1.0.0',
                    style: GoogleFonts.inter(
                      color: colors.onSurface.withValues(alpha: 0.5),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),

                  const SizedBox(height: 32),

                  Divider(color: colors.outlineVariant),

                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'App Information',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: colors.onSurface,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  _AboutItem(
                    icon: Icons.person_outline_rounded,
                    title: 'Developer',
                    value: 'The Pradhan',
                  ),
                  const SizedBox(height: 12),

                  _AboutItem(
                    icon: Icons.code_rounded,
                    title: 'GitHub',
                    value: 'View project source code',
                    trailing: true,

                    onTap: () async {
                      final uri = Uri.parse(
                        'https://github.com/pradhannan/swarika',
                      );

                      await launchUrl(
                        uri,
                        mode: LaunchMode.externalApplication,
                      );
                    },
                  ),
                  const SizedBox(height: 12),

                  _AboutItem(
                    icon: Icons.description_outlined,
                    title: 'Licenses',
                    value: 'View third-party licenses',
                    trailing: true,

                    onTap: () {
                      showLicensePage(
                        context: context,
                        applicationName: 'Swarika',
                        applicationVersion: '1.0.0',
                      );
                    },
                  ),

                  const SizedBox(height: 12),

                  _AboutItem(
                    icon: Icons.privacy_tip_outlined,
                    title: 'Privacy Policy',
                    value: 'How Swarika handles your data',
                    trailing: true,

                    onTap: () async {
                      final uri = Uri.parse(
                        'https://pradhannan.github.io/swarika/docs/privacy_policy.html',
                      );

                      await launchUrl(
                        uri,
                        mode: LaunchMode.externalApplication,
                      );
                    },
                  ),

                  const SizedBox(height: 12),

                  _AboutItem(
                    icon: Icons.gavel_rounded,
                    title: 'Terms & Conditions',
                    value: 'Terms for using Swarika',
                    trailing: true,

                    onTap: () async {
                      final uri = Uri.parse(
                        'https://pradhannan.github.io/swarika/docs/terms_and_conditions.html',
                      );

                      await launchUrl(
                        uri,
                        mode: LaunchMode.externalApplication,
                      );
                    },
                  ),
                  const SizedBox(height: 32),

                  // Framework
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.flutter_dash_rounded,
                        size: 18,
                        color: colors.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Built with Flutter',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: colors.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
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

class _AboutItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback? onTap;

  final bool trailing;

  const _AboutItem({
    required this.icon,
    required this.title,
    required this.value,
    this.onTap,

    this.trailing = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(icon, color: colors.primary, size: 22),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: colors.onSurface.withValues(alpha: 0.55),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      value,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: colors.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
              if (trailing)
                Icon(
                  Icons.open_in_new_rounded,
                  size: 18,
                  color: colors.onSurfaceVariant,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
