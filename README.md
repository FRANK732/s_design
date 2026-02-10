# ✨ sDesign - Flutter UI Component Library 🌟

[![Pub Package](https://img.shields.io/pub/v/s_design.svg)](https://pub.dev/packages/s_design) [![GitHub Issues](https://img.shields.io/github/issues/FRANK732/s_design)](https://github.com/FRANK732/s_design/issues) [![GitHub Forks](https://img.shields.io/github/forks/FRANK732/s_design)](https://github.com/FRANK732/s_design/network) [![GitHub Stars](https://img.shields.io/github/stars/FRANK732/s_design)](https://github.com/FRANK732/s_design/stargazers)

**sDesign** is a powerful Flutter UI component library designed to help developers craft stunning, consistent, and professional user interfaces with minimal effort. Featuring widgets like `SScaffold`, `SButton`, `SCheckbox`, and `SSonner`, it’s your go-to toolkit for building polished, responsive apps! 🚀

## 🎖 Installing 📦

Add **sDesign** to your Flutter project:

```yaml
dependencies:
  s_design: ^0.3.2+1
```

### ⚡️ Import

```dart
import 'package:s_design/s_design.dart';
```

## 🎮 Getting Started with SScaffold 🏗️

The `SScaffold` widget is a supercharged version of Flutter’s `Scaffold`, offering advanced features like pull-to-refresh 🔄, loading states with shimmer effects ⏳, customizable floating action buttons 🛠️, and drawers 📂. It simplifies building complex, user-friendly layouts.

### Example: SScaffold with SButton, SCheckbox, and SSonner 🎉

```dart
import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myOverlays = [
      OverlayEntry(
        builder: (overlayContext) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final overlay = Overlay.of(overlayContext);
            SSonner.instance.initialize(overlay);
            SToast.initialize(overlay);
          });
          return const SizedBox.shrink();
        },
      ),
    ];

    return MaterialApp(
      builder: sOverlayBuilder(overlays: myOverlays),
      home: SScaffold(
        appBar: AppBar(
          title: const Text('sDesign Showcase 🌟'),
          backgroundColor: Colors.teal,
        ),
        renderBody: (context) => SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'SCheckbox & SButton Demo',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  SCheckbox(
                    value: SCheckboxState.unchecked,
                    onChanged: (state) => print('Checkbox: $state ✅'),
                    size: 24.0,
                    activeColor: Colors.teal,
                    checkColor: Colors.white,
                    intermediate: true,
                  ),
                  const SizedBox(width: 10),
                  const Text('Custom Checkbox'),
                ],
              ),
              const SizedBox(height: 20),
              SButton(
                onPressed: () {
                  SSonner.instance.show(
                    message: 'Success! Action completed! 🎉',
                    type: SSonnerType.success,
                    duration: const Duration(seconds: 3),
                  );
                },
                child: const Text('Show Success Sonner 📢'),
                variant: SButtonVariant.primary,
                size: SButtonSize.lg,
                icon: const Icon(Icons.check_circle),
              ),
              const SizedBox(height: 20),
              SButton(
                onPressed: () {
                  SToast.show(
                    title: 'Hello!',
                    description: 'This is a default toast. 👋',
                  );
                },
                child: const Text('Show Default Toast 🔔'),
                variant: SButtonVariant.secondary,
              ),
            ],
          ),
        ),
        scrollable: true,
        refreshConfig: RefreshConfig(
          enabled: true,
          onRefresh: () async => await Future.delayed(const Duration(seconds: 2)),
          indicatorColor: Colors.teal,
          animationType: RefreshAnimationType.standard,
        ),
        floatingActionButtonConfig: FloatingActionButtonConfig(
          floatingActionButton: FloatingActionButton(
            onPressed: () => print('FAB Pressed! 🛠️'),
            child: const Icon(Icons.add),
            backgroundColor: Colors.teal,
          ),
        ),
        backgroundColor: Colors.grey[100],
      ),
    );
  }
}
```

### Example: SCheckbox Showcase with SScaffold ✅

```dart
import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class CheckboxPage extends StatefulWidget {
  const CheckboxPage({super.key});

  @override
  State<CheckboxPage> createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<CheckboxPage> {
  SCheckboxState _defaultCheckboxState = SCheckboxState.unchecked;
  SCheckboxState _customColoredCheckboxState = SCheckboxState.unchecked;
  SCheckboxState _largeStyledCheckboxState = SCheckboxState.unchecked;
  final SCheckboxState _disabledCheckboxState = SCheckboxState.unchecked;
  SCheckboxState _indeterminateCheckboxState = SCheckboxState.unchecked;

  @override
  Widget build(BuildContext context) {
    return SScaffold(
      appBar: AppBar(
        title: const Text('SCheckbox Showcase 🌟'),
        backgroundColor: Colors.teal,
      ),
      renderBody: (context) => SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Default Checkbox'),
            Row(
              children: [
                SCheckbox(
                  value: _defaultCheckboxState,
                  onChanged: (newState) => setState(() => _defaultCheckboxState = newState),
                ),
                const SizedBox(width: 10),
                const Text('Default Checkbox ✅'),
              ],
            ),
            const Divider(height: 40),
            _buildSectionTitle('Custom Colored Checkbox'),
            Row(
              children: [
                SCheckbox(
                  value: _customColoredCheckboxState,
                  onChanged: (newState) => setState(() => _customColoredCheckboxState = newState),
                  size: 24.0,
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  borderColor: Colors.green,
                ),
                const SizedBox(width: 10),
                const Text('Custom Colored Checkbox 🌈'),
              ],
            ),
            const Divider(height: 40),
            _buildSectionTitle('Large Styled Checkbox'),
            Row(
              children: [
                SCheckbox(
                  value: _largeStyledCheckboxState,
                  onChanged: (newState) => setState(() => _largeStyledCheckboxState = newState),
                  size: 30.0,
                  activeColor: Colors.blue,
                  checkColor: Colors.yellow,
                  borderColor: Colors.blueAccent,
                ),
                const SizedBox(width: 10),
                const Text('Large Styled Checkbox 📏'),
              ],
            ),
            const Divider(height: 40),
            _buildSectionTitle('Disabled Checkbox'),
            Row(
              children: [
                SCheckbox(
                  value: _disabledCheckboxState,
                  onChanged: null,
                  size: 24.0,
                  activeColor: Colors.grey,
                  checkColor: Colors.white,
                  borderColor: Colors.grey,
                  isDisabled: true,
                ),
                const SizedBox(width: 10),
                const Text('Disabled Checkbox 🔒'),
              ],
            ),
            const Divider(height: 40),
            _buildSectionTitle('Determinate Checkbox'),
            Row(
              children: [
                SCheckbox(
                  intermediate: false,
                  value: _indeterminateCheckboxState,
                  onChanged: (newState) => setState(() => _indeterminateCheckboxState = newState),
                  size: 24.0,
                  activeColor: Colors.orange,
                  checkColor: Colors.white,
                  borderColor: Colors.orange,
                ),
                const SizedBox(width: 10),
                const Text('Determinate Checkbox ⚙️'),
              ],
            ),
          ],
        ),
      ),
      scrollable: true,
      backgroundColor: Colors.grey[100],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
```

### Example: SButton Showcase with SScaffold 🎨

```dart
import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  bool _isLoading = false;
  bool _isEnabled = true;

  void _toggleLoading() => setState(() => _isLoading = !_isLoading);
  void _toggleEnabled() => setState(() => _isEnabled = !_isEnabled);

  @override
  Widget build(BuildContext context) {
    return SScaffold(
      appBar: AppBar(
        title: const Text('SButton Showcase 🎨'),
        backgroundColor: Colors.teal,
      ),
      renderBody: (context) => SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Variants', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(spacing: 10, runSpacing: 10, children: [
              SButton(onPressed: () {}, child: const Text('Default')),
              SButton(variant: SButtonVariant.destructive, onPressed: () {}, child: const Text('Destructive')),
              SButton(variant: SButtonVariant.secondary, onPressed: () {}, child: const Text('Secondary')),
              SButton(variant: SButtonVariant.outline, onPressed: () {}, child: const Text('Outline')),
              SButton(variant: SButtonVariant.destructiveOutline, onPressed: () {}, child: const Text('Destructive Outline')),
              SButton(variant: SButtonVariant.ghost, onPressed: () {}, child: const Text('Ghost')),
              SButton(variant: SButtonVariant.link, onPressed: () {}, child: const Text('Link')),
            ]),
            const Divider(height: 40),
            const Text('Sizes', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(spacing: 10, runSpacing: 10, children: [
              SButton(size: SButtonSize.sm, onPressed: () {}, child: const Text('Small')),
              SButton(onPressed: () {}, child: const Text('Default')),
              SButton(size: SButtonSize.lg, onPressed: () {}, child: const Text('Large')),
              SButton(size: SButtonSize.icon, onPressed: () {}, icon: const Icon(Icons.thumb_up)),
            ]),
            const Divider(height: 40),
            const Text('States', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(spacing: 10, runSpacing: 10, children: [
              SButton(onPressed: _toggleLoading, child: Text(_isLoading ? 'Stop Loading' : 'Start Loading')),
              SButton(loading: _isLoading, onPressed: () {}, child: const Text('Loading')),
              SButton(state: SButtonState.enabled, onPressed: () {}, child: const Text('Enabled')),
              SButton(state: SButtonState.disabled, onPressed: () {}, child: const Text('Disabled')),
              SButton(
                state: _isEnabled ? SButtonState.enabled : SButtonState.disabled,
                onPressed: _isEnabled ? () {} : null,
                child: Text(_isEnabled ? 'Enabled' : 'Disabled'),
              ),
              SButton(onPressed: _toggleEnabled, child: Text(_isEnabled ? 'Disable Button' : 'Enable Button')),
            ]),
            const Divider(height: 40),
            const Text('With Icons', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(spacing: 10, runSpacing: 10, children: [
              SButton(icon: const Icon(Icons.add), onPressed: () {}, child: const Text('Add')),
              SButton(variant: SButtonVariant.destructive, icon: const Icon(Icons.delete), onPressed: () {}, child: const Text('Delete')),
              SButton(variant: SButtonVariant.secondary, icon: const Icon(Icons.edit), onPressed: () {}, child: const Text('Edit')),
              SButton(size: SButtonSize.icon, icon: const Icon(Icons.favorite), onPressed: () {}),
            ]),
            const Divider(height: 40),
            const Text('Custom Themed Buttons', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(spacing: 10, runSpacing: 10, children: [
              SButton(backgroundColor: const Color.fromARGB(170, 98, 25, 187), onPressed: () {}, child: const Text('Background Color')),
              SButton(
                buttonStyle: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.black),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  elevation: WidgetStateProperty.all(5),
                ),
                onPressed: () {},
                child: const Text('Custom Styling'),
              ),
            ]),
          ],
        ),
      ),
      scrollable: true,
      backgroundColor: Colors.grey[100],
    );
  }
}
```

## � Theming & Customization 🌈

sDesign provides a **production-ready, centralized theming system** that makes it easy to customize the entire library's appearance. All 13 components use a consistent color palette and typography system with full dark mode support.

### Quick Start with Themes

sDesign comes with built-in light and dark themes that you can use immediately:

```dart
import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sTheme = STheme();

    return MaterialApp(
      title: 'sDesign App',
      theme: sTheme.getLightTheme(),        // Light theme ☀️
      darkTheme: sTheme.getDarkTheme(),     // Dark theme 🌙
      themeMode: ThemeMode.system,          // Follows system preference
      home: MyHomePage(),
    );
  }
}
```

### Accessing Component Themes

Every sDesign component has its own theme that you can access via convenient extension methods:

```dart
// In any widget's build method
final buttonTheme = Theme.of(context).sButtonTheme;
final checkboxTheme = Theme.of(context).sCheckboxTheme;
final dialogTheme = Theme.of(context).sDialogTheme;
final inputTheme = Theme.of(context).sInputFieldTheme;
// ... and 9 more component themes!
```

### Custom Color Scheme 🎨

Want to brand sDesign with your own colors? Create a custom color scheme by extending `SColorsBase`:

```dart
import 'package:s_design/s_design.dart';
import 'package:flutter/material.dart';

class MyBrandColors extends SColorsBase {
  const MyBrandColors();

  @override
  Color get primary => const Color(0xFF6366F1);  // Indigo

  @override
  Color get secondary => const Color(0xFF8B5CF6);  // Purple

  @override
  Color get background => const Color(0xFFFAFAFA);

  @override
  Color get surface => Colors.white;

  @override
  Color get error => const Color(0xFFEF4444);

  @override
  Color get textPrimary => const Color(0xFF1F2937);

  @override
  Color get textSecondary => const Color(0xFF6B7280);

  // Implement all other required color properties...
  // See SColorsBase for the full list
}

// Apply your custom colors
void main() {
  final customTheme = STheme().getLightTheme().copyWith(
    extensions: [
      SButtonThemeData.fromColors(const MyBrandColors()),
      SCardThemeData.fromColors(const MyBrandColors()),
      SCheckboxThemeData.fromColors(const MyBrandColors()),
      // ... register all component themes with your colors
    ],
  );

  runApp(MaterialApp(
    theme: customTheme,
    home: MyApp(),
  ));
}
```

### Available Component Themes

sDesign includes theme data classes for all components:

- **SButtonThemeData** - Button colors and styles 🎨
- **SCardThemeData** - Card appearance 🃏
- **SCheckboxThemeData** - Checkbox colors ✅
- **SDialogThemeData** - Dialog styling 💬
- **SDropdownMenuThemeData** - Dropdown menus ⬇️
- **SInputFieldThemeData** - Input fields 📝
- **SListTileThemeData** - List items 📋
- **SProgressBarThemeData** - Progress indicators ⏳
- **SSelectThemeData** - Selection components 🔘
- **SSonnerThemeData** - Toast notifications 📢
- **SSwitchThemeData** - Toggle switches 🔛
- **STabsThemeData** - Tab bars 📑
- **SToastThemeData** - Toast messages 🍞

### Dark Mode Support 🌙

All component themes automatically support dark mode:

```dart
MaterialApp(
  theme: STheme().getLightTheme(),
  darkTheme: STheme().getDarkTheme(),
  themeMode: ThemeMode.system,  // Automatically switches based on system
  home: MyApp(),
);
```

The theme system uses smooth color interpolation (`lerp` methods) for seamless transitions between light and dark modes.

### Typography

sDesign also includes a comprehensive typography system (`STypography`) that's automatically integrated into the theme. Access text styles via:

```dart
final typography = Theme.of(context).textTheme;
// Uses sDesign's typography system under the hood
```

## �🌟 Key Components in sDesign 🛠️

### SScaffold 🏗️

A robust wrapper around Flutter’s `Scaffold` with:

- **Pull-to-Refresh** 🔄: Supports standard or custom animations via `refreshConfig`.
- **Loading States** ⏳: Shimmer effects and custom indicators with `loadingConfig`.
- **Floating Action Buttons** 🛠️: Flexible FAB placement and animations.
- **Drawers & Footers** 📂🦶: Side drawers and persistent footers for seamless navigation.

### SButton 🎨

A versatile button widget with:

- **Variants**: `primary`, `secondary`, `outline`, `destructive`, `ghost`, `link`.
- **Sizes**: `sm`, `default`, `lg`, `icon`.
- **States**: `enabled`, `disabled`, `loading`.
- **Customizations**: Icons, custom dimensions, colors, and animations.

### SCheckbox ✅

A flexible checkbox supporting:

- **Two or Three States**: `checked`, `unchecked`, and optional `indeterminate`.
- **Customizations**: Size, active color, check color, border color, and disabled state.
- **Animations**: Smooth transitions for state changes.

### SSonner 📢

A toast notification system with:

- **Variants**: `success`, `info`, `error`, etc.
- **Customizations**: Position, duration, background color, and icons.
- **Queue Management**: Displays toasts sequentially with smooth animations.

## 🚀 Showcase 📸

<table>
  <tr>
    <td align="center">
      <img src="https://github.com/FRANK732/s_design/blob/development/assets/sample.gif" width="100px" height="100px">
      <br />
      Sample View 🌐
    </td>
    <td align="center">
      <img src="https://via.placeholder.com/100" width="100px" height="100px">
      <br />
      SButton 🎨
    </td>
    <td align="center">
      <img src="https://via.placeholder.com/100" width="100px" height="100px">
      <br />
      SCheckbox ✅
    </td>
    <td align="center">
      <img src="https://via.placeholder.com/100" width="100px" height="100px">
      <br />
      SSonner 📢
    </td>
  </tr>
</table>

## 🐛 Bugs & Feature Requests 🛠️

Found a bug or have a feature idea? Open an issue on [GitHub](https://github.com/FRANK732/s_design/issues). Pull requests are warmly welcomed! 🙌

### ❗ Note

New to Flutter? Dive into the [Flutter documentation](https://flutter.dev/docs) for a smooth start.

## ☀️ Authors 👨‍💻

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/FRANK732"><img src="https://avatars.githubusercontent.com/u/57005487?v=4" width="72" alt="FRANK732" /></a>
      <p align="center">
        <a href="https://github.com/FRANK732"><img src="https://www.iconninja.com/files/241/825/211/round-collaboration-social-github-code-circle-network-icon.svg" width="18" height="18"/></a>
      </p>
    </td>
  </tr>
</table>

## ⭐ License 📜

MIT License
