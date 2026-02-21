import 'package:flutter/material.dart';
import '../../../../../s_design.dart';

/// Configuration for an individual [SSonner] toast.
class SSonnerConfig {
  /// Creates an instance of [SSonnerConfig].
  const SSonnerConfig({
    required this.message,
    this.id,
    this.title,
    this.variant =
        SSonnerVariant.info,
    this.duration =
        const Duration(seconds: 4),
    this.position =
        SSonnerPosition.bottom,
    this.action,
    this.showCloseButton =
        false,
    this.onTap,
    this.onDismiss,
    this.icon,
    this.leading,
    this.trailing,
    this.accentColor,
    this.backgroundColor,
    this.textColor,
  });

  /// The main message of the toast.
  final String
      message;

  /// Unique identifier for the toast.
  final String?
      id;

  /// Optional title for the toast.
  final String?
      title;

  /// The variant of the toast (info, success, error, warning).
  final SSonnerVariant
      variant;

  /// Duration to show the toast.
  final Duration
      duration;

  /// Position of the toast on screen.
  final SSonnerPosition
      position;

  /// Optional action button widget.
  final Widget?
      action;

  /// Whether to show a close button.
  final bool
      showCloseButton;

  /// Callback when the toast is tapped.
  final VoidCallback?
      onTap;

  /// Callback when the toast is dismissed.
  final VoidCallback?
      onDismiss;

  /// Custom icon to override the variant default.
  final IconData?
      icon;

  /// Custom widget to display before the content.
  final Widget?
      leading;

  /// Custom widget to display after the content.
  final Widget?
      trailing;

  /// Overrides the left accent stripe colour and icon colour for this toast.
  /// Defaults to the variant colour from [SSonnerThemeData].
  final Color?
      accentColor;

  /// Overrides the toast surface background colour for this toast.
  final Color?
      backgroundColor;

  /// Overrides the text colour for this toast.
  final Color?
      textColor;

  /// Creates a copy of this config with the given fields replaced with the new values.
  SSonnerConfig
      copyWith({
    String?
        message,
    String?
        id,
    String?
        title,
    SSonnerVariant?
        variant,
    Duration?
        duration,
    SSonnerPosition?
        position,
    Widget?
        action,
    bool?
        showCloseButton,
    VoidCallback?
        onTap,
    VoidCallback?
        onDismiss,
    IconData?
        icon,
    Widget?
        leading,
    Widget?
        trailing,
    Color?
        accentColor,
    Color?
        backgroundColor,
    Color?
        textColor,
  }) {
    return SSonnerConfig(
      message:
          message ?? this.message,
      id: id ??
          this.id,
      title:
          title ?? this.title,
      variant:
          variant ?? this.variant,
      duration:
          duration ?? this.duration,
      position:
          position ?? this.position,
      action:
          action ?? this.action,
      showCloseButton:
          showCloseButton ?? this.showCloseButton,
      onTap:
          onTap ?? this.onTap,
      onDismiss:
          onDismiss ?? this.onDismiss,
      icon:
          icon ?? this.icon,
      leading:
          leading ?? this.leading,
      trailing:
          trailing ?? this.trailing,
      accentColor:
          accentColor ?? this.accentColor,
      backgroundColor:
          backgroundColor ?? this.backgroundColor,
      textColor:
          textColor ?? this.textColor,
    );
  }
}
