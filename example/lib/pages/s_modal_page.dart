import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  final SDialogController _dialogController = SDialogController();
  final TextEditingController _nameController =
  TextEditingController(text: 'Schrift');
  final TextEditingController _usernameController =
  TextEditingController(text: 'schrift');


  @override
  Widget build(BuildContext context) {
    return SScaffold(
      appBar: AppBar(
        title: const Text('Dialog Showcase'),
      ),
      renderBody:((context){

        return Center(
          child: SButton(
            onPressed: () {
              _dialogController.show(
                context,
                dialog:SDialog(
                  title: 'Edit profile',
                  description:
                  'Make changes to your profile here',
                  semanticLabel: 'Edit',
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                  actions: [
                    SButton(
                      variant: SButtonVariant.secondary,
                      onPressed: () {
                        _dialogController.close(context);
                      },
                      child: const Text('Save changes'),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Show Dialog'),
          ),
        );
      }),
    );
  }
}
