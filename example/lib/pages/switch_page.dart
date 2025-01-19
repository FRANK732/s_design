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

  @override
  Widget build(BuildContext context) {

    return SScaffold(
      appBar: AppBar(
        title: const Text('SSwitch Showcase'),
      ),
      renderBody:((context){
        return  Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Filled Variant
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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

                  const Text('Filled Variant'),
                ],
              ),
              const SizedBox(height: 20),

              // Outlined Variant
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SSwitch(
                    value: _outlinedSwitch,
                    onChanged: (value) {
                      setState(() {
                        _outlinedSwitch = value;
                      });
                    },
                    variant: SSwitchVariant.outlined,
                    semanticLabel: 'Outlined Switch',
                  ),
                  const Text('Outlined Variant'),
                ],
              ),
              // Ghost Variant
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                  const Text('Ghost Variant'),
                ],
              ),

            ],
          ),
        );
      }),

    );
  }
}
