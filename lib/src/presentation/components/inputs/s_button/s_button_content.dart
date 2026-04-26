import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/constants/design_constants.dart';
import '../../../../domain/entities/config/button_config_entity.dart';
import '../../../themes/extensions/component_themes/s_button_theme.dart';
import 's_button_style_helper.dart';

/// Widget responsible for rendering the inner content of SButton.
class SButtonContent
    extends StatelessWidget {
  const SButtonContent({
    super.key,
    required this.theme,
    required this.variant,
    required this.size,
    required this.loading,
    this.loadingText,
    this.child,
    this.leadingIcon,
    this.trailingIcon,
    this.icon,
    this.badge,
    this.textStyle,
    this.animationDuration,
  });

  final SButtonThemeData
      theme;
  final SButtonVariant
      variant;
  final SButtonSize
      size;
  final bool
      loading;
  final String?
      loadingText;
  final Widget?
      child;
  final Widget?
      leadingIcon;
  final Widget?
      trailingIcon;
  final Widget?
      icon;
  final Widget?
      badge;
  final TextStyle?
      textStyle;
  final Duration?
      animationDuration;

  @override
  Widget build(
      BuildContext
          context) {
    final Widget
        content =
        _buildContent();

    if (loading) {
      return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: false,
            child: content,
          ),
          Positioned.fill(
            child: Align(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: _buildLoader(),
              ),
            ),
          ),
        ],
      );
    }
    return content;
  }

  /// Builds loading indicator
  Widget
      _buildLoader() {
    final Widget
        spinner =
        SpinKitThreeBounce(
      color:
          SButtonStyleHelper.getLoaderColor(theme: theme, variant: variant),
      size:
          SButtonStyleHelper.getLoaderSize(size),
      duration:
          animationDuration ?? const Duration(milliseconds: DesignConstants.animationDurationMs),
    );

    if (loadingText !=
        null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          spinner,
          const SizedBox(width: 8),
          Text(
            loadingText!,
            style: textStyle,
          ),
        ],
      );
    }

    return spinner;
  }

  /// Builds button content with icons and text
  Widget
      _buildContent() {
    final List<Widget>
        contentWidgets =
        <Widget>[];
    const SizedBox
        gap =
        SizedBox(width: 8);

    if (leadingIcon !=
        null) {
      contentWidgets.add(leadingIcon!);
      if (child !=
          null) {
        contentWidgets.add(gap);
      }
    } else if (icon !=
        null) {
      contentWidgets.add(icon!);
      if (child !=
          null) {
        contentWidgets.add(gap);
      }
    }

    // Label / Child
    if (child !=
        null) {
      if (textStyle != null &&
          child is Text) {
        contentWidgets.add(
          Text(
            (child! as Text).data ?? '',
            style: textStyle,
          ),
        );
      } else {
        contentWidgets.add(child!);
      }
    }

    // Trailing Icon
    if (trailingIcon !=
        null) {
      if (child != null ||
          leadingIcon != null ||
          icon != null) {
        contentWidgets.add(gap);
      }
      contentWidgets.add(trailingIcon!);
    }

    final Widget
        contentRow =
        Row(
      mainAxisSize:
          MainAxisSize.min,
      mainAxisAlignment:
          MainAxisAlignment.center,
      children:
          contentWidgets,
    );

    if (badge !=
        null) {
      return Badge(
        label: badge,
        child: contentRow,
      );
    }

    return contentRow;
  }
}
