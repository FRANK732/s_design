# ✨ sDesign

[![Pub Package](https://img.shields.io/pub/v/s_design.svg)](https://pub.dev/packages/s_design) [![GitHub issues](https://img.shields.io/github/issues/FRANK732/s_design)](https://github.com/FRANK732/s_design/issues) [![GitHub forks](https://img.shields.io/github/forks/FRANK732/s_design)](https://github.com/FRANK732/s_design/network) [![GitHub stars](https://img.shields.io/github/stars/FRANK732/s_design)](https://github.com/FRANK732/s_design/stargazers)

A comprehensive Flutter UI component library offering customizable widgets to build consistent and professional user interfaces.

## 🎖 Installing

```yaml
dependencies:
  s_design: ^0.1.0
```

### ⚡️ Import

```dart
import 'package:s_design/s_design.dart';
```

## 🎮 How To Use

Here are some examples to get started:

### Example: Using `SButton`

```dart
import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('sDesign Example'),
        ),
        body: Center(
          child: SButton(
            onPressed: () {
              print('Button Pressed');
            },
            label: 'Click Me',
            variant: SButtonVariant.primary,
          ),
        ),
      ),
    );
  }
}
```
### Example: Using Sonner and Toaster
```dart
import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myOverlays = [
      OverlayEntry(
        builder: (overlayContext) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final overlay = Overlay.of(overlayContext);

            SSonner.instance.initialize(overlay);

            /// You can initialize other instance here as well
            SToast.initialize(overlay);
          });
          return const SizedBox.shrink();
        },
      ),
      // You could add more overlay entries here, if needed:
      // OverlayEntry(builder: ...),
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('sDesign Example'),
        ),
      builder: sOverlayBuilder(overlays: myOverlays),
        home:  body: Center(
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
            ],
          ),
        ),
      ),

      ),
    );
  }
}
```


### Example: Displaying a Success Modal

```dart
SModal.showSuccess(
  context,
  message: 'Operation completed successfully!',
  actions: [
    SButton(
      onPressed: () => Navigator.pop(context),
      label: 'OK',
      variant: SButtonVariant.primary,
    ),
  ],
);
```

For more usage examples, refer to the `example` folder in the repository.

## 🚀 Showcase

<table>
  <tr>
    <td align="center">
      <img src="https://via.placeholder.com/100" width="100px" height="100px">
      <br />
      SButton
    </td>
    <td align="center">
      <img src="https://via.placeholder.com/100" width="100px" height="100px">
      <br />
      SModal
    </td>
    <td align="center">
      <img src="https://via.placeholder.com/100" width="100px" height="100px">
      <br />
      SCard
    </td>
  </tr>
</table>

## 🐛 Bugs/Requests

If you encounter any problems, feel free to open an issue. If you think a feature is missing, please raise a ticket on GitHub, and we'll look into it. Pull requests are also welcome.

### ❗️ Note

For help getting started with Flutter, check the [Flutter documentation](https://flutter.dev/docs).

## ☀️ Authors

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/FRANK732"><img src="https://avatars.githubusercontent.com/u/57005487?v=4" width="72" alt="FRANK732" /></a>
      <p align="center">
        <a href="https://github.com/FRANK732"><img src="https://www.iconninja.com/files/241/825/211/round-collaboration-social-github-code-circle-network-icon.svg" width="18" height="18"/></a>
      </p>
    </td>
  </tr>
</table>

## ⭐️ License

MIT License
