

import 'package:flutter/material.dart';
import 'package:mir/core/constants/colors.dart';

class TestingTwo extends StatefulWidget {
  const TestingTwo({super.key});

  @override
  State<TestingTwo> createState() => _TestingTwoState();
}

class _TestingTwoState extends State<TestingTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.secondary)
    );
  }
}