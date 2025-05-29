import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final List<STabItem> _tabs = <STabItem>[
    STabItem(
      label: 'Login',
      content: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: SInputField(
              hintText: 'Username',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SInputField.password(
              hintText: 'Password',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SButton(
              width: double.infinity,
              onPressed: () {},
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    ),
    STabItem(
      label: 'SignUp',
      content: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: SInputField(
              hintText: 'Username',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SInputField.password(
              hintText: 'Password',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SInputField.password(
              hintText: 'Confirm Password',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SButton(
              width: double.infinity,
              onPressed: () {},
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
      scrollable: true,
      appBar: AppBar(
        title: const Text('Tabs Showcase'),
      ),
      renderBody: (BuildContext context) {
        return STabs(
          tabs: _tabs,
          mainAxisAlignment: MainAxisAlignment.center,
          onTabChanged: (int index) {
            dev.log('Active Tab: $index');
          },
        );
      },
    );
  }
}
