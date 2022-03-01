import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const apptitle = 'Form Validation';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      title: apptitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(apptitle),
        ),
        body: const MyCustomForm(
          title: 'Form Validation',
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  bool _value = false;
  int value1 = 1;
  int value2 = 2;
  int value3 = 3;
  int val = -1;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
              decoration: const InputDecoration(
                // border: UnderlineInputBorder(),
                icon: Icon(Icons.person),
                hintText: 'Enter your name',
                labelText: 'Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              }),
          TextFormField(
              decoration: const InputDecoration(
                // border: UnderlineInputBorder(),
                icon: Icon(Icons.phone),
                hintText: 'Enter your phone number',
                labelText: 'Phone',
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 10) {
                  return 'Please enter your phone number';
                }
                return null;
              }),
          TextFormField(
              decoration: const InputDecoration(
                // border: UnderlineInputBorder(),
                icon: Icon(Icons.calendar_today),
                hintText: 'Enter your date of birth',
                labelText: 'Dob',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your date of birth';
                }
                return null;
              }),
          Column(
            children: <Widget>[
              Container(
                child: ListTile(
                  title: const Text('IT'),
                  leading: Radio(
                    value: 1,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = value1;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                ),
              ),
              Container(
                child: ListTile(
                  title: const Text('CE'),
                  leading: Radio(
                    value: 2,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = value2;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                ),
              ),
              Container(
                child: ListTile(
                  title: const Text('EXTC'),
                  leading: Radio(
                    value: 3,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = value3;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                ),
              ),
              Container(
                child: ListTile(
                  title: const Text('Other'),
                  leading: Radio(
                    value: 3,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = value3;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                ),
              )
            ],
          ),
          Container(
              child: Padding(
            padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
            child: Row(
              children: <Widget>[
                Text(
                  'Are all the fields filled?',
                  style: TextStyle(fontSize: 17.0),
                ),
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  value: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value!;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          )),
          Container(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (val < 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Select the Branch')),
                        );
                      } else if (!_value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Tick the checkbox')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Form Submitted')),
                        );
                      }
                    }
                  },
                  child: const Text('Submit'),
                ),
              ))
        ],
      ),
    );
  }
}
