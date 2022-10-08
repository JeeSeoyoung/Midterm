import 'package:flutter/material.dart';
import 'package:shrine/home.dart';
import 'package:lottie/lottie.dart';
import 'detailPage.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key, required this.saved}) : super(key: key);
  final List saved;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('My Page')),
      ),
      body: Column(
        children: [
          ClipOval(
              clipper: MyClip(),
              child: Lottie.network(
                  'https://assets4.lottiefiles.com/packages/lf20_VxMtBqhDeP.json',
                  width: 200,
                  height: 200)),
          Text(
            'Seoyoung Jee',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            '21700705',
            style: TextStyle(fontSize: 12.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Text(
              'My Favorite Hotel List',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: saved.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 4.0,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                        hotel: saved[index], saved: saved)));
                          },
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Image.asset(saved[index].imagePath),
                              Positioned(
                                left: 16,
                                bottom: 16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      saved[index].name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      saved[index].location,
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12.0,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class MyClip extends CustomClipper<Rect> {
  Rect getClip(Size size) {
    return Rect.fromLTWH(35, 50, 130, 130);
  }

  bool shouldReclip(oldClipper) {
    return false;
  }
}
