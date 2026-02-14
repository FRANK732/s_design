import '../../entities/config/button_config_entity.dart';

/// Use case for validating button configuration.
///
/// This encapsulates the business logic for ensuring button configurations
/// are valid and follow design system rules.
class ValidateButtonConfig {
  /// Validates a button configuration entity.
  ///
  /// Returns a [ValidationResult] indicating whether the config is valid
  /// and any validation messages.
  ValidationResult
      validate(ButtonConfigEntity config) {
    final List<String>
        errors =
        <String>[];
    final List<String>
        warnings =
        <String>[];

    // Validate dimensions
    if (config.height != null &&
        config.height! < 0) {
      errors.add('Button height cannot be negative');
    }

    if (config.width != null &&
        config.width! < 0) {
      errors.add('Button width cannot be negative');
    }

    // Validate elevation
    if (config.elevation != null &&
        config.elevation! < 0) {
      errors.add('Button elevation cannot be negative');
    }

    // Validate border radius
    if (config.borderRadius != null &&
        config.borderRadius! < 0) {
      errors.add('Border radius cannot be negative');
    }

    // Validate padding
    if (config.padding !=
        null) {
      if (config.padding!.left < 0 ||
          config.padding!.top < 0 ||
          config.padding!.right < 0 ||
          config.padding!.bottom < 0) {
        errors.add('Padding values cannot be negative');
      }
    }

    // Validate color if present
    if (config.shadowColor !=
        null) {
      final ColorConfig color =
          config.shadowColor!;
      if (color.red < 0 ||
          color.red > 255 ||
          color.green < 0 ||
          color.green > 255 ||
          color.blue < 0 ||
          color.blue > 255 ||
          color.alpha < 0 ||
          color.alpha > 255) {
        errors.add('Color values must be between 0 and 255');
      }
    }

    // Warnings for design consistency
    if (config.variant == ButtonVariant.destructive &&
        config.size == ButtonSize.icon) {
      warnings.add('Icon-sized destructive buttons may be too small for user safety');
    }

    if (config.isLoading &&
        config.state == ButtonState.disabled) {
      warnings.add('Loading state may conflict with disabled state');
    }

    return ValidationResult(
      isValid:
          errors.isEmpty,
      errors:
          errors,
      warnings:
          warnings,
    );
  }
}

/// Result of validation operation
class ValidationResult {
  const ValidationResult({
    required this.isValid,
    required this.errors,
    required this.warnings,
  });

  final bool
      isValid;
  final List<String>
      errors;
  final List<String>
      warnings;

  bool get hasWarnings =>
      warnings.isNotEmpty;

  @override
  String
      toString() {
    final StringBuffer buffer =
        StringBuffer();
    buffer
        .writeln('Valid: $isValid');

    if (errors
        .isNotEmpty) {
      buffer.writeln('Errors:');
      for (final String error
          in errors) {
        buffer.writeln('  - $error');
      }
    }

    if (warnings
        .isNotEmpty) {
      buffer.writeln('Warnings:');
      for (final String warning
          in warnings) {
        buffer.writeln('  - $warning');
      }
    }

    return buffer
        .toString();
  }
}
