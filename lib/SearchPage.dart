import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'CardBuilder.dart';
import './food.dart';

class SearchPage extends StatefulWidget {
  final String title;
  const SearchPage({super.key, required this.title});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

// final List<String> imagePaths = [
//   'assets/food1.jpg',
//   'assets/food2.jpg',
//   'assets/food3.jpg',
//   'assets/food4.jpg',
// ];

late List<Widget> _cardPopular;

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();

    _cardPopular = List.generate(
        listFood.length,
        (index) => CardBuilder(
              imagePath: listFood[index].imagePath,
              name: listFood[index].name,
              address: listFood[index].address,
              category: listFood[index].category,
              // width: MediaQuery.of(context).size.width,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      // jika ingin menggunakan grid
      // body: CustomScrollView(
      //   slivers: [
      //     SliverGrid(
      //         delegate: SliverChildBuilderDelegate((context, index) {
      //           return _cardPopular[index];
      //         }, childCount: _cardPopular.length),
      //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //             childAspectRatio: 0.8, crossAxisCount: 2))
      //   ],
      // ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listFood.length,
          itemBuilder: (context, index) {
            return _cardPopular[index];
          }),
    );
  }
}
