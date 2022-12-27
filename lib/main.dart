import 'package:flutter/material.dart'
    hide ValueNotifier, ValueListenableBuilder;

import '/value_listenable_builder.dart';
import '/value_listenable.dart';

void main() {
  ValueNotifier<int> valueNotifier = ValueNotifier(0);
  valueNotifier.value = 1;

  runApp(MaterialApp(
    home: Scaffold(
      body: Column(
        children: [
          ValueListenableBuilder<int>(
              valueListenable: valueNotifier,
              builder: (context) {
                return valueNotifier.value == 10
                    ? const Text('finished')
                    : ValueListenableBuilder<int>(
                        valueListenable: valueNotifier,
                        builder: (BuildContext context) =>
                            Text(valueNotifier.value.toString()),
                      );
              }),
          TextButton(
            onPressed: () {
              valueNotifier.value = valueNotifier.value + 1;
            },
            child: const Text('+'),
          ),
        ],
      ),
    ),
  ));
}
