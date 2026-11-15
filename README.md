
# Swarika – Offline Music Player

Swarika is a Flutter-based offline music player for Android, designed to provide a simple and convenient way to enjoy music stored locally on your device.

This is my first major Flutter project, developed through learning, experimentation, problem-solving, and the assistance of AI tools.

## Features

1. Browse and play music stored on your device.
2. Background audio playback.
3. Browse music by artists, albums, genres, and folders.
4. Save favourite songs, create and manage custom playlists.
5. Manage the playback queue, shuffle, and repeat playback.
6. Sleep timer.
7. Light and dark appearance options.
8. Media playback controls and notifications.

## Tech Stack

| Category | Library / Technology | Purpose |
| :--- | :--- | :--- |
| **Core Framework** | Flutter & Dart | Application development |
| **State Management** | `flutter_bloc` | Managing application state and separating UI from business logic |
| **Audio Engine** | `just_audio` | Audio playback |
| **Background Service** | `just_audio_background` / `audio_service` | Background playback and media notification controls |
| **Media Scanner** | `on_audio_query` | Accessing local audio files and their metadata |
| **Local Database** | Drift & SQLite | Storing favourites and playlists |
| **Permissions** | `permission_handler` | Managing application permissions |

## Download Latest Release

You can download the latest version of Swarika from the [GitHub Releases](https://github.com/pradhannan/swarika/releases/latest) page.

### Installation

1. Open the Releases page.
2. Select the latest release.
3. Download the `app-release.apk` file from the Assets section.
4. Open the downloaded APK on your Android device.
5. Allow installation from your browser or file manager if Android requests permission.
6. Complete the installation and enjoy Swarika!

**Note:** Swarika is currently distributed as an APK through GitHub. It is not currently listed on Google Play or F-Droid.

## Screenshots

<table>
  <tr>
    <td align="center"><b>Splash Screen</b><br><img src="https://github.com/user-attachments/assets/544abbe6-d3f5-42bb-943a-682b7d3ca16a" width="160" alt="Splash"></td>
    <td align="center"><b>Home Screen</b><br><img src="https://github.com/user-attachments/assets/8f1857c6-dc95-48fb-8885-f3663994cc15" width="160" alt="Home"></td>
    <td align="center"><b>Full Player</b><br><img src="https://github.com/user-attachments/assets/551ece78-6126-4614-820f-ecde97a7b71e" width="160" alt="Player"></td>
    <td align="center"><b>Artists</b><br><img src="https://github.com/user-attachments/assets/5aa83aba-dc5d-47d6-9e65-859c90c81e75" width="160" alt="Artists"></td>
    <td align="center"><b>Artist Detail</b><br><img src="https://github.com/user-attachments/assets/818c63bf-aa23-47d3-961b-2abe2d92a671" width="160" alt="Artist"></td>
  </tr>
  <tr>
    <td align="center"><b>Queue / Now Playing</b><br><img src="https://github.com/user-attachments/assets/c49b9d30-60cd-4b7c-8b57-7899d48b85b2" width="160" alt="Queue"></td>
    <td align="center"><b>Sleep Timer</b><br><img src="https://github.com/user-attachments/assets/83dc1ff3-7222-4bcd-959b-21a0d8d725ff" width="160" alt="Timer"></td>
    <td align="center"><b>Appearance</b><br><img src="https://github.com/user-attachments/assets/08858661-2554-4ed5-bde7-2ab10b8608e9" width="160" alt="Appearance"></td>
    <td align="center"><b>Settings</b><br><img src="https://github.com/user-attachments/assets/f756c26f-4b70-468c-b775-ef2cc0690cb5" width="160" alt="Settings"></td>
    <td align="center"><b>Playlists</b><br><img src="https://github.com/user-attachments/assets/f878abe0-1b4b-4f01-8569-c55c125f0471" width="160" alt="Playlists"></td>
  </tr>
</table>




## Known Limitations and Future Improvements

Swarika is a developing project, and there are still areas that can be improved.

Some planned improvements include:

1. Further refinement of playback notifications and media controls.
2. UI improvements and visual refinements.
3. Additional themes and colour customisation options.
4. General performance improvements and bug fixes.

The playback notification functionality is present, but still needs further refinement. UI changes and additional themes may also be introduced in future updates.

## Using the Source Code

The source code is publicly available, and you are welcome to explore it, learn from its implementation, and experiment with your own changes.

### Clone the Repository

```bash
git clone https://github.com/pradhannan/swarika.git
```

### Navigate to the Project

```bash
cd swarika
```

### Install Dependencies

```bash
flutter pub get
```

### Generate Drift Database Files

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Run the Application

```bash
flutter run
```

### Make Your Own Changes

You can open the project in Android Studio or VS Code and modify the UI, features, application logic, or other parts of the codebase.

If you make improvements or create your own version, feel free to experiment and learn from the project.

Please check the repository's license before redistributing modified versions or using the code in other projects.

## Development and AI Assistance

Swarika was developed by me using Flutter and Dart, with the assistance of AI tools throughout the development process.

AI was used as a development aid for learning, understanding concepts, troubleshooting errors, exploring implementation approaches, and improving the application.

The development decisions, testing, integration, and overall project direction were handled by me.

This project represents my learning journey and experience building an application from the ground up.

---

Made with ❤️ using Flutter.

Thank you for checking out Swarika!
