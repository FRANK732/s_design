import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

/// Demo page showcasing all SPagination features, mirroring all
/// Pagination demo sections.
class SPaginationPage
    extends StatefulWidget {
  const SPaginationPage(
      {super.key});

  @override
  State<SPaginationPage>
      createState() =>
          _SPaginationPageState();
}

class _SPaginationPageState
    extends State<
        SPaginationPage> {
  int _controlledPage =
      3;

  @override
  Widget build(
      BuildContext
          context) {
    return SScaffold(
      appBar:
          AppBar(
        title: const Text('SPagination'),
        elevation: 0,
      ),
      scrollable:
          true,
      renderBody: (ctx) =>
          Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── 1. Basic ───────────────────────────────────────────────────
            _SectionHeader('1. Basic'),
            _description('Basic pagination with 50 total items.'),
            SPagination(
              defaultCurrent: 1,
              total: 50,
              onChange: (page, size) => _log(ctx, 'Page: $page, PageSize: $size'),
            ),
            const SizedBox(height: 32),

            // ── 2. More Pages (Ellipsis) ───────────────────────────────────
            _SectionHeader('2. More Pages — Ellipsis'),
            _description('With 500 items, ellipsis (•••) buttons appear. Tap them to jump ±5 pages.'),
            SPagination(
              defaultCurrent: 6,
              total: 500,
              onChange: (page, size) => _log(ctx, 'Page: $page'),
            ),
            const SizedBox(height: 32),

            // ── 3. Changer (Size Selector) ─────────────────────────────────
            _SectionHeader('3. Size Changer'),
            _description('showSizeChanger adds a dropdown to pick 10/20/50/100 items per page.'),
            SPagination(
              showSizeChanger: true,
              defaultCurrent: 3,
              total: 500,
              onShowSizeChange: (cur, size) => _log(ctx, 'Current: $cur, PageSize: $size'),
            ),
            const SizedBox(height: 16),
            SPagination(
              showSizeChanger: true,
              defaultCurrent: 3,
              total: 500,
              disabled: true,
              onShowSizeChange: (cur, size) => _log(ctx, 'Current: $cur, PageSize: $size'),
            ),
            const SizedBox(height: 32),

            // ── 4. Quick Jumper ────────────────────────────────────────────
            _SectionHeader('4. Quick Jumper'),
            _description('showQuickJumper adds a "Go to" field. Type a page number and press Enter.'),
            SPagination(
              showQuickJumper: true,
              defaultCurrent: 2,
              total: 500,
              onChange: (page, size) => _log(ctx, 'Page: $page'),
            ),
            const SizedBox(height: 16),
            SPagination(
              showQuickJumper: true,
              defaultCurrent: 2,
              total: 500,
              disabled: true,
            ),
            const SizedBox(height: 32),

            // ── 5. Mini Size ───────────────────────────────────────────────
            _SectionHeader('5. Size Variants — Small'),
            _description('size: SPaginationSize.small produces compact 24px items.'),
            SPagination(size: SPaginationSize.small, total: 50),
            const SizedBox(height: 12),
            SPagination(
              size: SPaginationSize.small,
              total: 50,
              showSizeChanger: true,
              showQuickJumper: true,
            ),
            const SizedBox(height: 12),
            SPagination(
              size: SPaginationSize.small,
              total: 50,
              showTotal: (total, _) => 'Total $total items',
            ),
            const SizedBox(height: 12),
            SPagination(
              size: SPaginationSize.small,
              total: 50,
              disabled: true,
              showTotal: (total, _) => 'Total $total items',
              showSizeChanger: true,
              showQuickJumper: true,
            ),
            const SizedBox(height: 24),

            _SectionHeader('5b. Size Variants — Large'),
            _description('size: SPaginationSize.large produces 40px items.'),
            SPagination(size: SPaginationSize.large, total: 50),
            const SizedBox(height: 12),
            SPagination(
              size: SPaginationSize.large,
              total: 50,
              showSizeChanger: true,
              showQuickJumper: true,
            ),
            const SizedBox(height: 12),
            SPagination(
              size: SPaginationSize.large,
              total: 50,
              showTotal: (total, _) => 'Total $total items',
            ),
            const SizedBox(height: 12),
            SPagination(
              size: SPaginationSize.large,
              total: 50,
              disabled: true,
              showTotal: (total, _) => 'Total $total items',
              showSizeChanger: true,
              showQuickJumper: true,
            ),
            const SizedBox(height: 32),

            // ── 6. Simple Mode ─────────────────────────────────────────────
            _SectionHeader('6. Simple Mode'),
            _description('simple: true shows current/total input instead of page buttons.'),
            SPagination(simple: true, defaultCurrent: 2, total: 50),
            const SizedBox(height: 12),
            SPagination(simple: true, defaultCurrent: 2, total: 50, disabled: true),
            const SizedBox(height: 32),

            // ── 7. Controlled ──────────────────────────────────────────────
            _SectionHeader('7. Controlled Mode'),
            _description('Provide current + onChange to fully control the page from parent state.'),
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: [
                SPagination(
                  current: _controlledPage,
                  total: 50,
                  onChange: (page, _) => setState(() => _controlledPage = page),
                ),
                Chip(label: Text('State: page $_controlledPage')),
              ],
            ),
            const SizedBox(height: 32),

            // ── 8. Show Total ──────────────────────────────────────────────
            _SectionHeader('8. showTotal'),
            _description('showTotal receives (total, [first, last]) — build any label.'),
            SPagination(
              total: 85,
              showTotal: (total, _) => 'Total $total items',
              defaultPageSize: 20,
              defaultCurrent: 1,
            ),
            const SizedBox(height: 12),
            SPagination(
              total: 85,
              showTotal: (total, range) => '${range[0]}–${range[1]} of $total items',
              defaultPageSize: 20,
              defaultCurrent: 1,
            ),
            const SizedBox(height: 32),

            // ── 9. Custom Item Render ──────────────────────────────────────
            _SectionHeader('9. Custom itemRender'),
            _description('itemRender replaces prev / next buttons with custom widgets.'),
            SPagination(
              total: 500,
              defaultCurrent: 1,
              itemRender: (page, type, defaultWidget) {
                if (type == SPaginationItemType.prev) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Text('‹ Previous', style: TextStyle(fontSize: 13, color: Color(0xFF1677FF))),
                  );
                }
                if (type == SPaginationItemType.next) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Text('Next ›', style: TextStyle(fontSize: 13, color: Color(0xFF1677FF))),
                  );
                }
                return defaultWidget;
              },
            ),
            const SizedBox(height: 32),

            // ── 10. Alignment ──────────────────────────────────────────────
            _SectionHeader('10. Alignment'),
            _description('align: start / center / end.'),
            SPagination(align: SPaginationAlign.start, defaultCurrent: 1, total: 50),
            const SizedBox(height: 12),
            SPagination(align: SPaginationAlign.center, defaultCurrent: 1, total: 50),
            const SizedBox(height: 12),
            SPagination(align: SPaginationAlign.end, defaultCurrent: 1, total: 50),
            const SizedBox(height: 32),

            // ── 11. All Features ───────────────────────────────────────────
            _SectionHeader('11. All Features Combined'),
            _description('showSizeChanger + showQuickJumper + showTotal together.'),
            SPagination(
              total: 85,
              showSizeChanger: true,
              showQuickJumper: true,
              showTotal: (total, _) => 'Total $total items',
            ),
            const SizedBox(height: 32),

            // ── 12. Open Customizability ───────────────────────────────────
            _SectionHeader('12. Open Customizability'),
            _description('Every visual token can be overridden per-instance.'),
            SPagination(
              total: 50,
              defaultCurrent: 3,
              activeColor: const Color(0xFF722ED1),
              activeBorderColor: const Color(0xFF722ED1),
              hoverBorderColor: const Color(0xFF722ED1),
              hoverTextColor: const Color(0xFF722ED1),
              borderRadius: BorderRadius.circular(20),
              itemSize: 36,
              itemSpacing: 6,
              itemTextStyle: const TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  void _log(
      BuildContext
          context,
      String
          msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(msg),
        duration: const Duration(seconds: 1)));
  }
}

Widget _SectionHeader(
        String text) =>
    Padding(
      padding:
          const EdgeInsets.only(bottom: 4),
      child:
          Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );

Widget _description(
        String text) =>
    Padding(
      padding:
          const EdgeInsets.only(bottom: 12),
      child:
          Text(text, style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
    );
