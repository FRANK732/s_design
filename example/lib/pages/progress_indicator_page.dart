import 'dart:async';

import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class ProgressIndicatorPage extends StatefulWidget {
  const ProgressIndicatorPage({super.key});

  @override
  State<ProgressIndicatorPage> createState() => _ProgressIndicatorPageState();
}

class _ProgressIndicatorPageState extends State<ProgressIndicatorPage> {
  double _progressValue = 0.0;
  Timer? _timer;
  bool _disable = false;

  void _startProgress() {
    _disable = true;
    const duration = Duration(seconds: 1);
    _timer = Timer.periodic(duration, (Timer timer) {
      if (_progressValue == 100.0) {
        SSonner.instance.show(
            message: 'Progress Completed', variant: SSonnerVariant.success,);
        setState(() {
          _disable = false;
          timer.cancel();
        });
      } else {
        setState(() {
          _progressValue += 10.0;
        });
      }
    });
  }

  void _updateProgress() {
    if (_progressValue == 100) {
      setState(() {
        _progressValue = 0.0;
      });
    } else {
      _startProgress();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SScaffold(
      centerBody: true,
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      renderBody: (context) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              const Center(
                child: Text('This is the body of the page'),
              ),
              const SizedBox(height: 16),
              SProgressBar(
                animationCurve: Curves.bounceInOut,
                value: _progressValue,
                height: 10,
              ),
              const SizedBox(height: 16),
              SButton(
                size: SButtonSize.sm,
                variant: _progressValue != 100
                    ? SButtonVariant.defaultVariant
                    : SButtonVariant.destructiveOutline,
                state: _disable ? SButtonState.disabled : null,
                onPressed: () {
                  _updateProgress();
                },
                child: Text(
                    _progressValue != 100 ? 'Run Progress' : 'Reset Progress',),
              ),
            ],
          ),
        );
      },

    );
  }
}
