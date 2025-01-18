import 'package:flutter/material.dart';

import '../../../../s_design.dart';
import '../s_dialog_content.dart';

class SDialogController extends ChangeNotifier {
  bool _isOpen = false;
  bool get isOpen => _isOpen;

  /// Shows the dialog described by [dialog].
  Future<void> show(
      BuildContext context, {
        required SDialog dialog,
      }) async {
    if (_isOpen) return;

    _isOpen = true;
    notifyListeners();

    await showGeneralDialog(
      context: context,
      barrierDismissible: dialog.barrierDismissible,
      barrierLabel: dialog.semanticLabel ?? 'Dialog',
      barrierColor: dialog.barrierColor,
      transitionDuration: dialog.transitionDuration,
      pageBuilder: (ctx, animation, secondaryAnimation) {
        return SDialogContent(
          dialog: dialog,
          controller: this,
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final fadeAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );
        final scaleAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOutBack,
        );

        return FadeTransition(
          opacity: fadeAnimation,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: child,
          ),
        );
      },
    ).then((_) {
      _isOpen = false;
      notifyListeners();
    });
  }

  /// Closes the currently open dialog (if any).
  void close(BuildContext context) {
    if (_isOpen) {
      Navigator.of(context).pop();
    }
  }
}
