import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({super.key});

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

final List<String> imagePaths = [
  'assets/food1.jpg',
  'assets/food2.jpg',
  'assets/food3.jpg',
  'assets/food4.jpg',
];


class _DiscoveryPageState extends State<DiscoveryPage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Discover',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.red[100],
      )
    );
  }
}


