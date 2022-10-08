import 'package:shrine/hotel.dart';

class HotelLists {
  static List<String> name = [
    'q',
    'b',
    'c',
    'a',
    'w',
    'q',
  ];
  static List<String> location = [
    'Jang Chung Dan-Ro 60, Jung-Gu, Seoul 04605, KOREA',
    'Jang Chung Dan-Ro 60, Jung-Gu, Seoul 04605, KOREA',
    'Jang Chung Dan-Ro 60, Jung-Gu, Seoul 04605, KOREA',
    'Jang Chung Dan-Ro 60, Jung-Gu, Seoul 04605, KOREA',
    'Jang Chung Dan-Ro 60, Jung-Gu, Seoul 04605, KOREA',
    'Jang Chung Dan-Ro 60, Jung-Gu, Seoul 04605, KOREA',
  ];
  static List<String> number = [
    '010-1111-2222',
    '010-1111-2222',
    '010-1111-2222',
    '010-1111-2222',
    '010-1111-2222',
    '010-1111-2222',
  ];
  static List<String> description = [
    'jkdlssssssssssfj',
    'jkdlssssssssssfj',
    'jkdlssssssssssfj',
    'jkdlssssssssssfj',
    'jkdlssssssssssfj',
    'jkdlssssssssssfj',
  ];
  static List<String> imagePath = [];
  static List<int> id = [
    0,
    1,
    2,
    3,
    4,
    5,
  ];
  static List<int> hotel_stars = [
    2,
    3,
    4,
    5,
    1,
    4,
  ];
  final List<Hotel> hotels = List.generate(
      id.length,
      (index) => Hotel(
          id[index],
          hotel_stars[index],
          name[index],
          location[index],
          number[index],
          description[index],
          imagePath[index]));
}
