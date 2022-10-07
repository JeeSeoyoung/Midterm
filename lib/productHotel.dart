class ProductHotel {
  ProductHotel({
    required this.id,
    required this.hotel_stars,
    required this.name,
    required this.location,
    required this.number,
    required this.description,
  });

  final int id;
  final int hotel_stars;
  final String name;
  final String location;
  final String number;
  final String description;

  String get assetName => '$id-0.jpg';
  String get assetPackage => 'shrine_images';

  @override
  String toString() => "$name (id=$id)";
}

final List<ProductHotel> Hotels = [
  ProductHotel(
      id: 0,
      hotel_stars: 2,
      name: 'BanYan Tree',
      location: 'Jang Chung Dan-Ro 60, Jung-Gu, Seoul 04605, KOREA',
      number: '010-1111-2222',
      description:
          'jkdlssssssssssfjkddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd'),
  ProductHotel(
      id: 1,
      hotel_stars: 2,
      name: 'BanYan Tree1',
      location: 'Jang Chung Dan-Ro 60, Jung-Gu, Seoul 04605, KOREA',
      number: '010-1111-2222',
      description:
          'jkdlssssssssssfjkddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd'),
  ProductHotel(
      id: 2,
      hotel_stars: 2,
      name: 'BanYan Tree2',
      location: 'Jang Chung Dan-Ro 60, Jung-Gu, Seoul 04605, KOREA',
      number: '010-1111-2222',
      description:
          'jkdlssssssssssfjkddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd'),
  ProductHotel(
      id: 3,
      hotel_stars: 2,
      name: 'BanYan Tree3',
      location: 'Jang Chung Dan-Ro 60, Jung-Gu, Seoul 04605, KOREA',
      number: '010-1111-2222',
      description:
          'jkdlssssssssssfjkddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd'),
  ProductHotel(
      id: 4,
      hotel_stars: 2,
      name: 'BanYan Tree4',
      location: 'Jang Chung Dan-Ro 60, Jung-Gu, Seoul 04605, KOREA',
      number: '010-1111-2222',
      description:
          'jkdlssssssssssfjkddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd'),
  ProductHotel(
      id: 5,
      hotel_stars: 2,
      name: 'BanYan Tree5',
      location: 'Jang Chung Dan-Ro 60, Jung-Gu, Seoul 04605, KOREA',
      number: '010-1111-2222',
      description:
          'jkdlssssssssssfjkddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd')
];
