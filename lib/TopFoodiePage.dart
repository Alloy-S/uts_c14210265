import 'package:flutter/material.dart';

class TopFoodiePage extends StatefulWidget {
  const TopFoodiePage({super.key});

  @override
  State<TopFoodiePage> createState() => _TopFoodiePageState();
}

class _TopFoodiePageState extends State<TopFoodiePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Top Foodie',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.green[100],
      ),
    );
  }
}