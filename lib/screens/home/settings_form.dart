import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  //form values
  late String _currentName;
  late String? _currentSugars = '0 sugars';
  late int _currentStrength = 100;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Update your brew settings.',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val!.isEmpty ? 'please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 20.0),
          //the dropdown
          DropdownButtonFormField<String>(
            decoration: textInputDecoration,
            //value: _currentSugars ?? '0',
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text("$sugar sugars"),
              );
            }).toList(),
            onChanged: (val) => setState(() => _currentSugars = val),
          ),
          SizedBox(height: 20.0),
          //slider
          Slider(
              value: (_currentStrength).toDouble(),
              min: 100,
              max: 900,
              divisions: 8,
              activeColor: Colors.brown[_currentStrength],
              inactiveColor: Colors.brown[_currentStrength],
              onChanged: ((val) =>
                  setState(() => _currentStrength = val.round()))),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.pink[400],
              ),
              child: Text(
                'Update',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                print(_currentName);
                print(_currentSugars);
                print(_currentStrength);
              }),
        ],
      ),
    );
  }
}
