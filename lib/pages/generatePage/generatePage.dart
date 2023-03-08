import 'package:_04_health_check/class/const.dart';
import 'package:_04_health_check/widgets/cbAppBar/cbAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class GeneratePage extends StatefulWidget {
  const GeneratePage({super.key});

  @override
  State<GeneratePage> createState() => _GeneratePageState();
}

class _GeneratePageState extends State<GeneratePage> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CBAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 3),
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Show Record:",
                        style: Theme.of(context).textTheme.bodyMedium),
                    SizedBox(
                      width: 20,
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      style: Theme.of(context).textTheme.bodyLarge,
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: TextButton(
              child: Text("Submit"),
              onPressed: () => _formKey.currentState?.save(),
            ),
          ),
        ],
      ),
    );
  }
}
