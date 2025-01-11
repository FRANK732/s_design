import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class SonnerPage extends StatefulWidget {
  const SonnerPage({super.key});

  @override
  State<SonnerPage> createState() => _SonnerPageState();
}

class _SonnerPageState extends State<SonnerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sonner Showcase"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Success Sonner Button
              SButton(
                onPressed: () {
                  // Show a success Sonner
                  SSonner.instance.show(
                    message: 'The operation was successful!',
                    type: SSonnerType.success,
                  );
                },
                child: const Text('Show Success Sonner'),
              ),
              const SizedBox(height: 20),
              // Error Sonner Button
              SButton(
                backgroundColor: const Color.fromARGB(213, 189, 27, 22),
                onPressed: () {
                  // Show an error Sonner
                  SSonner.instance.show(
                    message: 'An error has occurred. Please try again.',
                    type: SSonnerType.error,
                  );
                },
                child: const Text('Show Error Sonner'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
