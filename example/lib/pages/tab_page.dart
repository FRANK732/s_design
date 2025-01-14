import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabs Example'),
      ),
      body:Tabs(
        initialIndex: 0,
        child: Column(
          children: [
            TabsList(
              children: [
                TabsTrigger(label: "Account", index: 0),
                TabsTrigger(label: "Password", index: 1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
