import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';
import '../widgets/component_page.dart';

class AppStateDemoPage extends StatelessWidget {
  const AppStateDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentPage(
      name: 'SAppState',
      description: 'A component for displaying various application states (empty, error, server down, etc.) with dynamic illustrations.',
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
          description: 'Used when the server is unreachable or empty contruction state.',
          demo: SAppState.underConstruction(
            title: 'System Under Construction',
            description: 'The system is currently undergoing contruction.',
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
