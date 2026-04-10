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
    const url =
        'https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png';
    const fallbackUrl =
        'http://abc.com/not-exist.jpg'; // deliberately broken

    return SScaffold(
      appBar:
          AppBar(title: const Text('SAvatar')),
      renderBody: (context) =>
          SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'Basic',
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 16,
                    children: [
                      SAvatar(customSize: 64, icon: Icon(Icons.person_outline)),
                      SAvatar(size: SAvatarSize.large, icon: Icon(Icons.person_outline)),
                      SAvatar(icon: Icon(Icons.person_outline)),
                      SAvatar(size: SAvatarSize.small, icon: Icon(Icons.person_outline)),
                      SAvatar(customSize: 14, icon: Icon(Icons.person_outline)),
                    ],
                  ),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 16,
                    children: [
                      SAvatar(shape: SAvatarShape.square, customSize: 64, icon: Icon(Icons.person_outline)),
                      SAvatar(shape: SAvatarShape.square, size: SAvatarSize.large, icon: Icon(Icons.person_outline)),
                      SAvatar(shape: SAvatarShape.square, icon: Icon(Icons.person_outline)),
                      SAvatar(shape: SAvatarShape.square, size: SAvatarSize.small, icon: Icon(Icons.person_outline)),
                      SAvatar(shape: SAvatarShape.square, customSize: 14, icon: Icon(Icons.person_outline)),
                    ],
                  ),
                ],
              ),
            ),
            _buildSection(
              'Type',
              const Wrap(
                spacing: 16,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SAvatar(icon: Icon(Icons.person_outline)),
                  SAvatar(text: 'U'),
                  SAvatar(customSize: 40, text: 'USER'),
                  SAvatar(src: url),
                  SAvatar(
                    backgroundColor: Color(0xFFFDE3CF),
                    foregroundColor: Color(0xFFF56A00),
                    text: 'U',
                  ),
                  SAvatar(
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
              const Wrap(
                spacing: 16,
                children: [
                  SAvatar(src: fallbackUrl, text: 'A'),
                  SAvatar(src: fallbackUrl, text: 'ABC'),
                ],
              ),
            ),
            _buildSection(
              'With Badge (Placeholder since SBadge exists)',
              const Wrap(
                spacing: 24,
                children: [
                  Badge(
                    label: Text('1'),
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: SAvatar(shape: SAvatarShape.square, icon: Icon(Icons.person_outline)),
                  ),
                  Badge(
                    smallSize: 8,
                    child: SAvatar(shape: SAvatarShape.square, icon: Icon(Icons.person_outline)),
                  ),
                ],
              ),
            ),
            _buildSection(
              'Avatar.Group',
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SAvatarGroup(
                    children: [
                      SAvatar(src: 'https://api.dicebear.com/7.x/miniavs/svg?seed=1'),
                      SAvatar(backgroundColor: Color(0xFFF56A00), text: 'K'),
                      SAvatar(backgroundColor: Color(0xFF87D068), icon: Icon(Icons.person_outline)),
                      SAvatar(backgroundColor: Color(0xFF1677FF), icon: Icon(Icons.design_services_outlined)),
                    ],
                  ),
                  Divider(height: 32),
                  SAvatarGroup(
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
                  Divider(height: 32),
                  SAvatarGroup(
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
                  Divider(height: 32),
                  SAvatarGroup(
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
