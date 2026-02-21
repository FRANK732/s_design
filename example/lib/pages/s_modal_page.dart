import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class DialogPage
    extends StatefulWidget {
  const DialogPage(
      {super.key});

  @override
  State<DialogPage>
      createState() =>
          _DialogPageState();
}

class _DialogPageState
    extends State<
        DialogPage> {
  final TextEditingController
      _nameController =
      TextEditingController(text: 'Schrift');
  final TextEditingController
      _usernameController =
      TextEditingController(text: 'schrift');

  SDialogAnimationType
      _selectedAnimation =
      SDialogAnimationType.zoomIn;
  SDialogBackgroundEffect
      _selectedEffect =
      SDialogBackgroundEffect.none;

  @override
  void
      dispose() {
    _nameController
        .dispose();
    _usernameController
        .dispose();
    super
        .dispose();
  }

  @override
  Widget build(
      BuildContext
          context) {
    return SScaffold(
      appBar:
          AppBar(title: const Text('Dialog Showcase')),
      renderBody:
          (BuildContext context) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // ── Controls ──────────────────────────────────────────────────
              Text('Animation Type', style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: SDialogAnimationType.values
                    .map((SDialogAnimationType t) => ChoiceChip(
                          label: Text(t.name),
                          selected: _selectedAnimation == t,
                          onSelected: (_) => setState(() => _selectedAnimation = t),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 20),
              Text('Background Effect', style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: SDialogBackgroundEffect.values
                    .map((SDialogBackgroundEffect e) => ChoiceChip(
                          label: Text(e.name),
                          selected: _selectedEffect == e,
                          onSelected: (_) => setState(() => _selectedEffect = e),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 32),

              // ── Buttons ───────────────────────────────────────────────────
              SButton(
                onPressed: _showEditProfileDialog,
                child: const Text('Edit Profile Dialog'),
              ),
              const SizedBox(height: 12),
              SButton(
                variant: SButtonVariant.secondary,
                onPressed: _showConfirmDeleteDialog,
                child: const Text('Confirm Delete (with Icon)'),
              ),
              const SizedBox(height: 12),
              SButton(
                variant: SButtonVariant.outline,
                onPressed: _showScrollableDialog,
                child: const Text('Scrollable Content Dialog'),
              ),
            ],
          ),
        );
      },
    );
  }

  void
      _showEditProfileDialog() {
    SDialog.show<
        void>(
      context:
          context,
      title:
          'Edit profile',
      description:
          'Make changes to your profile here.',
      barrierColor:
          Colors.black54,
      showCloseButton:
          true,
      animationType:
          _selectedAnimation,
      backgroundEffect:
          _selectedEffect,
      content:
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Name'),
          const SizedBox(height: 6),
          SInputField(controller: _nameController),
          const SizedBox(height: 16),
          const Text('Nick Name'),
          const SizedBox(height: 6),
          SInputField(controller: _usernameController),
        ],
      ),
      actions: <Widget>[
        SButton(
          variant: SButtonVariant.outline,
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        SButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Save changes'),
        ),
      ],
    );
  }

  void
      _showConfirmDeleteDialog() {
    SDialog.show<
        bool>(
      context:
          context,
      iconWidget:
          Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.errorContainer,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.delete_outline, color: Theme.of(context).colorScheme.error),
      ),
      title:
          'Delete item',
      description:
          'Are you sure you want to delete this item? This action cannot be undone.',
      animationType:
          _selectedAnimation,
      backgroundEffect:
          _selectedEffect,
      barrierColor:
          Colors.black54,
      actionsAlignment:
          MainAxisAlignment.center,
      actions: <Widget>[
        SButton(
          variant: SButtonVariant.outline,
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        SButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Delete'),
        ),
      ],
    );
  }

  void
      _showScrollableDialog() {
    SDialog.show<
        void>(
      context:
          context,
      title:
          'Terms of Service',
      showCloseButton:
          true,
      scrollable:
          true,
      animationType:
          _selectedAnimation,
      backgroundEffect:
          _selectedEffect,
      maxHeight:
          400,
      content:
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List<Widget>.generate(
          12,
          (int i) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              'Section ${i + 1}: Lorem ipsum dolor sit amet, consectetur '
              'adipiscing elit. Sed do eiusmod tempor incididunt ut labore.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
      ),
      actions: <Widget>[
        SButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Accept'),
        ),
      ],
    );
  }
}
