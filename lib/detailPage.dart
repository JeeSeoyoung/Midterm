import 'package:flutter/material.dart';
import 'model/product.dart';
import 'model/products_repository.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.id, required this.product})
      : super(key: key);
  final int id;
  final Product product;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // List<Product> products = ProductsRepository.loadProducts(Category.all);

  get product => product;

  @override
  Widget build(BuildContext context) {
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
            Text(product.name)
          ],
        ),
      ),
    );
  }
}
