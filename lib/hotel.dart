class Hotel {
  final int id;
  final int hotel_stars;
  final String name;
  final String location;
  final String number;
  final String description;
  final String imagePath;

  Hotel(
    this.id,
    this.hotel_stars,
    this.name,
    this.location,
    this.number,
    this.description,
    this.imagePath,
  );

  String get assetName => '$id-0.jpg';
  String get assetPackage => 'shrine_images';

  @override
  String toString() => "$name (id=$id)";
}

// final List<Hotel> Hotels = [
//   Hotel(
//       id: 0,
//       hotel_stars: 2,
//       name: 'BanYan Tree',
//       location: 'Jang Chung Dan-Ro 60, Jung-Gu, Seoul 04605, KOREA',
//       number: '010-1111-2222',
//       description:
//           'jkdlssssssssssfjkddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd'),
//   Hotel(
//       id: 1,
//       hotel_stars: 2,
//       name: 'BanYan Tree1',
//       location: 'Jang Chung Dan-Ro 60, Jung-Gu, Seoul 04605, KOREA',
//       number: '010-1111-2222',
//       description:
//           'jkdlssssssssssfjkddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd'),
//   Hotel(
//       id: 2,
//       hotel_stars: 2,
//       name: 'BanYan Tree2',
//       location: 'Jang Chung Dan-Ro 60, Jung-Gu, Seoul 04605, KOREA',
//       number: '010-1111-2222',
//       description:
//           'jkdlssssssssssfjkddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd'),
//   Hotel(
//       id: 3,
//       hotel_stars: 2,
//       name: 'BanYan Tree3',
//       location: 'Jang Chung Dan-Ro 60, Jung-Gu, Seoul 04605, KOREA',
//       number: '010-1111-2222',
//       description:
//           'jkdlssssssssssfjkddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd'),
//   Hotel(
//       id: 4,
//       hotel_stars: 2,
//       name: 'BanYan Tree4',
//       location: 'Jang Chung Dan-Ro 60, Jung-Gu, Seoul 04605, KOREA',
//       number: '010-1111-2222',
//       description:
//           'jkdlssssssssssfjkddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd'),
//   Hotel(
//       id: 5,
//       hotel_stars: 2,
//       name: 'BanYan Tree5',
//       location: 'Jang Chung Dan-Ro 60, Jung-Gu, Seoul 04605, KOREA',
//       number: '010-1111-2222',
//       description:
//           'jkdlssssssssssfjkddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd')
// ];
