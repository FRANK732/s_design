import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 's_theme_data.dart';

/// Applies an SDesign theme to descendant widgets.
///
/// A [STheme] widget provides color, typography, and component specific
/// tokens that are used by SDesign widgets throughout your application.
class STheme
    extends StatelessWidget {
  /// Applies the given theme [data] to [child].
  const STheme(
      {required this.data,
      required this.child,
      super.key});

  /// Specifies the color and typography values for descendant widgets.
  final SThemeData
      data;

  /// The widget below this widget in the tree.
  final Widget
      child;

  /// Returns the [SThemeData] from the closest [STheme] ancestor.
  ///
  /// If there is no ancestor, this will throw an error. Use [maybeOf] if
  /// the theme might not exist.
  static SThemeData
      of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_STheme>()!
        .data;
  }

  /// Returns the [SThemeData] from the closest [STheme] ancestor,
  /// or null if there is no ancestor.
  static SThemeData?
      maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_STheme>()
        ?.data;
  }

  @override
  Widget build(
      BuildContext
          context) {
    return _STheme(
      data:
          data,
      child:
          DefaultTextStyle(
        style: data.typographyToken.bodyMedium,
        child: child,
      ),
    );
  }
}

class _STheme
    extends InheritedTheme {
  const _STheme(
      {required this.data,
      required super.child});

  final SThemeData
      data;

  @override
  bool updateShouldNotify(covariant _STheme oldWidget) =>
      oldWidget.data !=
      data;

  @override
  Widget wrap(
      BuildContext
          context,
      Widget
          child) {
    return _STheme(
        data: data,
        child: child);
  }
}

/// Animated version of [STheme] which automatically transitions the colors,
/// etc, over a given duration whenever the given theme changes.
class AnimatedSTheme
    extends ImplicitlyAnimatedWidget {
  /// Creates an animated theme.
  const AnimatedSTheme({
    required this.data,
    required this.child,
    super.key,
    super.curve,
    super.duration =
        const Duration(milliseconds: 200),
    super.onEnd,
  });

  /// Specifies the color and typography values for descendant widgets.
  final SThemeData
      data;

  /// The widget below this widget in the tree.
  final Widget
      child;

  @override
  AnimatedWidgetBaseState<AnimatedSTheme>
      createState() =>
          _AnimatedSThemeState();
}

class _AnimatedSThemeState
    extends AnimatedWidgetBaseState<
        AnimatedSTheme> {
  SThemeDataTween?
      _data;

  @override
  void forEachTween(
      TweenVisitor<dynamic>
          visitor) {
    _data =
        visitor(
      _data,
      widget.data,
      (dynamic value) =>
          SThemeDataTween(begin: value as SThemeData),
    )! as SThemeDataTween;
  }

  @override
  Widget build(
      BuildContext
          context) {
    return STheme(
        data: _data!.evaluate(animation),
        child: widget.child);
  }

  @override
  void debugFillProperties(
      DiagnosticPropertiesBuilder
          description) {
    super.debugFillProperties(
        description);
    description
        .add(
      DiagnosticsProperty<SThemeDataTween>(
        'data',
        _data,
        showName: false,
        defaultValue: null,
      ),
    );
  }
}
