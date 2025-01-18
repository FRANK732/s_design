import 'package:flutter/material.dart';
import 'package:s_design/src/theme/s_spacers.dart';
import 'package:s_design/src/theme/theme_extension.dart';
import '../../../s_design.dart';

class SDialogContent extends StatefulWidget {
  final SDialog dialog;
  final SDialogController controller;

  const SDialogContent({
    Key? key,
    required this.dialog,
    required this.controller,
  }) : super(key: key);

  @override
  State<SDialogContent> createState() => _SDialogContentState();
}

class _SDialogContentState extends State<SDialogContent> {
  final FocusScopeNode _focusScopeNode = FocusScopeNode();

  ShapeDecoration mergeDecorations(
      ShapeDecoration base,
      ShapeDecoration? override,
      ) {
    if (override == null) {
      return base;
    }

    return ShapeDecoration(
      color: override.color ?? base.color,
      shape: override.shape,
      shadows: override.shadows ?? base.shadows,
      image:override.image,
      gradient: override.gradient,
    );
  }


  @override
  void dispose() {
    _focusScopeNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dialog = widget.dialog;

    final ShapeDecoration defaultDecoration = ShapeDecoration(
      color: context.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: Spacers.radiusMedium,
      ),
      shadows: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10.0,
          offset: Offset(0, 10),
        ),
      ],
    );

    final ShapeDecoration effectiveDecoration = mergeDecorations(
      defaultDecoration,
      dialog.shapeDecoration,
    );

    return Center(
      child: Material(
        color: Colors.transparent,
        child: FocusScope(
          node: _focusScopeNode,
          child: Semantics(
            label: dialog.semanticLabel ?? dialog.title,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.9 > 600
                    ? 600
                    : MediaQuery.of(context).size.width * 0.9,
                maxHeight: MediaQuery.of(context).size.height * 0.9,
              ),
              child: Container(
                padding: dialog.contentPadding ?? const EdgeInsets.all(15.0),
                decoration: effectiveDecoration,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (dialog.title != null || true)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (dialog.title != null)
                              Expanded(
                                child: Text(
                                  dialog.title!,
                                  style: context.textThemeStyles.titleMedium,
                                ),
                              ),
                            IconButton(
                              icon: const Icon(Icons.close, size: 20),
                              onPressed: () => widget.controller.close(context),
                            ),
                          ],
                        ),

                      if (dialog.description != null && dialog.description!.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Text(
                          dialog.description!,
                          style: context.textThemeStyles.bodySmall,
                          textAlign: TextAlign.left,
                        ),
                      ],

                      if (dialog.content != null) ...[
                        const SizedBox(height: 16),
                        dialog.content!,
                      ],

                      if (dialog.actions != null && dialog.actions!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: dialog.actions!,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
