import 'package:flutter/material.dart';
import '../enums/modal_animation_type.dart';

/// Utility functions for [SModal].
class SModalUtils {
  /// Returns the appropriate transition based on [animationType].
  static Widget getTransition(
      SModalAnimationType animationType,
      Widget child,
      Animation<double> animation,
      ) {
    switch (animationType) {
      case SModalAnimationType.fade:
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
          child: child,
        );
      case SModalAnimationType.scale:
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
          child: child,
        );
      case SModalAnimationType.slideFromBottom:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
          ),
          child: child,
        );
      case SModalAnimationType.slideFromTop:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
          ),
          child: child,
        );
      case SModalAnimationType.slideFromLeft:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
          ),
          child: child,
        );
      case SModalAnimationType.slideFromRight:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
          ),
          child: child,
        );
      case SModalAnimationType.custom:
      // Implement custom animation if needed
        return child;
      default:
        return child;
    }
  }
}
