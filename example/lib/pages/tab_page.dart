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
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle login logic here
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    ),
    TabItem(
      label: 'SignUp',
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle sign-up logic here
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SScaffold(
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
        })

    );
  }
}
