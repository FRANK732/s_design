# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
  - Offers improved performance and resource management when compared to traditional overlay solutions.

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
## Changes
- Changes with documentation

## [0.0.1+1] - 2025-01-08
## Changes
- Changes with documentation


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


