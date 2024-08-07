
import 'package:flutter/material.dart';

/// Flutter code sample for [DropdownMenu].

class DropdownMenuu extends StatefulWidget {
  const DropdownMenuu({super.key});

  @override
  State<DropdownMenuu> createState() => _DropdownMenuuState();
}

class _DropdownMenuuState extends State<DropdownMenuu> {
  List<String> list = <String>['personal', 'work', 'college', 'home'];
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      label: const Text('Select'),
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          list.first = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
