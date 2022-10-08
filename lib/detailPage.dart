import 'package:flutter/material.dart';
import 'package:shrine/hotel.dart';
import 'package:shrine/practice.dart';
import 'model/product.dart';
import 'model/products_repository.dart';

class DetailPage extends StatelessWidget {
  final Hotel hotel;
  const DetailPage({Key? key, required this.hotel}) : super(key: key);
  // final Product product;

  @override
  Widget build(BuildContext context) {
    // final Hotel hotel;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Detail')),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.star_rounded,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star_rounded,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star_rounded,
                  color: Colors.yellow,
                ),
              ],
            ),
            Text(hotel.name)
          ],
        ),
      ),
    );
  }
}
