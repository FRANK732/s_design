import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class SAvatarPage
    extends StatefulWidget {
  const SAvatarPage(
      {super.key});

  @override
  State<SAvatarPage>
      createState() =>
          _SAvatarPageState();
}

class _SAvatarPageState
    extends State<
        SAvatarPage> {
  // dynamic scaling state
  final _userList =
      [
    'U',
    'Lucy',
    'Tom',
    'Edward'
  ];
  final _colorList =
      [
    const Color(
        0xFFF56A00),
    const Color(
        0xFF7265E6),
    const Color(
        0xFFFFBF00),
    const Color(
        0xFF00A2AE)
  ];
  final _gapList =
      [
    4.0,
    3.0,
    2.0,
    1.0
  ];
  int _idx =
      0;

  void
      _changeUser() {
    setState(
        () {
      _idx =
          (_idx + 1) % _userList.length;
    });
  }

  void
      _changeGap() {
    // Just mixing up the gap along with user scaling for test
    setState(
        () {
      _idx =
          (_idx + 1) % _gapList.length;
    });
  }

  Widget _buildSection(
      String
          title,
      Widget
          child) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 24.0),
      child:
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  @override
  Widget build(
      BuildContext
          context) {
    final url =
        'https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png';
    final fallbackUrl =
        'http://abc.com/not-exist.jpg'; // deliberately broken

    return Scaffold(
      appBar:
          AppBar(title: const Text('SAvatar (Ant Design)')),
      body:
          SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'Basic',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 16,
                    children: [
                      const SAvatar(customSize: 64, icon: Icon(Icons.person_outline)),
                      const SAvatar(size: SAvatarSize.large, icon: Icon(Icons.person_outline)),
                      const SAvatar(icon: Icon(Icons.person_outline)),
                      const SAvatar(size: SAvatarSize.small, icon: Icon(Icons.person_outline)),
                      const SAvatar(customSize: 14, icon: Icon(Icons.person_outline)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 16,
                    children: [
                      const SAvatar(shape: SAvatarShape.square, customSize: 64, icon: Icon(Icons.person_outline)),
                      const SAvatar(shape: SAvatarShape.square, size: SAvatarSize.large, icon: Icon(Icons.person_outline)),
                      const SAvatar(shape: SAvatarShape.square, icon: Icon(Icons.person_outline)),
                      const SAvatar(shape: SAvatarShape.square, size: SAvatarSize.small, icon: Icon(Icons.person_outline)),
                      const SAvatar(shape: SAvatarShape.square, customSize: 14, icon: Icon(Icons.person_outline)),
                    ],
                  ),
                ],
              ),
            ),
            _buildSection(
              'Type',
              Wrap(
                spacing: 16,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const SAvatar(icon: Icon(Icons.person_outline)),
                  const SAvatar(text: 'U'),
                  const SAvatar(customSize: 40, text: 'USER'),
                  SAvatar(src: url),
                  const SAvatar(
                    backgroundColor: Color(0xFFFDE3CF),
                    foregroundColor: Color(0xFFF56A00),
                    text: 'U',
                  ),
                  const SAvatar(
                    backgroundColor: Color(0xFF87D068),
                    icon: Icon(Icons.person_outline),
                  ),
                ],
              ),
            ),
            _buildSection(
              'Autoset Font Size',
              Wrap(
                spacing: 16,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SAvatar(
                    size: SAvatarSize.large,
                    backgroundColor: _colorList[_idx],
                    gap: _gapList[_idx],
                    text: _userList[_idx],
                  ),
                  ElevatedButton(
                    onPressed: _changeUser,
                    child: const Text('Change User'),
                  ),
                  ElevatedButton(
                    onPressed: _changeGap,
                    child: const Text('Change Gap'),
                  ),
                ],
              ),
            ),
            _buildSection(
              'Fallback',
              Wrap(
                spacing: 16,
                children: [
                  SAvatar(shape: SAvatarShape.circle, src: fallbackUrl, text: 'A'),
                  SAvatar(shape: SAvatarShape.circle, src: fallbackUrl, text: 'ABC'),
                ],
              ),
            ),
            _buildSection(
              'With Badge (Placeholder since SBadge exists)',
              Wrap(
                spacing: 24,
                children: [
                  Badge(
                    label: const Text('1'),
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: const SAvatar(shape: SAvatarShape.square, icon: Icon(Icons.person_outline)),
                  ),
                  Badge(
                    smallSize: 8,
                    child: const SAvatar(shape: SAvatarShape.square, icon: Icon(Icons.person_outline)),
                  ),
                ],
              ),
            ),
            _buildSection(
              'Avatar.Group',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SAvatarGroup(
                    children: [
                      const SAvatar(src: 'https://api.dicebear.com/7.x/miniavs/svg?seed=1'),
                      const SAvatar(backgroundColor: Color(0xFFF56A00), text: 'K'),
                      const SAvatar(backgroundColor: Color(0xFF87D068), icon: Icon(Icons.person_outline)),
                      const SAvatar(backgroundColor: Color(0xFF1677FF), icon: Icon(Icons.design_services_outlined)),
                    ],
                  ),
                  const Divider(height: 32),
                  const SAvatarGroup(
                    maxCount: 2,
                    maxStyle: SAvatar(
                      backgroundColor: Color(0xFFFDE3CF),
                      foregroundColor: Color(0xFFF56A00),
                    ),
                    children: [
                      SAvatar(src: 'https://api.dicebear.com/7.x/miniavs/svg?seed=2'),
                      SAvatar(backgroundColor: Color(0xFFF56A00), text: 'K'),
                      SAvatar(backgroundColor: Color(0xFF87D068), icon: Icon(Icons.person_outline)),
                      SAvatar(backgroundColor: Color(0xFF1677FF), icon: Icon(Icons.design_services_outlined)),
                    ],
                  ),
                  const Divider(height: 32),
                  const SAvatarGroup(
                    size: SAvatarSize.large,
                    maxCount: 2,
                    maxStyle: SAvatar(
                      backgroundColor: Color(0xFFFDE3CF),
                      foregroundColor: Color(0xFFF56A00),
                    ),
                    children: [
                      SAvatar(src: 'https://api.dicebear.com/7.x/miniavs/svg?seed=3'),
                      SAvatar(backgroundColor: Color(0xFFF56A00), text: 'K'),
                      SAvatar(backgroundColor: Color(0xFF87D068), icon: Icon(Icons.person_outline)),
                      SAvatar(backgroundColor: Color(0xFF1677FF), icon: Icon(Icons.design_services_outlined)),
                    ],
                  ),
                  const Divider(height: 32),
                  const SAvatarGroup(
                    shape: SAvatarShape.square,
                    children: [
                      SAvatar(backgroundColor: Color(0xFFFDE3CF), text: 'A'),
                      SAvatar(backgroundColor: Color(0xFFF56A00), text: 'K'),
                      SAvatar(backgroundColor: Color(0xFF87D068), icon: Icon(Icons.person_outline)),
                      SAvatar(backgroundColor: Color(0xFF1677FF), icon: Icon(Icons.design_services_outlined)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
