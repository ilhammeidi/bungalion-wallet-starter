import 'package:ewallet_app/constants/img_api.dart';

class Reward {
  final String id;
  final String title;
  final String description;
  final int points;
  final String image;
  final String logo;

  Reward({
    required this.id,
    required this.title,
    required this.description,
    required this.points,
    required this.image,
    required this.logo,
  });
}

final List<Reward> rewardList = [
  Reward(
    id: '1',
    title: 'Free Flight',
    description: 'Get a free flight to your favorite destination',
    points: 1000,
    image: ImgApi.photo[181],
    logo: ImgApi.photo[101]
  ),
  Reward(
    id: '2',
    title: 'Free Hotel',
    description: 'Get a free hotel room for your next trip',
    points: 500,
    image: ImgApi.photo[182],
    logo: ImgApi.photo[102],
  ),
  Reward(
    id: '3',
    title: 'Free Car',
    description: 'Get a free car rental for your next trip',
    points: 250,
    image: ImgApi.photo[183],
    logo: ImgApi.photo[103],
  ),
  Reward(
    id: '4',
    title: 'Free Meal',
    description: 'Get a free meal at your favorite restaurant',
    points: 100,
    image: ImgApi.photo[184],
    logo: ImgApi.photo[104],
  ),
  Reward(
    id: '5',
    title: 'Free Coffee',
    description: 'Get a free coffee at your favorite coffee shop',
    points: 50,
    image: ImgApi.photo[185],
    logo: ImgApi.photo[105],
  ),
  Reward(
    id: '6',
    title: 'Free Drink',
    description: 'Get a free drink at your favorite bar',
    points: 25,
    image: ImgApi.photo[186],
    logo: ImgApi.photo[106],
  ),
  Reward(
    id: '7',
    title: 'Free Flight',
    description: 'Get a free flight to your favorite destination',
    points: 1000,
    image: ImgApi.photo[187],
    logo: ImgApi.photo[107],
  ),
  Reward(
    id: '8',
    title: 'Free Hotel',
    description: 'Get a free hotel room for your next trip',
    points: 500,
    image: ImgApi.photo[188],
    logo: ImgApi.photo[108],
  ),
  Reward(
    id: '9',
    title: 'Free Car',
    description: 'Get a free car rental for your next trip',
    points: 250,
    image: ImgApi.photo[189],
    logo: ImgApi.photo[109],
  ),
  Reward(
    id: '10',
    title: 'Free Meal',
    description: 'Get a free meal at your favorite restaurant',
    points: 100,
    image: ImgApi.photo[190],
    logo: ImgApi.photo[110],
  ),
];


