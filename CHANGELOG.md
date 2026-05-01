# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2026-04-30

We are thrilled to announce **sDesign v2.0.0** — an absolute game-changer. This release marks sDesign’s graduation into a fully mature enterprise framework. We tore down the old architecture and completely rebuilt the core engine to be faster, sleeker, and infinitely more customizable. Say goodbye to bloated configurations and hello to pure, animated flow. Welcome to the new standard for Flutter UI. 🚀

### 🔥 Enter the New Ecosystem

V2 brings an arsenal of highly anticipated, meticulously crafted components designed to handle robust enterprise use cases natively out-of-the-box.

- **`SSonner` Toast System**: A gorgeous, physics-based, stackable notification ecosystem. Ditch the boring snackbars forever.
- **`SToolTip`**: A highly versatile and interactive tooltip widget.
- **`SFloatingPanel`**: A highly versatile and interactive draggable bottom-sheet overlay panel, perfect for complex contextual workflows.
- **`SSelect` & `SDropdown` V2**: Completely rewritten from the ground up for adaptive UI workflows, supporting single/multi-selection modes, fuzzy search, and integrated tags.
- **`SDatePicker` & `STimePicker`**: Natively localized, flawlessly themed, responsive date and time capture experiences.
- **`SPagination`**: A powerhouse pagination widget featuring full parity and deep customizability.
- **Layout Mastery**: The new `SScaffold` replaces basic layouts with integrated pull-to-refresh and loading states. `STabs` now provides mobile-first, sticky header views, while `SSteps` makes managing complex sequences an absolute breeze.
- **Rich Display & Feedback**: Introduced comprehensive data visualization via the new `SAvatar` (with intelligent group scaling), `SRate` (star ratings,customizable characters and tooltips), `SProgress` dashboards, `SQRCode`, and `SAlert`. `SAppState` A fully theme-aware, animated application state display widget for communicating empty, error, and maintenance states to users through rich custom illustrations

### ⚡ Massive Enterprise Architecture Rebuild

We didn't just add new paint; we upgraded the engine. v2.0.0 brings monumental leaps in performance and maintainability.

- **The `SThemeData` Revolution**: We've eradicated the legacy `SColorsBase` system. Welcome to a strict, highly customizable design token ecosystem running purely on `ColorScheme`. Theming your entire app just became frictionless.
- **Clean Architecture Migration**: Over the course of 4 sweeping architectural waves, we decoupled, modernized, and drastically reduced the memory footprint across every main component (including `SButton`, `SSelect`, `SScaffold`, `STabs`, `SDropdown`, `SListTile`, `SCard`, `SSwitch`, `SCheckbox` and `SInput`).
- **Ruthless Consolidation**: We dropped the dead weight. `SProgressBar` and `SModals` were stripped out and gracefully merged into the far superior `SProgress` and `SDialog` ecosystems respectively.
- **Flawless Dark Mode Sync**: Your entire UI now effortlessly syncs with `SThemeData` for automatic, visually stunning transitions between light and dark modes instantly.

### 🛠️ Unleashing the New Developer Experience

Your tooling matters. V2 ships with the absolute best-in-class developer and showcase infrastructure.

- **The Modern Gallery Shell**: We launched a brand-new, ultra-smooth interactable Example Application powered by responsive sidebar/drawer navigation and persistent theming.

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
