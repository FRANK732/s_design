import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import '../widgets/component_page.dart';

class AppStateDemoPage extends StatelessWidget {
  const AppStateDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentPage(
      name: 'SAppState',
      description:
          '''
Communicates empty, error, and maintenance states to users through rich custom illustrations, animated entrance effects, and full theme integration
      SAppState replaces ad-hoc empty-state widgets with a single, consistent component.

✅ Benefits
• 7 named constructors for the most common app states — noData, emptyNotification, noCalendar, failedServer, addNotes, arrowPointer, underConstruction — plus a custom slot for your own widget.
• Built-in entrance animation (fade + slide) via AnimationController. Disable with animate: false.
• Fully theme-driven via SAppStateThemeData — illustration color, size, title/description styles, padding, and axis alignments are all configurable globally or with a local STheme override.
• Action slot — pass any list of buttons (Retry, Go Back, etc.) and they're rendered in a responsive centered Wrap.

⚠️ Trade-offs
• Illustrations are CustomPainter-based (zero external deps). Complex scenes are hard to update when designs change.
• No SVG filter effects (blur, drop-shadow, gradients) — only solid fills and strokes from the source paths are reproduced.
• Variant transitions are not path-morphed — only the entrance animation is built in.''',
      sections: [
        const ComponentSection(
          title: 'Default (No Data)',
          description: 'Used when there is no content to display.',
          demo: SAppState(
            title: 'No Data Found',
            description: "We couldn't find any records matching your search.",
          ),
          code: '''
const SAppState(
  title: 'No Data Found',
  description: "We couldn't find any records matching your search.",
)''',
        ),
        ComponentSection(
          title: 'Under Construction',
          description: 'Used when the server is unreachable or a page is under active construction.',
          demo: SAppState.underConstruction(
            title: 'System Under Construction',
            description: 'This page is currently being built. Check back soon.',
            actions: [
              SButton(
                onPressed: () {},
                child: const Text('Retry'),
              ),
            ],
          ),
          code: '''
SAppState.underConstruction(
  title: 'System Maintenance',
  description: 'The server is currently undergoing maintenance. Please try again later.',
  actions: [
    SButton(
      onPressed: () {},
      child: const Text('Retry Connection'),
    ),
  ],
)''',
        ),
        const ComponentSection(
          title: 'Empty Notification',
          description: 'Used when there are no new notifications.',
          demo: SAppState.emptyNotification(
            title: 'All Caught Up!',
            description: 'You have no new notifications at this time.',
          ),
          code: '''
const SAppState.emptyNotification(
  title: 'All Caught Up!',
  description: 'You have no new notifications at this time.',
)''',
        ),
        const ComponentSection(
          title: 'No Calendar',
          description: 'Used when there are no events scheduled.',
          demo: SAppState.noCalendar(
            title: 'Clear Schedule',
            description: 'There are no events scheduled for today.',
          ),
          code: '''
const SAppState.noCalendar(
  title: 'Clear Schedule',
  description: 'There are no events scheduled for today.',
)''',
        ),
        ComponentSection(
          title: 'Customization via Theme',
          description: 'Demonstrating how the component respects the global theme.',
          demo: STheme(
            data: STheme.of(context).copyWith(
              appStateTheme: STheme.of(context).appStateTheme.copyWith(
                illustrationColor: Colors.orange,
                titleStyle: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.deepOrange,
                ),
              ),
            ),
            child: const SAppState.failedServer(
              title: 'Custom Themed Error',
              description: 'This illustration color and title style are driven by the local STheme override.',
            ),
          ),
          code: '''
STheme(
  data: STheme.of(context).copyWith(
    appStateTheme: STheme.of(context).appStateTheme.copyWith(
      illustrationColor: Colors.orange,
      titleStyle: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w900,
        color: Colors.deepOrange,
      ),
    ),
  ),
  child: const SAppState.failedServer(
    title: 'Custom Themed Error',
    description: 'This illustration color and title style are driven by the local STheme override.',
  ),
)''',
        ),
      ],
    );
  }
}
