import 'package:flutter/material.dart';
import 'package:tlc_nyc/constant/color_constant.dart';

class TestResultScreen extends StatelessWidget {
  final int testNumber;
  const TestResultScreen(this.testNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Test $testNumber',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: primary,
      ),
    );
  }
}
