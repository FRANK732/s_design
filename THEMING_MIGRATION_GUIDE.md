# sDesign Theming Migration Guide

## Overview

Version 2.0.0 introduces a **production-ready centralized theming system** for all sDesign components. This guide helps you migrate from the previous implementation to the new theming system.

## Breaking Changes

### Removed Static Theme Properties

The following static properties have been removed from component theme classes:

```dart
// ❌ REMOVED - These no longer exist:
SButtonThemeData.light
SButtonThemeData.dark
SCheckboxThemeData.light
SCheckboxThemeData.dark
SDialogThemeData.light
SDialogThemeData.dark
// ... and similar for other components
```

### New Pattern: Factory Constructor

All component themes now use a `fromColors()` factory constructor:

```dart
// ✅ NEW - Use this pattern:
final lightTheme = SButtonThemeData.fromColors(SLightColors());
final darkTheme = SButtonThemeData.fromColors(SDarkColors());
```

## Migration Steps

### Step 1: Update Theme Access

**Before:**

```dart
// Old way - directly accessing static properties
final buttonTheme = SButtonThemeData.light;
```

**After:**

```dart
// New way - access via Theme.of(context)
final buttonTheme = Theme.of(context).sButtonTheme;
```

### Step 2: Register Themes in MaterialApp

**Before:**

```dart
MaterialApp(
  theme: ThemeData(
    // Component themes were not centrally registered
  ),
  home: MyApp(),
);
```

**After:**

```dart
MaterialApp(
  theme: STheme().getLightTheme(),
  darkTheme: STheme().getDarkTheme(),
  themeMode: ThemeMode.system,
  home: MyApp(),
);
```

### Step 3: Update Custom Theme Creation

**Before:**

```dart
// Old way - hardcoded colors
final customButton = SButtonThemeData(
  defaultBackgroundColor: Colors.blue,
  defaultForegroundColor: Colors.white,
  // ... more properties
);
```

**After:**

```dart
// New way - use color scheme
class MyColors extends SColorsBase {
  @override
  Color get primary => Colors.blue;
  // ... implement all required colors
}

final customButton = SButtonThemeData.fromColors(MyColors());
```

### Step 4: Update Component Usage

Most components will continue to work without changes. However, if you were manually passing theme data:

**Before:**

```dart
SButton(
  // Manually specifying theme properties
  backgroundColor: SButtonThemeData.light.defaultBackgroundColor,
  child: Text('Button'),
)
```

**After:**

```dart
SButton(
  // Theme is automatically applied from Theme.of(context)
  child: Text('Button'),
)

// Or override specific properties:
SButton(
  backgroundColor: Theme.of(context).sButtonTheme.defaultBackgroundColor,
  child: Text('Button'),
)
```

## Benefits of the New System

### 1. Centralized Color Management

- Single source of truth for all colors
- No more hardcoded values scattered across components
- Easy to maintain and update

### 2. Type-Safe Theme Access

- Extension methods provide compile-time safety
- IntelliSense/autocomplete support
- Reduced runtime errors

### 3. Full Dark Mode Support

- Automatic color switching
- Smooth transitions via `lerp()` methods
- Consistent dark mode across all components

### 4. Easy Customization

- Override `SColorsBase` to theme the entire library
- Component-specific customization still supported
- Backward-compatible with Flutter's theming system

## Component-Specific Migration

### SInputField

**Before:**

```dart
final theme = SInputFieldTheme.defaults();
```

**After:**

```dart
final theme = Theme.of(context).sInputFieldTheme;
```

### All ThemeExtension-based Components

All component themes now properly extend `ThemeExtension<T>` and include:

- `copyWith()` method for partial updates
- `lerp()` method for smooth theme transitions
- `fromColors()` factory for easy instantiation

## Testing Your Migration

After migrating, verify:

1. ✅ All components render correctly in light mode
2. ✅ All components render correctly in dark mode
3. ✅ Theme switching works smoothly
4. ✅ Custom colors (if any) are applied correctly
5. ✅ No compilation errors or warnings

## Need Help?

If you encounter issues during migration:

1. Check the [example app](./example) for reference implementations
2. Review the [component theme documentation](./lib/src/components/)
3. Open an issue on [GitHub](https://github.com/FRANK732/s_design/issues)

## Full Example: Before and After

### Before (Old System)

```dart
import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class OldTheming extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SButton(
              backgroundColor: Colors.blue,  // Hardcoded
              child: Text('Button'),
            ),
            // Components didn't have centralized theming
          ],
        ),
      ),
    );
  }
}
```

### After (New System)

```dart
import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class NewTheming extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: STheme().getLightTheme(),
      darkTheme: STheme().getDarkTheme(),
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: Column(
          children: [
            SButton(
              // Theme automatically applied!
              child: Text('Button'),
            ),
            // All 13 components use consistent theming
          ],
        ),
      ),
    );
  }
}
```

---

**Migration Timeline:** Recommended to complete migration before next major version release.

**Questions?** Open a discussion on [GitHub Discussions](https://github.com/FRANK732/s_design/discussions).
