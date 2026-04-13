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
    final l10n = SLocalizations.ofContext(context);
    return SScaffold(
      appBar:
          AppBar(
        title: Text(l10n.paginationTitle),
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
            _sectionHeader(l10n.paginationHeader1),
            _description(l10n.paginationDesc1),
            SPagination(
              total: 50,
              onChange: (page, size) => _log(ctx, 'Page: $page, PageSize: $size'),
            ),
            const SizedBox(height: 32),

            // ── 2. More Pages (Ellipsis) ───────────────────────────────────
            _sectionHeader(l10n.paginationHeader2),
            _description(l10n.paginationDesc2),
            SPagination(
              defaultCurrent: 6,
              total: 500,
              onChange: (page, size) => _log(ctx, 'Page: $page'),
            ),
            const SizedBox(height: 32),

            // ── 3. Changer (Size Selector) ─────────────────────────────────
            _sectionHeader(l10n.paginationHeader3),
            _description(l10n.paginationDesc3),
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
            _sectionHeader(l10n.paginationHeader4),
            _description(l10n.paginationDesc4),
            SPagination(
              showQuickJumper: true,
              defaultCurrent: 2,
              total: 500,
              onChange: (page, size) => _log(ctx, 'Page: $page'),
            ),
            const SizedBox(height: 16),
            const SPagination(
              showQuickJumper: true,
              defaultCurrent: 2,
              total: 500,
              disabled: true,
            ),
            const SizedBox(height: 32),

            // ── 5. Mini Size ───────────────────────────────────────────────
            _sectionHeader(l10n.paginationHeader5),
            _description(l10n.paginationDesc5),
            const SPagination(size: SPaginationSize.small, total: 50),
            const SizedBox(height: 12),
            const SPagination(
              size: SPaginationSize.small,
              total: 50,
              showSizeChanger: true,
              showQuickJumper: true,
            ),
            const SizedBox(height: 12),
            SPagination(
              size: SPaginationSize.small,
              total: 50,
              showTotal: (total, _) => l10n.paginationLabelTotal(total),
            ),
            const SizedBox(height: 12),
            SPagination(
              size: SPaginationSize.small,
              total: 50,
              disabled: true,
              showTotal: (total, _) => l10n.paginationLabelTotal(total),
              showSizeChanger: true,
              showQuickJumper: true,
            ),
            const SizedBox(height: 24),

            _sectionHeader(l10n.paginationHeader5b),
            _description(l10n.paginationDesc5b),
            const SPagination(size: SPaginationSize.large, total: 50),
            const SizedBox(height: 12),
            const SPagination(
              size: SPaginationSize.large,
              total: 50,
              showSizeChanger: true,
              showQuickJumper: true,
            ),
            const SizedBox(height: 12),
            SPagination(
              size: SPaginationSize.large,
              total: 50,
              showTotal: (total, _) => l10n.paginationLabelTotal(total),
            ),
            const SizedBox(height: 12),
            SPagination(
              size: SPaginationSize.large,
              total: 50,
              disabled: true,
              showTotal: (total, _) => l10n.paginationLabelTotal(total),
              showSizeChanger: true,
              showQuickJumper: true,
            ),
            const SizedBox(height: 32),

            // ── 6. Simple Mode ─────────────────────────────────────────────
            _sectionHeader(l10n.paginationHeader6),
            _description(l10n.paginationDesc6),
            const SPagination(simple: true, defaultCurrent: 2, total: 50),
            const SizedBox(height: 12),
            const SPagination(simple: true, defaultCurrent: 2, total: 50, disabled: true),
            const SizedBox(height: 32),

            // ── 7. Controlled ──────────────────────────────────────────────
            _sectionHeader(l10n.paginationHeader7),
            _description(l10n.paginationDesc7),
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: [
                SPagination(
                  current: _controlledPage,
                  total: 50,
                  onChange: (page, _) => setState(() => _controlledPage = page),
                ),
                Chip(label: Text(l10n.paginationLabelState(_controlledPage))),
              ],
            ),
            const SizedBox(height: 32),

            // ── 8. Show Total ──────────────────────────────────────────────
            _sectionHeader(l10n.paginationHeader8),
            _description(l10n.paginationDesc8),
            SPagination(
              total: 85,
              showTotal: (total, _) => l10n.paginationLabelTotal(total),
              defaultPageSize: 20,
            ),
            const SizedBox(height: 12),
            SPagination(
              total: 85,
              showTotal: (total, range) => l10n.paginationLabelRange(range[0], range[1], total),
              defaultPageSize: 20,
            ),
            const SizedBox(height: 32),

            // ── 9. Custom Item Render ──────────────────────────────────────
            _sectionHeader(l10n.paginationHeader9),
            _description(l10n.paginationDesc9),
            SPagination(
              total: 500,
              itemRender: (page, type, defaultWidget) {
                if (type == SPaginationItemType.prev) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(l10n.paginationLabelPrevious, style: const TextStyle(fontSize: 13, color: Color(0xFF1677FF))),
                  );
                }
                if (type == SPaginationItemType.next) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(l10n.paginationLabelNext, style: const TextStyle(fontSize: 13, color: Color(0xFF1677FF))),
                  );
                }
                return defaultWidget;
              },
            ),
            const SizedBox(height: 32),

            // ── 10. Alignment ──────────────────────────────────────────────
            _sectionHeader(l10n.paginationHeader10),
            _description(l10n.paginationDesc10),
            const SPagination(total: 50),
            const SizedBox(height: 12),
            const SPagination(align: SPaginationAlign.center, total: 50),
            const SizedBox(height: 12),
            const SPagination(align: SPaginationAlign.end, total: 50),
            const SizedBox(height: 32),

            // ── 11. All Features ───────────────────────────────────────────
            _sectionHeader(l10n.paginationHeader11),
            _description(l10n.paginationDesc11),
            SPagination(
              total: 85,
              showSizeChanger: true,
              showQuickJumper: true,
              showTotal: (total, _) => l10n.paginationLabelTotal(total),
            ),
            const SizedBox(height: 32),

            // ── 12. Open Customizability ───────────────────────────────────
            _sectionHeader(l10n.paginationHeader12),
            _description(l10n.paginationDesc12),
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

Widget _sectionHeader(
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
