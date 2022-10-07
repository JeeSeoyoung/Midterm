// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shrine/detailPage.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/product.dart';
import 'model/products_repository.dart';

bool isListView = true;
final Uri _url = Uri.parse('https://www.handong.edu/');
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    int gridRow = isLandscape ? 3 : 2;
    return Scaffold(
      // TODO: Add app bar (102)
      appBar: AppBar(
        title: Center(child: const Text('Main')),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/Search');
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.language,
              semanticLabel: 'homepage',
            ),
            onPressed: _launchUrl,
          ),
        ],
      ),
      // TODO: Add a grid view (102)
      body: Column(
        children: <Widget>[
          Expanded(
            child: listBody(),
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const DrawerHeader(
              padding: EdgeInsets.fromLTRB(30.0, 110.0, 0.0, 0.0),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Pages',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            DrawerMenu()
          ],
        ),
      ),

      resizeToAvoidBottomInset: false,
    );
  }
}

enum ViewType { grid, list }

class listBody extends StatefulWidget {
  const listBody({Key? key}) : super(key: key);

  @override
  State<listBody> createState() => _listBodyState();
}

class _listBodyState extends State<listBody> {
  int _crossAxisCount = 1;
  double _aspectRatio = 1.5;
  ViewType _viewType = ViewType.list;
  List<bool> _selections = [true, false];
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((Product product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: isListView
            ? ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                leading: Image.asset(
                  product.assetName,
                  package: product.assetPackage,
                ),
                title: card(context, product),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 20 / 11,
                    child: Image.asset(
                      product.assetName,
                      package: product.assetPackage,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  card(context, product),
                ],
              ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      final isLandscape = orientation;
      int gridRow = (isLandscape == Orientation.landscape) ? 3 : 2;

      // print(orientation);
      return ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 16.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ToggleButtons(
                  borderRadius: BorderRadius.circular(5),
                  children: [
                    Icon(Icons.list),
                    Icon(Icons.grid_view_outlined),
                  ],
                  isSelected: _selections,
                  onPressed: (int index) {
                    setState(() {
                      if (index == 0) {
                        _selections = [true, false];
                        _viewType = ViewType.list;
                        _crossAxisCount = 1;
                        isListView = true;
                      } else {
                        _selections = [false, true];
                        _viewType = ViewType.grid;
                        isListView = false;
                        // _crossAxisCount = gridRow;
                      }
                    });
                  },
                )
              ],
            ),
          ),
          (_viewType == ViewType.list)
              ? GridView.count(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  crossAxisCount: _crossAxisCount,
                  padding: const EdgeInsets.all(16.0),
                  childAspectRatio: 10.0 / 3.5,
                  children: _buildGridCards(context),
                )
              : GridView.count(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  crossAxisCount: gridRow,
                  padding: const EdgeInsets.all(16.0),
                  childAspectRatio: 8.0 / 9.0,
                  children: _buildGridCards(context),
                )
        ],
      );
    });
  }
}

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0),
      child: Column(
        children: [
          _buildMenu(Icons.home, 'Home', context),
          _buildMenu(Icons.search, 'Search', context),
          _buildMenu(Icons.location_city, 'Favorite Hotel', context),
          _buildMenu(Icons.person, 'My Page', context),
          _buildMenu(Icons.logout, 'Log Out', context),
        ],
      ),
    );
  }
}

ListTile _buildMenu(IconData icon, String label, BuildContext context) {
  return ListTile(
    leading: Icon(icon, color: Colors.blue),
    title: Text(label),
    onTap: () {
      if (label == 'Home') {
        Navigator.pop(context);
      } else {
        if (label == 'Search')
          Navigator.pushNamed(context, '/Search');
        else if (label == 'Favorite Hotel') {
          Navigator.pushNamed(context, '/Search');
        } else if (label == 'My Page') {
          Navigator.pushNamed(context, '/Search');
        } else if (label == 'Log Out') {
          Navigator.pushNamed(context, '/login');
        }
      }
      // Navigator.pop(context);
    },
  );
}

Stack card(context, product) {
  return Stack(
    alignment: AlignmentDirectional.bottomEnd,
    children: <Widget>[
      Container(
        padding: const EdgeInsets.fromLTRB(9.0, 10.0, 10.0, 20.0),
        child: contentRow(product),
      ),
      Positioned(
        top: isListView ? 60 : 60,
        child: Container(
          child: TextButton(
            onPressed: () {
              print(product.id);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(
                            id: product.id,
                            product: product,
                          )));
              // Navigator.pushNamed(context, '/detailPage');
            },
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
            ),
            child: const Text(
              'more',
              style: TextStyle(fontSize: 12.0, color: Colors.lightBlueAccent),
            ),
          ),
        ),
      )
    ],
  );
}

Row contentRow(product) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding: EdgeInsets.only(right: 4.0),
        child: isListView
            ? const SizedBox()
            : const Icon(
                Icons.location_pin,
                color: Colors.lightBlueAccent,
              ),
      ),
      Expanded(
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
                  size: 15.0,
                ),
                Icon(
                  Icons.star_rounded,
                  color: Colors.yellow,
                  size: 15.0,
                ),
                Icon(
                  Icons.star_rounded,
                  color: Colors.yellow,
                  size: 15.0,
                ),
              ],
            ),
            Text(
              product.name,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14.0),
              maxLines: 1,
            ),
            const SizedBox(height: 5.0),
            Text(
              product.address,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 9.0,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
