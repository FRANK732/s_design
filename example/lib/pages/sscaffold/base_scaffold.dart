import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_design/s_design.dart';

class BaseScaffoldPage extends StatefulWidget {
  const BaseScaffoldPage({super.key});

  @override
  State<BaseScaffoldPage> createState() => _ListTilePageState();
}

class _ListTilePageState extends State<BaseScaffoldPage> {
  @override
  Widget build(BuildContext context) {
    return SScaffold(
      appBar: AppBar(
        title: const Text('SScaffold Navigation'),
      ),
      renderBody: (BuildContext context) {
        return ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            SListTile(
              title: const Text('Base Scaffold'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Get.toNamed<dynamic>('/scaffold_page');
              },
            ),
            const SizedBox(height: 16),
            SListTile(
              title: const Text('Safe Area Example'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Get.toNamed<dynamic>('/useSafe_scaffold_page');
              },
            ),
          ],
        );
      },
    );
  }
}

class ScaffoldPage extends StatefulWidget {
  const ScaffoldPage({super.key});

  @override
  State<ScaffoldPage> createState() => _ScaffoldPageState();
}

class _ScaffoldPageState extends State<ScaffoldPage> {
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

/// SafeArea Toggle Example
class SafeAreaScaffoldPage extends StatefulWidget {
  const SafeAreaScaffoldPage({super.key});

  @override
  State<SafeAreaScaffoldPage> createState() => _SafeAreaScaffoldPageState();
}

class _SafeAreaScaffoldPageState extends State<SafeAreaScaffoldPage> {
  bool _useSafeArea = true;

  @override
  Widget build(BuildContext context) {
    return SScaffold(
      useSafeArea: _useSafeArea,
      appBar: AppBar(
        title: const Text('Safe Area Example'),
      ),
      renderBody: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.blue,
              height: 100,
              width: double.infinity,
              child: const Center(
                child: Text(
                  'Top Content',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            SButton(
              onPressed: () {
                setState(() => _useSafeArea = !_useSafeArea);
              },
              child:
                  Text(_useSafeArea ? 'Disable Safe Area' : 'Enable Safe Area'),
            ),
            Container(
              color: Colors.green,
              height: 100,
              width: double.infinity,
              child: const Center(
                child: Text(
                  'Bottom Content',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        );
      },
      renderFooter: (BuildContext context) {
        return const Center(child: Text('Safe Area Footer'));
      },
    );
  }
}
