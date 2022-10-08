import 'package:flutter/material.dart';
import 'package:shrine/hotel.dart';
import 'model/product.dart';
import 'model/products_repository.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

// final saved = <Hotel>[];

class DetailPage extends StatelessWidget {
  final Hotel hotel;
  final List saved;
  const DetailPage({Key? key, required this.hotel, required this.saved})
      : super(key: key);
  // final Product product;

  @override
  Widget build(BuildContext context) {
    // final Hotel hotel;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Detail')),
      ),
      body: ListView(
        children: [detailViewContent(hotel, saved)],
      ),
    );
  }
}

Stack detailViewContent(hotel, saved) {
  return Stack(
    alignment: Alignment.topRight,
    children: [
      detailView(hotel: hotel),
      Positioned(
        top: 20,
        right: 10,
        child: Container(
          child: favoriteBTN(
            hotel: hotel,
            saved: saved,
          ),
        ),
      ),
    ],
  );
}

class favoriteBTN extends StatefulWidget {
  const favoriteBTN({Key? key, required this.hotel, required this.saved})
      : super(key: key);
  final Hotel hotel;
  final List saved;
  @override
  State<favoriteBTN> createState() => _favoriteBTNState();
}

class _favoriteBTNState extends State<favoriteBTN> {
  @override
  Widget build(BuildContext context) {
    final hotel = widget.hotel;
    final saved = widget.saved;
    final alreadySaved = saved.contains(hotel);
    return IconButton(
        onPressed: () {
          print('Press button');
          setState(() {
            if (alreadySaved) {
              saved.remove(hotel);
            } else {
              saved.add(hotel);
            }
          });
        },
        icon: Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
          semanticLabel: alreadySaved ? 'Remove from saved' : 'save',
        ));
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
