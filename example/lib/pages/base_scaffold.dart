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
    return SScaffold(
      loadingIndicator: SLoadingIndicator(
        loaderType: SLoaderType.shimmer,
        message: 'Loading will stop in $_start seconds',
      ),
      isLoading: _isLoading,
      appBar: AppBar(
        title: const Text('S Scaffold'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
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
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your name',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.favorite, color: Colors.pink),
                Icon(Icons.thumb_up, color: Colors.blue),
                Icon(Icons.share, color: Colors.green),
              ],
            ),
            const SizedBox(height: 16),
            const LinearProgressIndicator(),
          ],
        );
      },
      renderFooter: (context) {
        return const Center(child: Text('This is the footer'));
      },
    );
  }
}
