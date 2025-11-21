import 'package:ewallet_app/constants/img_api.dart';

class CartItem {
  final String id;
  final String name;
  final String thumbnail;
  final String number;
  final double price;
  final double adminFee;
  final double discount;

  CartItem({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.number,
    required this.price,
    this.adminFee = 1,
    this.discount = 0.0,
  });
}

final List<CartItem> cartItems = [
  CartItem(
    id: '1',
    name: 'Mobile 10 Credits',
    thumbnail: ImgApi.photo[285],
    number: '08812345678',
    price: 10,
    discount: 20,
  ),
  CartItem(
    id: '2',
    name: 'Internet Package 10 GB',
    thumbnail: ImgApi.photo[318],
    number: '08812345678',
    price: 20,
  ),
];