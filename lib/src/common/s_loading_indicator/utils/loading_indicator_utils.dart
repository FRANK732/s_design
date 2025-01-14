
import '../../../../s_design.dart';

/// Utility functions for [SLoadingIndicator].
class SLoadingIndicatorUtils {
  /// Validates if the provided [SLoaderType] is supported.
  static bool isSupportedLoaderType(SLoaderType type) {
    return type != SLoaderType.circle;
  }

  /// Formats the loading message based on context or other parameters.
  static String formatMessage(String message) {
    return message.trim().isEmpty ? "Loading..." : message;
  }
}
