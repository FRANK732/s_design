import 'package:flutter/material.dart';
import 'package:s_design/s_design.dart';

class SSwitchDemoPage
    extends StatefulWidget {
  const SSwitchDemoPage(
      {super.key});

  @override
  State<SSwitchDemoPage>
      createState() =>
          _SSwitchDemoPageState();
}

class _SSwitchDemoPageState
    extends State<
        SSwitchDemoPage> {
  bool
      _val1 =
      true;
  bool
      _val2 =
      false;
  bool
      _val3 =
      true;
  bool
      _valIcon =
      true;
  bool
      _loading =
      false;
  bool
      _disabled =
      true;

  @override
  Widget build(
      BuildContext
          context) {
    return SScaffold(
      appBar:
          AppBar(title: const Text('SSwitch Demo')),
      renderBody:
          (context) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Basic Switch'),
              SSwitch(
                value: _val1,
                onChanged: (v) => setState(() => _val1 = v),
              ),
              const SizedBox(height: 32),
              _buildSectionTitle('Size: Small'),
              SSwitch(
                size: SSwitchSize.small,
                value: _val2,
                onChanged: (v) => setState(() => _val2 = v),
              ),
              const SizedBox(height: 32),
              _buildSectionTitle('Text & Icons'),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  SSwitch(
                    value: _val3,
                    checkedChildren: const Text('ON'),
                    unCheckedChildren: const Text('OFF'),
                    onChanged: (v) => setState(() => _val3 = v),
                  ),
                  SSwitch(
                    value: _val3,
                    checkedChildren: const Text('1'),
                    unCheckedChildren: const Text('0'),
                    onChanged: (v) => setState(() => _val3 = v),
                  ),
                  SSwitch(
                    value: _valIcon,
                    checkedChildren: const Icon(Icons.check, size: 12, color: Colors.white),
                    unCheckedChildren: const Icon(Icons.close, size: 12, color: Colors.white),
                    onChanged: (v) => setState(() => _valIcon = v),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSectionTitle('Disabled State'),
                  SButton(
                    size: SButtonSize.sm,
                    onPressed: () => setState(() => _disabled = !_disabled),
                    child: Text(_disabled ? 'Enable' : 'Disable'),
                  ),
                ],
              ),
              Wrap(
                spacing: 20,
                children: [
                  SSwitch(
                    value: true,
                    disabled: _disabled,
                    onChanged: (v) {},
                  ),
                  SSwitch(
                    value: false,
                    disabled: _disabled,
                    onChanged: (v) {},
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSectionTitle('Loading State'),
                  SButton(
                    size: SButtonSize.sm,
                    onPressed: () => setState(() => _loading = !_loading),
                    child: const Text('Toggle Loading'),
                  ),
                ],
              ),
              Wrap(
                spacing: 20,
                children: [
                  SSwitch(
                    value: true,
                    loading: _loading,
                    onChanged: (v) {},
                  ),
                  SSwitch(
                    value: false,
                    loading: _loading,
                    onChanged: (v) {},
                  ),
                  SSwitch(
                    size: SSwitchSize.small,
                    value: true,
                    loading: _loading,
                    onChanged: (v) {},
                  ),
                ],
              ),
              const SizedBox(height: 32),
              _buildSectionTitle('Custom Colors'),
              SSwitch(
                value: _val1,
                activeColor: Colors.pink,
                inactiveColor: Colors.purple.shade100,
                onChanged: (v) => setState(() => _val1 = v),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(
      String
          title) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 16),
      child:
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }
}
