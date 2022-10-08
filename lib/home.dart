import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shrine/detailPage.dart';
import 'package:shrine/favorite.dart';
import 'package:shrine/hotel.dart';
import 'package:shrine/hotelLists.dart';
import 'package:shrine/myPage.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/product.dart';
import 'model/products_repository.dart';

final saved = <Hotel>[];
bool isListView = true;
final Uri _url = Uri.parse('https://www.handong.edu/');
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

enum ViewType { grid, list }
final List hotelLists = HotelLists().hotels;
final List favorteLists = [];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> _selections = [true, false];
  // final List<Hotel> hotelLists = HotelLists().hotels;
  @override
  Widget build(BuildContext context) {
    // final isLandscape =
    //     MediaQuery.of(context).orientation == Orientation.landscape;
    // int gridRow = isLandscape ? 3 : 2;
    int _crossAxisCount = 1;
    double _aspectRatio = 1.5;
    ViewType _viewType = ViewType.list;

    return OrientationBuilder(builder: (context, orientation) {
      final isLandscape = orientation;
      int gridRow = (isLandscape == Orientation.landscape) ? 3 : 2;
      return Scaffold(
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
        body: Column(
          children: <Widget>[
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
                    onPressed: (int i) {
                      setState(() {
                        if (i == 0) {
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
            Expanded(
              child: (isListView)
                  ? GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: _crossAxisCount,
                        childAspectRatio: 10.0 / 3.5,
                      ),
                      itemCount: hotelLists.length,
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            leading: Hero(
                              tag: '${hotelLists[index].imagePath}',
                              child: Image.asset(
                                hotelLists[index].imagePath,
                              ),
                            ),
                            title: card(context, index),
                          ),
                        );
                      })
                  : GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: gridRow,
                        childAspectRatio: 8.0 / 9.0,
                      ),
                      itemCount: hotelLists.length,
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              AspectRatio(
                                aspectRatio: 20 / 11,
                                child: Hero(
                                  tag: '${hotelLists[index].id}',
                                  child: Image.asset(
                                    hotelLists[index].imagePath,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              card(context, index),
                            ],
                          ),
                        );
                      }),
            )
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
    });
  }
}

Row contentRow(index) {
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
              hotelLists[index].name,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14.0),
              maxLines: 1,
            ),
            const SizedBox(height: 5.0),
            Text(
              hotelLists[index].location,
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

Stack card(context, index) {
  return Stack(
    alignment: AlignmentDirectional.bottomEnd,
    children: <Widget>[
      Container(
        padding: const EdgeInsets.fromLTRB(9.0, 10.0, 10.0, 35.0),
        child: contentRow(index),
      ),
      Positioned(
        top: isListView ? 60 : 60,
        child: Container(
          child: TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(hotel: hotelLists[index], saved: saved)));
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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FavoritePage(saved: saved)));
        } else if (label == 'My Page') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyPage(saved: saved)));
        } else if (label == 'Log Out') {
          Navigator.pushNamed(context, '/login');
        }
      }
      // Navigator.pop(context);
    },
  );
}
