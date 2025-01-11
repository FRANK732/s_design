import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class ToastPage extends StatelessWidget {
  const ToastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toast Showcase'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SButton(
                onPressed: () {
                  // Show a Default Toast
                  SToast.show(
                    title: 'Default!',
                    description: 'This is a default toast.',
                  );
                },
                child: const Text('Show Default Toast'),
              ),
              const SizedBox(
                height: 10,
              ),
              SButton(
                backgroundColor: const Color.fromARGB(240, 223, 64, 64),
                onPressed: () {
                  // Show a Destructive Toast
                  SToast.show(
                    title: 'Destructive!',
                    description: 'This is a destructive toast.',
                    variant: SToastVariant.destructive,
                  );
                },
                child: const Text('Show Destruction Toast'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
