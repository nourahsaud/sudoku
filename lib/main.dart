import 'package:flutter/material.dart';
import './widgents/grid.dart';

void main() {
  runApp(const sudokuApp());
}

// ignore: camel_case_types
class sudokuApp extends StatelessWidget {
  const sudokuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lets Play sudoku !'),
        ),
        body: const grid(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text('Refresh'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
