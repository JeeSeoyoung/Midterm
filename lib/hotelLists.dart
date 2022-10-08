import 'package:shrine/hotel.dart';

class HotelLists {
  static List<String> name = [
    'BanYan Tree',
    'Grand Walkerhill',
    'JW Marriott',
    'Signiel Seoul',
    'Hillton',
    'Lotte City Hotel',
  ];
  static List<String> location = [
    'Jang Chung Dan-Ro 60, Jung-Gu, Seoul 04605, KOREA',
    '177 Walkerhill-ro, Gwangjin-gu, Seoul, Korea',
    '176, Sinbanpo-ro, Seocho-gu, Seoul, South Korea, 06546',
    '300 Olympic-ro, Songpa-gu, Seoul',
    '50, Sowol-Ro, Jung-Gu,Seoul, 04637, South Korea',
    '362 Samil-daero, Jung-gu, Seoul',
  ];
  static List<String> number = [
    '02.2250.8000',
    '+82-1670-0005 ',
    '+82 2-62826262',
    '+82-2-3213-1000',
    '+82 2-753-7788',
    '+82-2-6112-1000',
  ];
  static List<String> description = [
    'For the first time in Korea, Banyan Tree Club & Spa Seoul provides advanced club services- Heritage Club Members- a place where new club culture of noblesse membership and its membership continues for third or fourth generations of members.We invite you to this special community, which is located in the site of 69,000 square meters and represents the best upper classes from politics, economy and social and culture',
    'With the urban nature and impressive services, Grand Walkerhill Seoul promises to offer customers pleasant experiences by sensibility and emotion.Based on the authenticity and know-how of Grand Walkerhill Seoul, we offer comfortable and elegant services tailored to each customer\'s lifestyle to provide them the essence of hotel service.',
    'A distinguished destination in the Gangnam District, JW Marriott Hotel Seoul offers 5-star luxury amid some of South Korea\'s most celebrated attractions. Immerse yourself in refined luxury in 379 sophisticated hotel accommodations, including two penthouses and 32 suites with chic, signature amenities, sumptuous bedding and scenic city views. Thrill your palate with diverse dining options, including premium wood-fire-grilled steaks, authentic Japanese dishes and an all-day dining buffet.',
    'SIGNIEL SEOUL is the first luxury landmark hotel representing Korea and is operated by LOTTE HOTELS & RESORTS, the country’s biggest hotel group that boasts of half a century’s expertise and premium services. As a signature brand, SIGNIEL SEOUL offers the ultimate experience for top-class customers from all over the world.',
    'We’re in the heart of Seoul with spectacular views of the city and Mount Namsan. Seoullo 7017 and Namdaemun Market are a short walk, and we’re one kilometer from Myeongdong. N Seoul Tower, Deoksugung Palace, and Gyeongbokgung Palace are within three kilometers. We\'re adjacent to Seoul Station, offering easy non-stop connections to Seoul-Incheon and Gimpo International airports by train. Enjoy our 24-hour fitness center, indoor pool, spa, and golf driving range.',
    'LOTTE City Hotel Myeongdong is located between Myeongdong, the business and shopping center of Seoul, and Cheonggyecheon, an oasis in the downtown area. The 27-storey building boasts a spectacular view of the Seoul city.',
  ];
  static List<String> imagePath = [
    'assets/00.jpg',
    'assets/01.jpg',
    'assets/02.jpg',
    'assets/03.jpg',
    'assets/04.jpg',
    'assets/05.jpg',
  ];
  static List<int> id = [
    0,
    1,
    2,
    3,
    4,
    5,
  ];
  static List<int> hotel_stars = [
    5,
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
