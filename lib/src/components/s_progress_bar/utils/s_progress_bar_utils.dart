
/// Utility functions for [SProgressBar].
class SProgressBarUtils {
  /// Example utility: Converts value to percentage.
  static double valueToPercentage(double value, double max) {
    return (value / max).clamp(0.0, 1.0);
  }
}
