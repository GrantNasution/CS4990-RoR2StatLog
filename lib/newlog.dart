import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'log.dart';

class NewLogPage extends StatefulWidget {
  NewLogPage({Key key, this.title, this.isnewLog = false, this.newLog})
      : super(key: key);
  final String title;
  bool isnewLog;
  Log newLog;

  @override
  NewLogPageState createState() => NewLogPageState();

  bool get isNewLog => isnewLog;
  Log get getnewLog => newLog;

  void setFalse() {
    isnewLog = false;
  }
}

class NewLogPageState extends State<NewLogPage> {
  final textFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _classes = [
    "Commando",
    "Huntress",
    "MUL-T",
    "Engineer",
    "Artificer",
    "Mercenary",
    "Rex",
    "Loader",
    "Acrid",
  ];
  Log newLog = new Log.empty();
  var _currentSelectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Add New Log',
          style: TextStyle(color: Color(0xffddf2f4)),
        )),
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      errorStyle:TextStyle(color: Colors.redAccent, fontSize: 16.0),
                      labelStyle: TextStyle(color: Color(0xffffcc00)),
                      labelText: 'Class',
                      hintText: 'Class',
                    ),
                    isEmpty: _currentSelectedValue == '',
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _currentSelectedValue,
                        isDense: true,
                        onChanged: (String newValue) {
                          setState(() {
                            _currentSelectedValue = newValue;
                            newLog.lclass = newValue;
                            //newLog.lclass = newValue;
                            // state.didChange(newValue);
                          });
                        },
                        items: _classes.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
              TextFormField(
                style: TextStyle(color: Color(0xffddf2f4)),
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: Color(0xffffcc00)),
                  hintStyle: TextStyle(color: Color(0xffddf2f4)),
                  labelText: 'Klls',
                  hintText: 'Number of kills',
                ),
                onSaved: (value) {
                  newLog.sKills = int.parse(value);
                },
              ),
              TextFormField(
                style: TextStyle(color: Color(0xffddf2f4)),
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: Color(0xffffcc00)),
                  hintStyle: TextStyle(color: Color(0xffddf2f4)),
                  labelText: 'Minion Kills',
                  hintText: 'Number of minion kills',
                ),
                onSaved: (value) {
                  newLog.sminionKills = int.parse(value);
                },
              ),
              TextFormField(
                style: TextStyle(color: Color(0xffddf2f4)),
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: Color(0xffffcc00)),
                  hintStyle: TextStyle(color: Color(0xffddf2f4)),
                  labelText: 'Deaths',
                  hintText: 'Number of deaths',
                ),
                onSaved: (value) {
                  newLog.sDeaths = int.parse(value);
                },
              ),
              TextFormField(
                style: TextStyle(color: Color(0xffddf2f4)),
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: Color(0xffffcc00)),
                  hintStyle: TextStyle(color: Color(0xffddf2f4)),
                  labelText: 'Damage Dealt',
                  hintText: 'How much damage dealt',
                ),
                onSaved: (value) {
                  newLog.sdamageDealt = int.parse(value);
                },
              ),
              TextFormField(
                style: TextStyle(color: Color(0xffddf2f4)),
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: Color(0xffffcc00)),
                  hintStyle: TextStyle(color: Color(0xffddf2f4)),
                  labelText: 'Minion Damage Dealt',
                  hintText: 'How much minion damage dealt',
                ),
                onSaved: (value) {
                  newLog.sminionDamageDealt = int.parse(value);
                },
              ),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    widget.isnewLog = true;
                    _formKey.currentState.save();
                    widget.newLog = Log.clone(newLog);
                    newLog = Log.empty();
                    print(widget.newLog.stringify());
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'Submit',
                ),
              ),
            ],
          ),
        ));
  }
}
