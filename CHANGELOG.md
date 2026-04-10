# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2026-02-23

### Major Architecture Upgrade & Redesign

- **Massive redesign** of the underlying theme engine (`STheme` and `SThemeData`). Components now strictly adhere to a highly customizable design token system.
- **Core Component Refactor**: Sweeping enhancements across `SCard`, `SButton`, `SInputField`, `SDatePicker`, `SCheckbox`, `SSlider`, `SSwitch` and many more. Components are now richer, support complex nested layouts, variants, and fluid animations natively out-of-the-box.
- **Flawless Dark Mode Support**: The entire library now natively syncs with `SThemeData` for automatic, beautiful transitions between light and dark modes.
- **Component Consolidation**: `SProgressBar` has been deprecated and its features (indeterminate states, custom buffering, and vertical orientation) have been completely merged into the single, versatile `SProgress.line()` component.

## [0.3.2+1] - 2025-06-05

### Minor error fixes

## [0.3.2] - 2025-05-28

### `SButton` and `SCard` components with additional properties and improve `SInputField.search` to support clear action

## [0.3.1] - 2025-05-23

### Minor error fixes

## [0.3.0] - 2025-05-14

### Refactor

- Known Bug fixes
- Renamed `TListTile` to `SListTile` and updated theme data references for improved consistency.
- Refactored `base_scaffold` to use `final` for `isDark` variable, improving code reliability.
- Converted `SCard` component to a `StatefulWidget`, adding new properties and dismissible features for enhanced interactivity.
- Removed `flutter_svg` dependency from `pubspec.yaml`, reducing package size and complexity.

### Features

- Added shimmer loading effect to `SScaffold` with updated loading indicator, integrating the shimmer package for a polished UI experience.
- Enhanced `SInputField` with new properties: `scrollPadding`, `scrollPhysics`, `autofillHints`, `mouseCursor`, `contextMenuBuilder`, `restorationId`, and `enableIMEPersonalizedLearning` for improved functionality and user experience.
- Updated `SDropdownMenu` with new customization properties, improved styles, behavior, and added searchable functionality with better item selection display.
- Added `hasActions` property to `SDialog`, enhancing dialog functionality with action handling.
- Enhanced `SScaffold` with pull-to-refresh functionality, new properties, and improved loading state management for a more responsive UI.
- Updated dropdown menu and dialog enums to support new features and improve consistency.

### Notes

- Known Bug fixes
- This release also introduces significant improvements to core components, focusing on usability, customization, and performance. The removal of `flutter_svg` dependency reduces package size, and new features like shimmer effects and pull-to-refresh enhance the user experience.

## [0.2.1] - 2025-02-08

### Changed

#### New Feature

    - Added shimmer loading effect to `SScaffold`, updated loading indicator, and integrated shimmer package.
    - Enhanced `SInputField` with additional properties for improved functionality: `scrollPadding`, `scrollPhysics`, `autofillHints`, `mouseCursor`, `contextMenuBuilder`, `restorationId`, and `enableIMEPersonalizedLearning`.

## [0.2.0] - 2025-01-19

### Added

- **SScaffold**: A custom scaffold widget designed to simplify layout, loading states, and optional scrollable content in a single, reusable component.
  - Integrates a `ChangeNotifier` (`LoadingProvider`) to handle a loading overlay (e.g., an activity indicator) without needing extra boilerplate.
- **STabs**: Customizable tabs.
  - Allows displaying multiple views under different tab labels, with optional animations and orientation options.
- **SSwitch**: Customizable switches.
  - Provides an animated toggle (on/off) behavior with configurable sizes, colors, and variants.
  - Supports both determinate (two states) and indeterminate (three states) checks.

### Changed

#### New Features

    - `STriggerBuilder` for `SDropdownMenu` to build custom trigger widget.

#### Other Components

    - Minor styling and performance tweaks across various UI components (e.g., `SCard`, `SCheckBox`).
    - Introduced improved theming logic for more consistent dark and light mode support.

### Fixed

- Resolved major inconsistencies in `SDropdownMenu`.

### Removed

- `SModals` now removed and replaced with `SDialog`.

## [0.1.0] - 2025-01-11

### Added

- **SToast**: A lightweight and customizable toast notification widget for quick status updates.
  - Supports multiple toast types (success, error, info, warning).
  - Configurable display duration and animation transitions.
- **SSonner**: A customizable snackbar-style notification widget for more persistent feedback.
  - Offers optional action buttons and adjustable timeouts.
  - Works seamlessly with `sOverlayBuilder` for flexible placement.
- **sOverlayBuilder**: A builder utility to easily overlay widgets (like notifications, dialogs, or banners) on top of existing UI layers.
  - Provides a clean API to manage multiple overlays without manual stack manipulation.
  - Offers improved performance and resource management compared to traditional overlay solutions.

### Changed

- **SInputField**:
  - **Major Refactor**: Improved internal architecture for better performance and maintainability.
    - Decreased rebuild overhead and memory footprint.
    - Streamlined validation and error-handling callbacks.
  - **New Features**:
    - Auto-complete support and built-in suggestions.
    - Enhanced styling options including custom borders, hint styles, and prefix/suffix icons.
    - Expanded keyboard configuration for domain-specific use cases (e.g., numbers, emails, or passwords).
- **Other Components**:
  - Minor styling and performance tweaks across various UI components (e.g., `SButton`, `SCard`).
  - Introduced improved theming logic for more consistent dark and light mode support.

### Fixed

- Resolved minor theming inconsistencies in `SDropdownMenu` and `SCheckBox` under certain device font scaling settings.

### Removed

- No breaking component removals. All existing components remain available and compatible.

## [0.0.1+2] - 2025-01-09

### Changed

- Updates to documentation.

## [0.0.1+1] - 2025-01-08

### Changed

- Updates to documentation.

## [0.0.1] - 2025-01-08

### Added

- Initial release of the sDesign package.
- Core UI components:
  - `SButton`: A versatile button widget with customizable styles and variants.
  - `SModal`: A customizable modal widget with predefined types (success, error, warning, info).
  - `SCard`: A simple and customizable card component.
  - `SCheckBox`: A checkbox widget with multiple states.
  - `SDropdownMenu`: A dropdown menu widget with theming support.
  - `SInputField`: A text input widget with various configurations.
  - `SProgressBar`: A progress indicator widget.
- Theming and utility functions for all components.
- Example application demonstrating usage of all components.

---

This marks the beginning of the sDesign package on pub.dev.
