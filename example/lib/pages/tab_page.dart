import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final List<TabItem> _tabs = [
    TabItem(
      label: 'Login',
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical:  8.0),
            child: SInputField(
              hintText: 'Username',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:  8.0),
            child: SInputField.password(
              hintText: 'Password',
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical:  8.0),
            child: SButton(
              width: double.infinity,
              onPressed: () {
              },
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    ),
    TabItem(
      label: 'SignUp',
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical:  8.0),
            child: SInputField(
              hintText: 'Username',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:  8.0),
            child: SInputField.password(
              hintText: 'Password',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:  8.0),
            child: SInputField.password(
              hintText: 'Confirm Password',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:  8.0),
            child: SButton(
              width: double.infinity,
              onPressed: () {
              },
              child: const Text('Sign Up'),
            ),
          ),
        ],
      ),
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return SScaffold(
      // centerBody: true,
        scrollable: true,
        appBar: AppBar(
          title: const Text('Tabs Showcase'),
        ),
        renderBody: ((context) {
          return  Tabs(
            tabs: _tabs,
            initialIndex: 0,
            animationType: STabAnimationType.fade,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            orientation: STabOrientation.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            onTabChanged: (index) {
              // Optional: Handle tab change events
              print('Active Tab: $index');
            },
          );
        }),

    );
  }
}
