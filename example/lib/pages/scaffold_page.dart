import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class ScaffoldPage
    extends StatelessWidget {
  const ScaffoldPage(
      {super.key});

  @override
  Widget build(
      BuildContext
          context) {
    final l10n =
        SLocalizations.ofContext(context);
    return SScaffold
        .slivers(
      slivers: (context) =>
          [
        SliverAppBar(
          title: Text(l10n.scaffoldTitle),
          floating: true,
          pinned: true,
          expandedHeight: 150.0,
          flexibleSpace: const FlexibleSpaceBar(
            background: FlutterLogo(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              l10n.scaffoldDesc,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
        SliverPersistentHeader(
          delegate: _StickyHeaderDelegate(title: l10n.scaffoldStickyHeader),
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                width: 100,
                margin: const EdgeInsets.all(8),
                color: Colors.blue[(index % 9 + 1) * 100],
                alignment: Alignment.center,
                child: Text(l10n.scaffoldLabelHItem(index), style: const TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => SListTile(
              title: Text(l10n.scaffoldLabelItem(index)),
              subtitle: Text(l10n.scaffoldLabelSubtitle(index)),
              onTap: () {},
            ),
            childCount: 20,
          ),
        ),
      ],
      refreshConfig:
          RefreshConfig(
        enabled: true,
        onRefresh: () async {
          await Future<void>.delayed(const Duration(seconds: 2));
        },
      ),
      floatingActionButtonConfig:
          FloatingActionButtonConfig(
        floatingActionButton: SButton(
          onPressed: () {},
          child: Text(l10n.scaffoldLabelFAB),
        ),
      ),
    );
  }
}

class _StickyHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  _StickyHeaderDelegate(
      {required this.title});
  final String
      title;

  @override
  Widget build(
      BuildContext
          context,
      double
          shrinkOffset,
      bool
          overlapsContent) {
    return Container(
      color:
          Theme.of(context).primaryColor.withOpacity(0.9),
      padding:
          const EdgeInsets.symmetric(horizontal: 16.0),
      alignment:
          Alignment.centerLeft,
      child:
          Text(
        title,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  @override
  double get maxExtent =>
      60.0;

  @override
  double get minExtent =>
      60.0;

  @override
  bool shouldRebuild(
      covariant _StickyHeaderDelegate
          oldDelegate) {
    return title !=
        oldDelegate.title;
  }
}
