import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:diet/components/Meal.dart';

class RatioPage extends StatefulWidget {
  const RatioPage({Key? key}) : super(key: key);

  @override
  _RatioPageState createState() => _RatioPageState();
}

class _RatioPageState extends State<RatioPage> {
  final List<String> _meals = getCarbo();
  String dropdownValue = getCarbo().first;
  double quantityValue = 50;
  @override
  Widget build(BuildContext context) {
    Map<String, num> _ratio = getRatio(dropdownValue, quantityValue.toInt());
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Ratio'),
        ),
        child: Material(
          child: ListView(
            children: <Widget>[
              const ListTile(title: Text("Choose a meal")),
              Center(child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue.toString();
                  });
                },
                items: _meals.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
              ListTile(
                title: const Text("Choose quantity"),
                trailing: Text(quantityValue.toStringAsFixed(0)),
              ),
              CupertinoSlider(
                value: quantityValue,
                min: 1,
                max: 100,
                divisions: 100,
                onChanged: (double newValue) {
                  setState(() {
                    quantityValue = newValue;
                  });
                },
              ),
              Column(children: _ratio.entries.map((e) => Text(e.key + ": " + e.value.toStringAsFixed(2))).toList()),
            ]
          ),
        ));
  }
}
