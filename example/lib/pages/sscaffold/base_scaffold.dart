import 'dart:async';

import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

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
    const Duration oneSec = Duration(seconds: 1);
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
    return SScaffold(
      centerBody: true,
      enableRefresh: true,
      onRefresh: () async {
        setState(() => _isLoading = true);
        await Future<void>.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            setState(() => _isLoading = false);
          }
        });
      },
      loadingIndicator: SLoadingIndicator(
        loaderType: SLoaderType.shimmer,
        message: 'Loading will stop in $_start seconds',
      ),
      isLoading: _isLoading,
      appBar: AppBar(
        title: const Text('S Scaffold'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      renderBody: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: Text('This is the body of the page'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Swipe down to refresh',
              style: TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16),
            SButton(
              onPressed: () {
                setState(() => _isLoading = true);
                startTimer();
                Future<void>.delayed(const Duration(seconds: 5), () {
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
      renderFooter: (BuildContext context) {
        return const Center(child: Text('This is the footer'));
      },
    );
  }
}
