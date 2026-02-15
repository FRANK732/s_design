import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class SProgressDemoPage
    extends StatefulWidget {
  const SProgressDemoPage(
      {super.key});

  @override
  State<SProgressDemoPage>
      createState() =>
          _SProgressDemoPageState();
}

class _SProgressDemoPageState
    extends State<
        SProgressDemoPage> {
  double
      _percent =
      30;

  void
      _increase() {
    setState(
        () {
      _percent =
          (_percent + 10).clamp(0, 100);
    });
  }

  void
      _decrease() {
    setState(
        () {
      _percent =
          (_percent - 10).clamp(0, 100);
    });
  }

  @override
  Widget build(
      BuildContext
          context) {
    return SScaffold(
      appBar:
          AppBar(title: const Text('SProgress Demo')),
      renderBody:
          (context) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildControlButtons(),
              const SizedBox(height: 32),
              const Text('Line Progress', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 16),
              const SProgress.line(percent: 30),
              const SizedBox(height: 8),
              const SProgress.line(percent: 50, status: SProgressStatus.active),
              const SizedBox(height: 8),
              const SProgress.line(percent: 70, status: SProgressStatus.exception),
              const SizedBox(height: 8),
              const SProgress.line(percent: 100),
              const SizedBox(height: 8),
              const SProgress.line(percent: 50, showInfo: false),
              const SizedBox(height: 16),
              const Text('Gradient Line', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const SProgress.line(
                percent: 90,
                strokeGradient: LinearGradient(colors: [
                  Colors.blue,
                  Colors.purple
                ]),
              ),
              const SizedBox(height: 32),
              const Text('Small Line', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const SProgress.line(percent: 50, strokeWidth: 4),
              const SizedBox(height: 32),
              const Text('Steps Line', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const SProgress.line(percent: 50, steps: 5, strokeWidth: 5),
              const SizedBox(height: 32),
              const Text('Circle Progress', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SProgress.circle(percent: _percent),
                  SProgress.circle(percent: _percent, status: SProgressStatus.exception),
                  SProgress.circle(percent: 100),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SProgress.circle(
                    percent: 75,
                    strokeGradient: SweepGradient(colors: [
                      Colors.cyan,
                      Colors.blueAccent
                    ]),
                  ),
                  const SProgress.circle(percent: 75, width: 80, strokeWidth: 4), // Mini
                ],
              ),
              const SizedBox(height: 32),
              const Text('Dashboard Progress', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SProgress.dashboard(percent: _percent),
                  SProgress.dashboard(percent: _percent, gapDegree: 120), // Wide gap
                  const SProgress.dashboard(
                      percent: 70,
                      gapPosition: SProgressGapPosition.left, // Left gap
                      status: SProgressStatus.success),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget
      _buildControlButtons() {
    return Row(
      children: [
        SButton(onPressed: _decrease, child: const Icon(Icons.remove)),
        const SizedBox(width: 16),
        SButton(onPressed: _increase, child: const Icon(Icons.add)),
        const SizedBox(width: 16),
        Text('Percent: $_percent%'),
      ],
    );
  }
}
