import 'package:flutter/material.dart';
import '../../../../../../s_design.dart';

class SStep
    extends StatelessWidget {
  const SStep({
    super.key,
    required this.item,
    required this.index,
    required this.status,
    required this.isActive,
    required this.isLast,
    required this.size,
    required this.direction,
    required this.labelPlacement,
    this.scrollable =
        false,
    this.onTap,
    this.customIcon,
  });

  final SStepItem
      item;
  final int
      index;
  final SStepStatus
      status;
  final bool
      isActive;
  final bool
      isLast;
  final SStepsSize
      size;
  final Axis
      direction;
  final SStepsLabelPlacement
      labelPlacement;
  final bool
      scrollable;
  final VoidCallback?
      onTap;
  final Widget?
      customIcon;

  @override
  Widget build(
      BuildContext
          context) {
    final SThemeData sTheme =
        STheme.of(context);
    final bool isHorizontal =
        direction == Axis.horizontal;
    // final isVertical = direction == Axis.vertical; // Unused
    final bool isLabelHorizontal =
        labelPlacement == SStepsLabelPlacement.horizontal;

    // Determine effective status color
    final Color iconColor =
        SStepsStyleHelper.getIconColor(
      status:
          status,
      theme:
          sTheme,
      isCustomIcon:
          item.icon != null || customIcon != null,
    );
    final Color titleColor =
        SStepsStyleHelper.getTitleColor(
      status:
          status,
      theme:
          sTheme,
    );
    final Color descriptionColor = SStepsStyleHelper.getDescriptionColor(
        status: status,
        theme: sTheme);

    Widget
        iconWidget;
    if (item.icon !=
        null) {
      iconWidget =
          IconTheme(
        data: IconThemeData(
          color: iconColor,
          size: SStepsStyleHelper.getIconSize(size),
        ),
        child: item.icon!,
      );
    } else if (status ==
        SStepStatus
            .finish) {
      iconWidget = Icon(Icons.check,
          color: iconColor,
          size: SStepsStyleHelper.getIconFontSize(size));
    } else if (status ==
        SStepStatus.error) {
      iconWidget = Icon(Icons.close,
          color: iconColor,
          size: SStepsStyleHelper.getIconFontSize(size));
    } else {
      // Create a circle with number
      iconWidget =
          Text(
        '${index + 1}',
        style: TextStyle(
          color: status == SStepStatus.process ? sTheme.colorToken.surface : sTheme.colorToken.textSecondary,
          fontSize: SStepsStyleHelper.getIconFontSize(size),
          fontWeight: FontWeight.w500,
        ),
      );
    }

    // Wrap icon in container for borders/backgrounds
    final Container iconContainer =
        Container(
      width:
          SStepsStyleHelper.getIconSize(size),
      height:
          SStepsStyleHelper.getIconSize(size),
      alignment:
          Alignment.center,
      decoration:
          BoxDecoration(
        shape: BoxShape.circle,
        color: item.icon == null && status == SStepStatus.process ? sTheme.colorToken.primary : Colors.transparent, // Process fills background
        border: item.icon == null
            ? Border.all(
                color: status == SStepStatus.process ? sTheme.colorToken.primary : (status == SStepStatus.wait ? sTheme.colorToken.divider : iconColor),
              )
            : null,
      ),
      child:
          iconWidget,
    );

    final Column content =
        Column(
      crossAxisAlignment: isLabelHorizontal
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      mainAxisSize:
          MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: SStepsStyleHelper.getTitleFontSize(size),
                  fontWeight: FontWeight.w500,
                  color: titleColor,
                  overflow: TextOverflow.ellipsis,
                ),
                child: item.title,
              ),
            ),
            if (item.subTitle != null) ...<Widget>[
              const SizedBox(width: 8),
              Flexible(
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12, // Subtitle usually smaller
                    color: sTheme.colorToken.textSecondary,
                    fontWeight: FontWeight.normal,
                    overflow: TextOverflow.ellipsis,
                  ),
                  child: item.subTitle!,
                ),
              ),
            ]
          ],
        ),
        if (item.description != null) ...<Widget>[
          const SizedBox(height: 4),
          DefaultTextStyle(
            style: TextStyle(
              fontSize: SStepsStyleHelper.getDescriptionFontSize(size),
              color: descriptionColor,
            ),
            child: item.description!,
          ),
        ]
      ],
    );

    if (isHorizontal) {
      // Horizontal Layout
      // Icon - Content - (Line)
      // OR Icon (Line)
      //    Content

      if (isLabelHorizontal) {
        // Icon - Content - Line
        final Widget cell = Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap: item.disabled ? null : onTap,
              borderRadius: BorderRadius.circular(SStepsStyleHelper.getIconSize(size)),
              child: iconContainer,
            ),
            const SizedBox(width: 8),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Flexible(
                      flex: 3,
                      child: content,
                    ), // Title & Subtitle row
                    if (!isLast) ...<Widget>[
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: status == SStepStatus.finish ? sTheme.colorToken.primary : sTheme.colorToken.divider,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ]
                  ],
                ),
                // Description sits below title, but doesn't affect line vertically in horizontal-label mode?
                // Actually covering description here.
              ],
            ))
          ],
        );

        if (scrollable) {
          return SizedBox(
            width: isLast ? null : 250.0, // Fixed width block to allow scrolling
            child: cell,
          );
        } else {
          return Expanded(child: cell);
        }
      } else {
        // Icon - Line
        // Content (Centered below icon)
        // This typically requires a different approach where the top row is [Icon --Line-- Icon]
        // and bottom row is [Content       Content]
        // But implementing as discrete items:
        // Column [ Row(Icon - Line), Content ]

        final Widget cell = Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                // Line (Left) if needed? No, typical flow is Icon -> Line
                // To center icon, we might need Line -- Icon -- Line logic?
                // SSimple way:
                // Icon -- Line
                // But for first/last items spacing is different.
                // Let's stick to standard flow:
                // Center the icon relative to content?
                // Actually, Vertical Label:
                // [Icon]---------------[Icon]
                // Title                 Title
                // Desc                  Desc

                Expanded(
                  child: !isLast ? Container(height: 1, color: Colors.transparent) : const SizedBox(),
                  // Simplification: Placing Icon at start, Line extends to next.
                ),
                InkWell(onTap: item.disabled ? null : onTap, child: iconContainer),
                Expanded(
                  flex: 10,
                  child: !isLast ? Container(height: 1, margin: const EdgeInsets.symmetric(horizontal: 10), color: status == SStepStatus.finish ? sTheme.colorToken.primary : sTheme.colorToken.divider) : const SizedBox(),
                ),
              ],
            ),
            const SizedBox(height: 8),
            content,
          ],
        );

        if (scrollable) {
          return SizedBox(
            width: isLast ? 100.0 : 250.0,
            child: cell,
          );
        } else {
          return Expanded(child: cell);
        }
      }
    } else {
      // Vertical Layout
      // Column
      //  Row [ Icon, Content ]
      //  Row [ Line (below icon), Description (potentially) ]

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              InkWell(onTap: item.disabled ? null : onTap, child: iconContainer),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 1,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    color: status == SStepStatus.finish ? sTheme.colorToken.primary : sTheme.colorToken.divider,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 24.0), // Spacing for next step
              child: content,
            ),
          ),
        ],
      );
    }
  }
}
