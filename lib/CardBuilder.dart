import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardBuilder extends StatelessWidget {
  final String? imagePath;
  final String? name;
  final String? address;
  final String? category;
  final double? width;

  const CardBuilder(
      {super.key, this.imagePath, this.name, this.address, this.category, this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        // color: Colors.amber,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(1, 1),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0)),
              child: Image.asset(
                imagePath!,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 17),
                  ),
                  Text(
                    address!,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    category!,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}