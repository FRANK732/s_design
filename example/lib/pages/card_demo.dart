import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class SCardDemoPage
    extends StatefulWidget {
  const SCardDemoPage(
      {super.key});

  @override
  State<SCardDemoPage>
      createState() =>
          _SCardDemoPageState();
}

class _SCardDemoPageState
    extends State<
        SCardDemoPage> {
  bool
      _loading =
      false;

  void
      _toggleLoading() {
    setState(
        () {
      _loading =
          !_loading;
    });
  }

  @override
  Widget build(
      BuildContext
          context) {
    return SScaffold(
      appBar:
          AppBar(title: const Text('SCard Demo (Ant Design)')),
      renderBody:
          (context) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Basic Card'),
              const SCard(
                title: 'Default Size Card',
                headerTrailing: Text('More', style: TextStyle(color: Colors.blue)),
                body: Text('Card content'),
                width: 300,
              ),
              const SizedBox(height: 32),
              _buildSectionTitle('Borderless Card'),
              Container(
                padding: const EdgeInsets.all(24),
                color: Colors.grey.shade100,
                child: const SCard(
                  title: 'Card title',
                  variant: SCardVariant.borderless,
                  body: Text('Card content in a gray background container.'),
                  width: 300,
                ),
              ),
              const SizedBox(height: 32),
              _buildSectionTitle('Hoverable Card (Grid)'),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  SCard(
                    title: 'Hoverable 1',
                    hoverable: true,
                    width: 200,
                    body: const Text('Hover me to lift up!'),
                    onTap: () {},
                  ),
                  SCard(
                    title: 'Hoverable 2',
                    hoverable: true,
                    width: 200,
                    body: const Text('I also lift up!'),
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 32),
              _buildSectionTitle('Simple Card'),
              const SCard(
                body: Text('Card content without header'),
                width: 300,
              ),
              const SizedBox(height: 32),
              _buildSectionTitle('Card with Cover'),
              const SCard(
                width: 300,
                mediaPosition: SCardImagePosition.top,
                media: Image(
                  image: NetworkImage('https://os.alipayobjects.com/rmsportal/QBnOOoLaAfKPirc.png'), // Placeholder or asset
                  fit: BoxFit.cover,
                ),
                mediaHeight: 160,
                body: SCardMeta(
                  title: Text('Europe Street beat'),
                  description: Text('www.instagram.com'),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSectionTitle('Loading Card'),
                  SButton(onPressed: _toggleLoading, child: const Text('Toggle Loading')),
                ],
              ),
              SCard(
                width: 300,
                isLoading: _loading,
                title: 'Card Title',
                description: 'This is the description',
                body: const SCardMeta(
                  avatar: CircleAvatar(backgroundImage: NetworkImage('https://api.dicebear.com/7.x/miniavs/png?seed=1')),
                  title: Text('Card Title'),
                  description: Text('This is the description'),
                ),
                actions: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(Icons.settings),
                    Icon(Icons.edit),
                    Icon(Icons.more_horiz),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              _buildSectionTitle('Meta Card'),
              const SCard(
                width: 350,
                body: SCardMeta(
                  avatar: CircleAvatar(child: Icon(Icons.person)),
                  title: Text('Card Title'),
                  description: Text('This is the description'),
                ),
              ),
              const SizedBox(height: 32),
              _buildSectionTitle('Grid Card'),
              SCardGrid(
                crossAxisCount: 3,
                children: [
                  SCard(variant: SCardVariant.borderless, body: const Center(child: Text('Card 1')), hoverable: true),
                  SCard(variant: SCardVariant.borderless, body: const Center(child: Text('Card 2')), hoverable: true),
                  SCard(variant: SCardVariant.borderless, body: const Center(child: Text('Card 3')), hoverable: true),
                  SCard(variant: SCardVariant.borderless, body: const Center(child: Text('Card 4')), hoverable: true),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(
      String
          title) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 12),
      child:
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }
}
