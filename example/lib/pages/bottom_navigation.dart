import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

import '../widgets/code_snippet.dart';

class BottomNavigationPage
    extends StatefulWidget {
  const BottomNavigationPage(
      {super.key});

  @override
  State<BottomNavigationPage>
      createState() =>
          _BottomNavigationPageState();
}

class _BottomNavigationPageState
    extends State<
        BottomNavigationPage> {
  int _capsuleIndex =
      0;
  int _dotIndex =
      0;
  int _flashyIndex =
      0;
  int _shiftIndex =
      0;

  final items =
      [
    SAnimatedBottomBarItem(
      icon:
          const Icon(Icons.home_outlined),
      activeIcon:
          const Icon(Icons.home),
      title:
          const Text('Home'),
      selectedColor:
          Colors.blue,
    ),
    SAnimatedBottomBarItem(
      icon:
          const Icon(Icons.favorite_outline),
      activeIcon:
          const Icon(Icons.favorite),
      title:
          const Text('Likes'),
      selectedColor:
          Colors.red,
    ),
    SAnimatedBottomBarItem(
      icon:
          const Icon(Icons.search_outlined),
      activeIcon:
          const Icon(Icons.search),
      title:
          const Text('Search'),
      selectedColor:
          Colors.orange,
    ),
    SAnimatedBottomBarItem(
      icon:
          const Icon(Icons.person_outline),
      activeIcon:
          const Icon(Icons.person),
      title:
          const Text('Profile'),
      selectedColor:
          Colors.teal,
    ),
  ];

  @override
  Widget build(
      BuildContext
          context) {
    return Scaffold(
      appBar:
          AppBar(
        title: const Text('Animated Bottom Navigation'),
      ),
      body:
          SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'SCapsuleBottomBar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SCard(
              body: SCapsuleBottomBar(
                currentIndex: _capsuleIndex,
                onTap: (i) => setState(() => _capsuleIndex = i),
                items: items,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'SDotBottomBar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SCard(
              body: SDotBottomBar(
                currentIndex: _dotIndex,
                onTap: (i) => setState(() => _dotIndex = i),
                items: items,
                unselectedItemColor: Colors.grey,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'SFlashyBottomBar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SCard(
              body: SFlashyBottomBar(
                currentIndex: _flashyIndex,
                onTap: (i) => setState(() => _flashyIndex = i),
                items: items,
                unselectedItemColor: Colors.grey,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'SShiftBottomBar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SShiftBottomBar(
              currentIndex: _shiftIndex,
              onTap: (i) => setState(() => _shiftIndex = i),
              items: items,
              unselectedItemColor: Colors.white.withOpacity(0.5),
            ),
            const SizedBox(height: 32),
            const CodeSnippet(
              code: '''
final items = [
  SAnimatedBottomBarItem(
    icon: Icon(Icons.home_outlined),
    activeIcon: Icon(Icons.home),
    title: Text('Home'),
    selectedColor: SColors.blue500,
  ),
  // ... more items
];

// SCapsuleBottomBar
SCapsuleBottomBar(
  currentIndex: _currentIndex,
  onTap: (i) => setState(() => _currentIndex = i),
  items: items,
)

// SDotBottomBar
SDotBottomBar(
  currentIndex: _currentIndex,
  onTap: (i) => setState(() => _currentIndex = i),
  items: items,
)

// SFlashyBottomBar
SFlashyBottomBar(
  currentIndex: _currentIndex,
  onTap: (i) => setState(() => _currentIndex = i),
  items: items,
)

// SShiftBottomBar
SShiftBottomBar(
  currentIndex: _currentIndex,
  onTap: (i) => setState(() => _currentIndex = i),
  items: items,
)
''',
            ),
          ],
        ),
      ),
    );
  }
}
