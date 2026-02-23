import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

/// Demo page showcasing all [STimePicker] features, mirroring every
/// TimePicker demo section.
class STimePickerPage
    extends StatefulWidget {
  const STimePickerPage(
      {super.key});

  @override
  State<STimePickerPage>
      createState() =>
          _STimePickerPageState();
}

class _STimePickerPageState
    extends State<
        STimePickerPage> {
  // Section 11 — Controlled
  TimeOfDay?
      _controlledTime;

  @override
  Widget build(
      BuildContext
          context) {
    return SScaffold(
      appBar:
          AppBar(
        title: const Text('STimePicker'),
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
            // ── 1. Basic ────────────────────────────────────────────────────
            _header('1. Basic'),
            _desc('Default HH:mm:ss picker. Column scrolling only previews. '
                'Value commits when you tap OK or dismiss the panel.'),
            STimePicker(
              defaultOpenValue: const TimeOfDay(hour: 0, minute: 0),
              onChange: (t) => _snack(ctx, 'Time: $t'),
            ),
            const SizedBox(height: 32),

            // ── 2. 12-Hour ──────────────────────────────────────────────────
            _header('2. 12-Hour Clock'),
            _desc('use12Hours adds an AM/PM column. Format controls '
                'whether seconds are shown.'),
            Wrap(spacing: 12, runSpacing: 12, children: [
              STimePicker(use12Hours: true, onChange: (t) => _snack(ctx, '$t')),
              STimePicker(use12Hours: true, format: 'h:mm:ss A', onChange: (t) => _snack(ctx, '$t')),
              STimePicker(use12Hours: true, format: 'h:mm a', onChange: (t) => _snack(ctx, '$t')),
            ]),
            const SizedBox(height: 32),

            // ── 3. Disabled ─────────────────────────────────────────────────
            _header('3. Disabled'),
            _desc('disabled: true grays out the field and prevents the panel opening.'),
            const STimePicker(
              defaultValue: TimeOfDay(hour: 12, minute: 8),
              disabled: true,
            ),
            const SizedBox(height: 32),

            // ── 4. Size ─────────────────────────────────────────────────────
            _header('4. Size'),
            _desc('size: large (40 px) / middle (32 px, default) / small (24 px).'),
            const Wrap(spacing: 12, runSpacing: 12, children: [
              STimePicker(
                size: STimePickerSize.large,
                defaultValue: TimeOfDay(hour: 12, minute: 8),
              ),
              STimePicker(
                defaultValue: TimeOfDay(hour: 12, minute: 8),
              ),
              STimePicker(
                size: STimePickerSize.small,
                defaultValue: TimeOfDay(hour: 12, minute: 8),
              ),
            ]),
            const SizedBox(height: 32),

            // ── 5. Hide Seconds (HH:mm) ─────────────────────────────────────
            _header('5. Hide Seconds'),
            _desc("format: 'HH:mm' removes the seconds column from the panel."),
            const STimePicker(
              defaultValue: TimeOfDay(hour: 12, minute: 8),
              format: 'HH:mm',
            ),
            const SizedBox(height: 32),

            // ── 6. Interval Options ─────────────────────────────────────────
            _header('6. Interval Options'),
            _desc('hourStep, minuteStep, secondStep filter column items.'),
            STimePicker(
              minuteStep: 15,
              secondStep: 10,
              onChange: (t) => _snack(ctx, '$t'),
            ),
            const SizedBox(height: 32),

            // ── 7. Addon / Extra Footer ─────────────────────────────────────
            _header('7. Addon — renderExtraFooter'),
            _desc('renderExtraFooter adds a custom widget in the panel footer, '
                'alongside the built-in Now and OK buttons.'),
            STimePicker(
              renderExtraFooter: () => const Text(
                '✏️ Custom footer',
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
              onChange: (t) => _snack(ctx, '$t'),
            ),
            const SizedBox(height: 32),

            // ── 8. Status ───────────────────────────────────────────────────
            _header('8. Status'),
            _desc('status: error (red border) or warning (yellow border).'),
            const Wrap(spacing: 12, runSpacing: 12, children: [
              STimePicker(status: STimePickerStatus.error),
              STimePicker(status: STimePickerStatus.warning),
              STimeRangePicker(status: STimePickerStatus.error),
              STimeRangePicker(status: STimePickerStatus.warning),
            ]),
            const SizedBox(height: 32),

            // ── 9. Suffix / Prefix ──────────────────────────────────────────
            _header('9. Suffix & Prefix'),
            _desc('suffixIcon replaces the default clock icon; prefix adds a '
                'leading widget inside the field.'),
            Wrap(spacing: 12, runSpacing: 12, children: [
              STimePicker(
                suffixIcon: const Icon(Icons.sentiment_satisfied_alt, size: 16, color: Colors.amber),
                defaultValue: const TimeOfDay(hour: 0, minute: 0),
                onChange: (t) => _snack(ctx, '$t'),
              ),
              const STimePicker(
                prefix: Icon(Icons.sentiment_satisfied_alt, size: 14, color: Colors.amber),
              ),
              const STimeRangePicker(
                prefix: Icon(Icons.sentiment_satisfied_alt, size: 14, color: Colors.amber),
              ),
            ]),
            const SizedBox(height: 32),

            // ── 10. Variants ────────────────────────────────────────────────
            _header('10. Variants'),
            _desc('outlined (default) / filled / borderless / underlined.'),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(spacing: 8, runSpacing: 8, children: [
                  STimePicker(placeholder: 'Outlined'),
                  STimeRangePicker(placeholder: const (
                    'Outlined Start',
                    'Outlined End'
                  )),
                ]),
                SizedBox(height: 8),
                Wrap(spacing: 8, runSpacing: 8, children: [
                  STimePicker(variant: STimePickerVariant.filled, placeholder: 'Filled'),
                  STimeRangePicker(variant: STimePickerVariant.filled, placeholder: const (
                    'Filled Start',
                    'Filled End'
                  )),
                ]),
                SizedBox(height: 8),
                Wrap(spacing: 8, runSpacing: 8, children: [
                  STimePicker(variant: STimePickerVariant.borderless, placeholder: 'Borderless'),
                  STimeRangePicker(variant: STimePickerVariant.borderless, placeholder: const (
                    'Borderless Start',
                    'Borderless End'
                  )),
                ]),
                SizedBox(height: 8),
                Wrap(spacing: 8, runSpacing: 8, children: [
                  STimePicker(variant: STimePickerVariant.underlined, placeholder: 'Underlined'),
                  STimeRangePicker(variant: STimePickerVariant.underlined, placeholder: const (
                    'Underlined Start',
                    'Underlined End'
                  )),
                ]),
              ],
            ),
            const SizedBox(height: 32),

            // ── 11. Controlled ──────────────────────────────────────────────
            _header('11. Controlled Mode'),
            _desc('value + onChange give the parent full control.'),
            Wrap(spacing: 12, runSpacing: 8, children: [
              STimePicker(
                value: _controlledTime,
                onChange: (t) => setState(() => _controlledTime = t),
              ),
              Chip(
                label: Text('State: ${_controlledTime?.format(context) ?? 'null'}'),
              ),
            ]),
            const SizedBox(height: 32),

            // ── 12. needConfirm ─────────────────────────────────────────────
            _header('12. needConfirm'),
            _desc('Value is only committed when the user taps the OK button.'),
            STimePicker(
              needConfirm: true,
              onChange: (t) => _snack(ctx, 'Confirmed: $t'),
            ),
            const SizedBox(height: 32),

            // ── 13. changeOnScroll ──────────────────────────────────────────
            _header('13. changeOnScroll'),
            _desc('onChange fires live as the user snaps each column '
                '(needConfirm is false — default for changeOnScroll).'),
            STimePicker(
              changeOnScroll: true,
              onChange: (t) => _snack(ctx, 'Scroll→ $t'),
            ),
            const SizedBox(height: 32),

            // ── 14. showNow: false ──────────────────────────────────────────
            _header('14. showNow: false'),
            _desc('Hides the Now shortcut from the footer (mirroring showNow prop).'),
            STimePicker(
              showNow: false,
              onChange: (t) => _snack(ctx, '$t'),
            ),
            const SizedBox(height: 32),

            // ── 14. RangePicker ─────────────────────────────────────────────
            _header('14. Time Range Picker'),
            _desc('STimeRangePicker renders two pickers side-by-side.'),
            STimeRangePicker(
              defaultValue: (
                const TimeOfDay(hour: 12, minute: 8),
                const TimeOfDay(hour: 14, minute: 30),
              ),
              onRangeChange: (s, e) => _snack(ctx, '$s → $e'),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  void _snack(
      BuildContext
          ctx,
      String
          msg) {
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text(msg),
        duration: const Duration(seconds: 1)));
  }
}

Widget _header(
        String text) =>
    Padding(
      padding:
          const EdgeInsets.only(bottom: 4),
      child:
          Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );

Widget _desc(
        String text) =>
    Padding(
      padding:
          const EdgeInsets.only(bottom: 12),
      child:
          Text(text, style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
    );
