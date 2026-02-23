<div align="center">

# ✨ sDesign

**A beautiful, fluid, and robust UI component library for Flutter.**

[![Pub Package](https://img.shields.io/pub/v/s_design.svg?style=for-the-badge&color=03DAC6)](https://pub.dev/packages/s_design)
[![GitHub Stars](https://img.shields.io/github/stars/FRANK732/s_design?style=for-the-badge&color=D87F19)](https://github.com/FRANK732/s_design/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

_Craft stunning, professional, and accessible user interfaces with minimal code. Inspired by the world's best design systems._

[**Live Interactive Gallery**](https://frank732.github.io/s_design) • [**Getting Started**](#-getting-started) • [**Components**](#-rich-components) • [**Theming**](#-advanced-theming)

</div>

---

## 💎 Features

- 🌈 **Enterprise-class UI** designed for professional cross-platform applications.
- 📦 **High-quality Flutter components** that work right out of the box.
- 🛡 **Predictable static typing** enforced by Dart's sound null safety.
- ⚙️ **Whole package of design resources** including centralized tokens.
- 🌍 **Internationalization support** for dozens of languages built-in.
- 🎨 **Powerful theme customization** with dynamic runtime switching.

## 🖥 Environment Support

sDesign provides native-feeling components across all Flutter targets:

| [<img src="https://raw.githubusercontent.com/alrra/browser-logos/master/src/edge/edge_48x48.png" alt="Web" width="24px" height="24px" />]()<br>Web | [<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/IOS_14_Logo.svg/1024px-IOS_14_Logo.svg.png" alt="iOS" width="24px" height="24px" />]()<br>iOS | [<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Android_robot.svg/872px-Android_robot.svg.png" alt="Android" width="24px" height="24px" />]()<br>Android | [<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/Finder_Icon_macOS_Big_Sur.png/1024px-Finder_Icon_macOS_Big_Sur.png" alt="macOS" width="24px" height="24px" />]()<br>macOS | [<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Windows_logo_-_2012.svg/1024px-Windows_logo_-_2012.svg.png" alt="Windows" width="24px" height="24px" />]()<br>Windows |
| -------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Evergreen Browsers                                                                                                                                 | iOS 12+                                                                                                                                                            | Android 5.0+                                                                                                                                                                  | macOS 10.14+                                                                                                                                                                                   | Windows 10+                                                                                                                                                                                |

---

## 📦 Getting Started

### Installation

Add **sDesign** intercept to your `pubspec.yaml`:

```yaml
dependencies:
  s_design: ^0.3.2+1
```

### Quick Setup

Wrap your application in `SApp` to instantly inject the design system, theming engine, and localization delegates.

```dart
import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SApp(
      title: 'My Flawless App',
      // sDesign provides beautiful default light/dark themes
      theme: SThemeData.light(),
      darkTheme: SThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const MyHomePage(),
    );
  }
}
```

---

## 🧩 Rich Components

sDesign provides a comprehensive suite of 20+ robust, accessible, and customizable components.

<details>
<summary><b>Inputs & Forms</b></summary>

- `SButton` - Highly versatile buttons with variants (Primary, Secondary, Outline, Ghost, Link, Destructive).
- `SInput` - Beautiful text fields with built-in validation, suffix/prefix support, and clear buttons.
- `SSelect` / `SDropdown` - Elegant select menus supporting search, single/multi-selection, and bottom sheets.
- `SCheckbox` / `SSwitch` / `SRadio` - Crisp toggles with intermediate states and smooth animations.
- `SDatePicker` / `STimePicker` - Native-feeling, localized date and time pickers.
- `SSlider` / `SRate` - Fluid range inputs and star ratings.
</details>

<details>
<summary><b>Layout & Navigation</b></summary>

- `SScaffold` - A supercharged scaffold with built-in pull-to-refresh, drawers, and loading states.
- `STabs` - Mobile-first, swipeable tab views with sticky headers.
- `SPagination` - Elegant pagination controls.
- `SCard` - Elevated, bordered, and interactive container blocks.
</details>

<details>
<summary><b>Feedback & Overlays</b></summary>

- `SSonner` - A sophisticated, stackable toast notification system.
- `SDialog` / `SAlert` - Imperative, beautifully styled modals and inline callouts.
- `SProgress` / `SLoadingIndicator` - Indeterminate and determinate spinners and progress bars.
- `SFloatingPanel` - Draggable, bottom-sheet style overlay panels.
</details>

### Example: The Almighty `SButton`

No more bloated button configurations.

```dart
SButton(
  variant: SButtonVariant.primary,
  size: SButtonSize.lg,
  icon: const Icon(Icons.send),
  loading: _isSubmitting, // Built-in loading state!
  onPressed: () => submitData(),
  child: const Text('Publish Post'),
)
```

---

## 🎨 Advanced Theming

Forget fighting with Flutter's default `ThemeData`. sDesign introduces `SThemeData`, a type-safe, token-driven theming engine.

### Injecting Your Brand

Customizing the entire library to match your brand takes seconds:

```dart
// 1. Define your brand colors
class MyBrandColors extends SColorsBase {
  @override Color get primary => const Color(0xFF6366F1); // Indigo
  @override Color get secondary => const Color(0xFF8B5CF6); // Purple
  @override Color get surface => Colors.white;
  // ... customize as few or as many tokens as you need
}

// 2. Build the theme
final myTheme = STheme.buildCustomTheme(
  colors: MyBrandColors(),
);

// 3. Pass it to SApp!
SApp(
  theme: myTheme,
  home: const Home(),
)
```

**Every component** (`SButton`, `STabs`, `SSelect`, etc.) will automatically adopt your brand colors flawlessly.

---

## 🌍 Localization (i18n)

sDesign natively speaks your user's language. Strings like "Search...", "Cancel", and "No data" are automatically translated.

By wrapping your app in `SApp`, localization is handled automatically:

```dart
SApp(
  supportedLocales: const [
    Locale('en', 'US'),
    Locale('fr', 'FR'),
    Locale('ar', 'AE'), // RTL Support built-in!
    Locale('zh', 'CN'),
  ],
  // ...
)
```

_Need a language we don't support yet? You can easily inject your own `SLocalizationsDelegate`!_

---

## 🔔 The SSonner Notification System

Ditch basic snackbars. `SSonner` provides a gorgeous, stackable, animated toast system.

```dart
// Initialize once in your app overlay
SSonner.instance.initialize(Overlay.of(context));

// Call it from anywhere
SSonner.instance.show(
  title: 'Profile Updated',
  message: 'Your settings have been saved successfully.',
  variant: SSonnerVariant.success,
  position: SSonnerPosition.bottom,
);
```

---

## 🔗 Links

- [Home page](https://frank732.github.io/s_design)
- [Components Overview](https://frank732.github.io/s_design/components)
- [Customize Theme](https://frank732.github.io/s_design/theme)
- [Change Log](CHANGELOG.md)
- [FAQ](https://frank732.github.io/s_design/faq)
- [Design Tokens](https://frank732.github.io/s_design/tokens)

---

## ⌨️ Development

Clone the repository locally to run the interactive gallery:

```bash
$ git clone git@github.com:FRANK732/s_design.git
$ cd s_design/example
$ flutter pub get
$ flutter run -d chrome
```

Open your browser to see the interactive component gallery and theming engine in action.

---

## 🤝 Contributing [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](https://makeapullrequest.com)

We believe in the power of open source. If you have ideas, feature requests, or have found a bug, we want to hear from you!

1. Check out our [GitHub Issues](https://github.com/FRANK732/s_design/issues).
2. Fork the repository.
3. Create your feature branch (`git checkout -b feature/AmazingFeature`).
4. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
5. Push to the branch (`git push origin feature/AmazingFeature`).
6. Open a Pull Request.

---

<div align="center">
  <p>Built with ❤️ by <a href="https://github.com/FRANK732">FRANK732</a></p>
  <p>Licensed under the MIT License.</p>
</div>
