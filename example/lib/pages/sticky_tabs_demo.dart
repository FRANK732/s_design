import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class StickyTabsDemoPage
    extends StatefulWidget {
  const StickyTabsDemoPage(
      {super.key});

  @override
  State<StickyTabsDemoPage>
      createState() =>
          _StickyTabsDemoPageState();
}

class _StickyTabsDemoPageState
    extends State<
        StickyTabsDemoPage>
    with
        SingleTickerProviderStateMixin {
  late TabController
      _tabController;

  final List<STabItem>
      _items =
      [
    STabItem(
      label:
          'Posts',
      key:
          'posts',
      content:
          Builder(builder: (context) {
        return CustomScrollView(
          key: const PageStorageKey('posts'),
          slivers: [
            SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text('Post #$index')),
                childCount: 30,
              ),
            ),
          ],
        );
      }),
    ),
    STabItem(
      label:
          'Photos',
      key:
          'photos',
      content:
          Builder(builder: (context) {
        return CustomScrollView(
          key: const PageStorageKey('photos'),
          slivers: [
            SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              delegate: SliverChildBuilderDelegate(
                (context, index) => Card(color: Colors.blue[100 * (index % 9)], child: Center(child: Text('Photo #$index'))),
                childCount: 30,
              ),
            ),
          ],
        );
      }),
    ),
    STabItem(
      label:
          'About',
      key:
          'about',
      content:
          const Center(child: Text('About Content')),
    ),
  ];

  @override
  void
      initState() {
    super
        .initState();
    _tabController = TabController(
        length: _items.length,
        vsync: this);
  }

  @override
  void
      dispose() {
    _tabController
        .dispose();
    super
        .dispose();
  }

  @override
  Widget build(
      BuildContext
          context) {
    return SScaffold(
        useSafeArea: false,
        renderBody: (BuildContext context) {
          return NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    title: const Text('Sticky Tabs Demo'),
                    expandedHeight: 200,
                    flexibleSpace: FlexibleSpaceBar(
                      background: ColoredBox(color: Colors.indigo.shade100, child: const Center(child: Icon(Icons.image, size: 80, color: Colors.white))),
                    ),
                  ),
                ),
                SliverSTabs(
                  controller: _tabController,
                  items: _items,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
              ];
            },
            body: STabView(
              controller: _tabController,
              children: _items.map((e) => e.content).toList(),
            ),
          );
        });
  }
}
