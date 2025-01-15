import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  _SwitchPageState createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  bool _filledSwitch = false;
  bool _outlinedSwitch = true;
  bool _ghostSwitch = false;
  bool _customSwitch = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('SSwitch Showcase'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Filled Variant
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Filled Variant'),
                SSwitch(
                  value: _filledSwitch,
                  onChanged: (value) {
                    setState(() {
                      _filledSwitch = value;
                    });
                  },
                  variant: SSwitchVariant.filled,
                  semanticLabel: 'Filled Switch',
                ),
              ],
            ),
            SizedBox(height: 20),

            // Outlined Variant
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Outlined Variant'),
                SSwitch(
                  value: _outlinedSwitch,
                  onChanged: (value) {
                    setState(() {
                      _outlinedSwitch = value;
                    });
                  },
                  variant: SSwitchVariant.outlined,
                  activeColor: Colors.orange,
                  inactiveColor: Colors.blueGrey,
                  semanticLabel: 'Outlined Switch',
                ),
              ],
            ),
            SizedBox(height: 20),

            // Ghost Variant
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Ghost Variant'),
                SSwitch(
                  value: _ghostSwitch,
                  onChanged: (value) {
                    setState(() {
                      _ghostSwitch = value;
                    });
                  },
                  variant: SSwitchVariant.ghost,
                  activeColor: Colors.transparent,
                  inactiveColor: Colors.transparent,
                  thumbColor: Colors.green,
                  semanticLabel: 'Ghost Switch',
                ),
              ],
            ),
            SizedBox(height: 40),

            Divider(),

            SizedBox(height: 20),

            // Custom Designed Switch
            Text(
              'Custom Designed Switch',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SSwitch(
              value: _customSwitch,
              onChanged: (value) {
                setState(() {
                  _customSwitch = value;
                });
              },
              semanticLabel: 'Custom Switch',
            ),
          ],
        ),
      ),
    );
  }
}
