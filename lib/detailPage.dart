import 'package:flutter/material.dart';
import 'package:shrine/hotel.dart';
import 'package:shrine/practice.dart';
import 'model/product.dart';
import 'model/products_repository.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
      body: ListView(
        children: [detailView(hotel: hotel)],
      ),
    );
  }
}

class detailView extends StatelessWidget {
  const detailView({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: '${hotel.imagePath}',
            child: Image.asset(
              hotel.imagePath,
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(
                  height: 10.0,
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(hotel.name,
                          textStyle:
                              TextStyle(fontSize: 24, color: Colors.blueGrey)),
                    ],
                    isRepeatingAnimation: true,
                    totalRepeatCount: 20,
                    pause: Duration(milliseconds: 1500),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.lightBlue,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Text(
                        hotel.location,
                        style:
                            TextStyle(fontSize: 12.0, color: Colors.blueGrey),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.lightBlue,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Text(
                        hotel.number,
                        style:
                            TextStyle(fontSize: 13.0, color: Colors.blueGrey),
                      ),
                    )
                  ],
                ),
                Divider(
                  height: 30.0,
                  thickness: 2,
                ),
                Text(
                  hotel.description,
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
