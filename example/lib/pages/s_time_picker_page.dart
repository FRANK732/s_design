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
    final l10n = SLocalizations.ofContext(context);
    return SScaffold(
      appBar:
          AppBar(
        title: Text(l10n.timePickerTitle),
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
            _header(l10n.demoBasicUsage),
            _desc(l10n.timePickerDescBasic),
            STimePicker(
              defaultOpenValue: const TimeOfDay(hour: 0, minute: 0),
              onChange: (t) => _snack(ctx, l10n.timePickerMsgTime(t?.format(context) ?? '')),
            ),
            const SizedBox(height: 32),

            _header(l10n.timePickerHeader12Hour),
            _desc(l10n.timePickerDesc12Hour),
            Wrap(spacing: 12, runSpacing: 12, children: [
              STimePicker(use12Hours: true, onChange: (t) => _snack(ctx, l10n.timePickerMsgTime(t?.format(context) ?? ''))),
              STimePicker(use12Hours: true, format: 'h:mm:ss A', onChange: (t) => _snack(ctx, l10n.timePickerMsgTime(t?.format(context) ?? ''))),
              STimePicker(use12Hours: true, format: 'h:mm a', onChange: (t) => _snack(ctx, l10n.timePickerMsgTime(t?.format(context) ?? ''))),
            ]),
            const SizedBox(height: 32),

            _header(l10n.demoDisabled),
            _desc(l10n.timePickerDescDisabled),
            STimePicker(
              defaultValue: const TimeOfDay(hour: 12, minute: 8),
              disabled: true,
              placeholder: l10n.demoDisabled,
            ),
            const SizedBox(height: 32),

            _header(l10n.demoSizes),
            _desc(l10n.timePickerDescSize),
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

            _header(l10n.demoHideSeconds),
            _desc(l10n.timePickerDescHideSeconds),
            const STimePicker(
              defaultValue: TimeOfDay(hour: 12, minute: 8),
              format: 'HH:mm',
            ),
            const SizedBox(height: 32),

            _header(l10n.timePickerHeaderInterval),
            _desc(l10n.timePickerDescInterval),
            STimePicker(
              minuteStep: 15,
              secondStep: 10,
              onChange: (t) => _snack(ctx, l10n.timePickerMsgTime(t?.format(context) ?? '')),
            ),
            const SizedBox(height: 32),

            _header(l10n.timePickerHeaderAddon),
            _desc(l10n.timePickerDescAddon),
            STimePicker(
              renderExtraFooter: () => Text(
                l10n.timePickerLabelCustomFooter,
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
              onChange: (t) => _snack(ctx, l10n.timePickerMsgTime(t?.format(context) ?? '')),
            ),
            const SizedBox(height: 32),

            _header(l10n.demoStatus),
            _desc(l10n.timePickerDescStatus),
            const Wrap(spacing: 12, runSpacing: 12, children: [
              STimePicker(status: STimePickerStatus.error),
              STimePicker(status: STimePickerStatus.warning),
              STimeRangePicker(status: STimePickerStatus.error),
              STimeRangePicker(status: STimePickerStatus.warning),
            ]),
            const SizedBox(height: 32),

            _header(l10n.timePickerDescSuffixPrefix),
            _desc(l10n.timePickerDescSuffixPrefix),
            Wrap(spacing: 12, runSpacing: 12, children: [
              STimePicker(
                suffixIcon: const Icon(Icons.sentiment_satisfied_alt, size: 16, color: Colors.amber),
                defaultValue: const TimeOfDay(hour: 0, minute: 0),
                onChange: (t) => _snack(ctx, l10n.timePickerMsgTime(t?.format(context) ?? '')),
              ),
              const STimePicker(
                prefix: Icon(Icons.sentiment_satisfied_alt, size: 14, color: Colors.amber),
              ),
              const STimeRangePicker(
                prefix: Icon(Icons.sentiment_satisfied_alt, size: 14, color: Colors.amber),
              ),
            ]),
            const SizedBox(height: 32),

            _header(l10n.timePickerHeaderVariants),
            _desc(l10n.timePickerDescVariants),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(spacing: 8, runSpacing: 8, children: [
                  STimePicker(placeholder: l10n.timePickerLabelOutlined),
                  STimeRangePicker(placeholder: (
                    l10n.timePickerLabelOutlinedStart,
                    l10n.timePickerLabelOutlinedEnd
                  )),
                ]),
                const SizedBox(height: 8),
                Wrap(spacing: 8, runSpacing: 8, children: [
                  STimePicker(variant: STimePickerVariant.filled, placeholder: l10n.timePickerLabelFilled),
                  STimeRangePicker(variant: STimePickerVariant.filled, placeholder: (
                    l10n.timePickerLabelFilledStart,
                    l10n.timePickerLabelFilledEnd
                  )),
                ]),
                const SizedBox(height: 8),
                Wrap(spacing: 8, runSpacing: 8, children: [
                  STimePicker(variant: STimePickerVariant.borderless, placeholder: l10n.timePickerLabelBorderless),
                  STimeRangePicker(variant: STimePickerVariant.borderless, placeholder: (
                    l10n.timePickerLabelBorderlessStart,
                    l10n.timePickerLabelBorderlessEnd
                  )),
                ]),
                const SizedBox(height: 8),
                Wrap(spacing: 8, runSpacing: 8, children: [
                  STimePicker(variant: STimePickerVariant.underlined, placeholder: l10n.timePickerLabelUnderlined),
                  STimeRangePicker(variant: STimePickerVariant.underlined, placeholder: (
                    l10n.timePickerLabelUnderlinedStart,
                    l10n.timePickerLabelUnderlinedEnd
                  )),
                ]),
              ],
            ),
            const SizedBox(height: 32),

            _header(l10n.timePickerHeaderControlled),
            _desc(l10n.timePickerDescControlled),
            Wrap(spacing: 12, runSpacing: 8, children: [
              STimePicker(
                value: _controlledTime,
                onChange: (t) => setState(() => _controlledTime = t),
              ),
              Chip(
                label: Text(l10n.timePickerLabelState(_controlledTime?.format(context) ?? 'null')),
              ),
            ]),
            const SizedBox(height: 32),

            _header(l10n.timePickerHeaderNeedConfirm),
            _desc(l10n.timePickerDescNeedConfirm),
            STimePicker(
              needConfirm: true,
              onChange: (t) => _snack(ctx, l10n.timePickerMsgConfirmed(t?.format(context) ?? '')),
            ),
            const SizedBox(height: 32),

            _header(l10n.timePickerHeaderChangeOnScroll),
            _desc(l10n.timePickerDescChangeOnScroll),
            STimePicker(
              changeOnScroll: true,
              onChange: (t) => _snack(ctx, l10n.timePickerMsgScroll(t?.format(context) ?? '')),
            ),
            const SizedBox(height: 32),

            _header(l10n.timePickerHeaderShowNowFalse),
            _desc(l10n.timePickerDescShowNowFalse),
            STimePicker(
              showNow: false,
              onChange: (t) => _snack(ctx, l10n.timePickerMsgTime(t?.format(context) ?? '')),
            ),
            const SizedBox(height: 32),

            _header(l10n.timePickerHeaderRange),
            _desc(l10n.timePickerDescRange),
            STimeRangePicker(
              defaultValue: (
                const TimeOfDay(hour: 12, minute: 8),
                const TimeOfDay(hour: 14, minute: 30),
              ),
              onRangeChange: (s, e) => _snack(ctx, l10n.timePickerMsgRange(s?.format(context) ?? '', e?.format(context) ?? '')),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  void _snack(BuildContext ctx, String msg) {
    SSonner.show(
      message: msg,
      replace: true,
      duration: const Duration(seconds: 1),
    );
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
