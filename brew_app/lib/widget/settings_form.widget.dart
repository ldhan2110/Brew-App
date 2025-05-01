import 'package:flutter/material.dart';

class SettingFormWidget extends StatefulWidget {
  const SettingFormWidget({super.key});

  @override
  State<SettingFormWidget> createState() => _SettingFormWidgetState();
}

class _SettingFormWidgetState extends State<SettingFormWidget> {
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  final _settingFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  String _sugarValue = '0';
  double _strengthValue = 100;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _settingFormKey,
      child: Column(
        children: [
          Text(
            'Update your brew settings',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.brown[400],
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
            controller: emailController,
            validator: (val) => val!.isEmpty ? 'Enter a name' : null,
          ),
          SizedBox(height: 20.0),

          DropdownButtonFormField(
            value: _sugarValue,
            validator: (value) => value == null ? 'Select a sugar value' : null,
            items:
                sugars.map((sugar) {
                  return DropdownMenuItem(
                    value: sugar,
                    child: Text('$sugar sugars'),
                  );
                }).toList(),
            onChanged: (val) {
              setState(() {
                _sugarValue = val.toString();
              });
            },
            decoration: InputDecoration(
              labelText: 'Sugars',
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 20.0),

          Slider(
            value: _strengthValue,
            min: 100,
            max: 900,
            divisions: 8,
            label: 'Strength: ${_strengthValue.round()}',
            onChanged: (val) {
              setState(() {
                _strengthValue = val;
              });
            },
          ),

          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown[300],
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
            ),
            child: const Text('Update', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
