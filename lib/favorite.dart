import 'package:flutter/material.dart';
import 'package:shrine/home.dart';

import 'detailPage.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key, required this.saved}) : super(key: key);
  final List saved;
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final saved = widget.saved;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Favorite Hotels')),
      ),
      body: ListView.builder(
          itemCount: saved.length,
          itemBuilder: (BuildContext context, int index) {
            String _name = saved[index].name;
            return Dismissible(
                key: Key(saved[index].name),
                onDismissed: (direction) {
                  setState(() {
                    saved.removeAt(index);
                  });
                },
                child: Column(
                  children: [
                    ListTile(
                      title: Text(_name),
                    ),
                    Divider(
                      height: 5.0,
                      thickness: 1,
                    )
                  ],
                ));
          }),
    );
  }
}
