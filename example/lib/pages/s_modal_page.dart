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

  @override
  Widget build(
      BuildContext
          context) {
    return SScaffold(
      appBar:
          AppBar(
        title: const Text('Dialog Showcase'),
      ),
      renderBody:
          (BuildContext context) {
        return Center(
          child: SButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (context) => SDialog.fromConfig(
                  SDialogConfig(
                    title: 'Edit profile',
                    description: 'Make changes to your profile here',
                    semanticLabel: 'Edit',
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Name Field
                        const Text(
                          'Name',
                        ),
                        const SizedBox(height: 6),
                        SInputField(
                          controller: _nameController,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Nick Name',
                        ),
                        const SizedBox(height: 6),
                        SInputField(
                          controller: _usernameController,
                        ),
                      ],
                    ),
                    // Action buttons at bottom-right
                    actions: <Widget>[
                      SButton(
                        variant: SButtonVariant.secondary,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Save changes'),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: const Text('Show Dialog'),
          ),
        );
      },
    );
  }
}
