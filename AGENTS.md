# my_first_app — Agent Context

## Project Overview

- **Name**: my_first_app
- **Type**: Flutter mobile application
- **SDK**: Dart ^3.12.2 / Flutter stable
- **Platforms**: Android, iOS, Web, Windows, macOS, Linux
- **Version**: 1.0.0+1

A beginner Flutter project — minimal UI, no state management or routing yet.

## Project Structure

```
my_first_app/
├── lib/
│   ├── main.dart              # Entry point — runApp(MyApp)
│   └── UI/
│       └── home_screen.dart   # HomeScreen (Scaffold + AppBar)
├── test/
│   └── widget_test.dart       # Default smoke test (outdated — references counter not in code)
├── android/                   # Android platform config
├── ios/                       # iOS platform config
├── web/                       # Web platform config
├── windows/                   # Windows desktop config
├── macos/                     # macOS desktop config
├── linux/                     # Linux desktop config
├── pubspec.yaml               # Dependencies & metadata
├── analysis_options.yaml      # Lint rules
└── README.md                  # Generic template (to be updated)
```

## Architecture (Current)

```
main.dart → MyApp (StatelessWidget)
              └── MaterialApp
                    └── HomeScreen (StatelessWidget)
                          └── Scaffold
                                └── AppBar
```

- No state management (plain `StatelessWidget`)
- No routing (single screen)
- No custom assets or plugins

## Key Files

| File | Purpose |
|---|---|
| `lib/main.dart:4` | App entry point — creates `MyApp` widget |
| `lib/main.dart:8-18` | `MyApp` — StatelessWidget with MaterialApp, amber accent |
| `lib/UI/home_screen.dart:3-11` | `HomeScreen` — bare Scaffold with AppBar |
| `test/widget_test.dart` | Widget test (currently references non-existent counter) |
| `pubspec.yaml` | Dependencies: flutter, cupertino_icons, flutter_test, flutter_lints |

## Dependencies

- **flutter** (SDK)
- **cupertino_icons** ^1.0.8 — iOS-style icons
- **flutter_test** (dev) — widget testing
- **flutter_lints** ^6.0.0 (dev) — recommended lint rules

To add a dependency: `flutter pub add <package>`

## Commands

| Command | Purpose |
|---|---|
| `flutter run` | Run on connected device/emulator |
| `flutter test` | Run tests |
| `flutter analyze` | Static analysis (run before committing) |
| `flutter pub get` | Resolve dependencies |
| `flutter build apk` | Build Android APK |
| `flutter build ios` | Build iOS (macOS only) |
| `flutter build web` | Build for web |

## Coding Conventions

- Widgets: `PascalCase` — `MyApp`, `HomeScreen`
- Files: `snake_case.dart` — `home_screen.dart`
- Folders: `PascalCase/` for UI screens — `lib/UI/`
- Use `const` constructors where possible
- Use `super.key` for widget keys
- Prefer `StatelessWidget` unless state is needed

## Testing

- Framework: `flutter_test`
- Test location: `test/widget_test.dart`
- Current test is the default Flutter smoke test — it looks for a counter (`find.text('0')`) that doesn't exist in the current codebase. This test will fail until updated.

## Agent Guidelines

1. Keep UI screens in `lib/UI/`
2. Run `flutter analyze` before suggesting changes — fix all warnings
3. When adding state, use `StatefulWidget` or introduce a state management package
4. Update `test/widget_test.dart` to match actual widget structure when modifying screens
5. Follow existing patterns (file naming, widget naming, folder layout)
6. Verify changes with `flutter test` before finalizing
