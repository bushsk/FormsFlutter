import 'package:flutter/material.dart';

class FormsDemo extends StatefulWidget {
  const FormsDemo({Key? key}) : super(key: key);

  @override
  _FormsDemoState createState() => _FormsDemoState();
}

enum Gender { male, female, others }

class _FormsDemoState extends State<FormsDemo> {
  final _formKey = GlobalKey<FormState>();
  Gender? _character = Gender.others;

  Map<String, bool?> hobbies = {
    'Dancing': false,
    'Singing': false,
    'Reading': false,
    'Painting': false,
  };

  bool valuefirst = false;
  bool valuesecond = false;

  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(
    fontSize: 20,
  ));

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Enter your name',
                labelText: 'Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.phone),
                hintText: 'Enter a phone number',
                labelText: 'Phone',
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 10) {
                  return 'Please enter valid phone number';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today),
                hintText: 'Enter your Date of Birth',
                labelText: 'DOB',
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 10) {
                  return 'Please enter valid phone number';
                }
                return null;
              },
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: const Text(
                'Gender: ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black54),
              ),
            ),
            Column(
              children: <Widget>[
                ListTile(
                  title: const Text('Male'),
                  leading: Radio<Gender>(
                    value: Gender.male,
                    groupValue: _character,
                    onChanged: (Gender? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Female'),
                  leading: Radio<Gender>(
                    value: Gender.female,
                    groupValue: _character,
                    onChanged: (Gender? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Others'),
                  leading: Radio<Gender>(
                    value: Gender.others,
                    groupValue: _character,
                    onChanged: (Gender? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: const Text(
                'Hobies: ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black54),
              ),
            ),
            Column(
              children: hobbies.keys
                  .map(
                    (roomName) => CheckboxListTile(
                      title: Text(roomName),
                      value: hobbies[roomName],
                      onChanged: (bool? value) {
                        setState(() {
                          hobbies[roomName] = value;
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: style,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
