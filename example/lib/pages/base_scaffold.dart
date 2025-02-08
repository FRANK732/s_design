import 'dart:async';

import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import 'package:shimmer/shimmer.dart';

class BaseScaffoldPage extends StatefulWidget {
  const BaseScaffoldPage({super.key});

  @override
  State<BaseScaffoldPage> createState() => _BaseScaffoldPageState();
}

class _BaseScaffoldPageState extends State<BaseScaffoldPage> {
  bool _isLoading = false;
  Timer? _timer;
  int _start = 5;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            _start = 5;
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return SScaffold(
      bodyShimmer: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Shimmer.fromColors(
          baseColor: isDark ? Colors.grey[850]! : Colors.grey[300]!,
          highlightColor: isDark ? Colors.grey[800]! : Colors.grey[100]!,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (_, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ),
      loadingIndicator: SLoadingIndicator(
        loaderType: SLoaderType.shimmer,
        message: 'Loading will stop in $_start seconds',
      ),
      isLoading: _isLoading,
      appBar: AppBar(
        title: const Text('S Scaffold'),
      ),
      renderBody: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('This is the body of the page'),
            ),
            const SizedBox(height: 16),
            SButton(
              onPressed: () {
                setState(() => _isLoading = true);
                startTimer();
                Future.delayed(const Duration(seconds: 5), () {
                  if (mounted) {
                    setState(() => _isLoading = false);
                  }
                });
              },
              child: const Text('Press me'),
            ),
          ],
        );
      },
      renderFooter: (context) {
        return const Center(child: Text('This is the footer'));
      },
    );
  }
}
