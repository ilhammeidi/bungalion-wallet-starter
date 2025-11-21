import 'package:flutter/material.dart';

const String imgPath = 'assets/images/icons/gradient';

class CategoryType {
  final String id;
  final String name;
  final String image;
  final Color color;

  CategoryType({
    required this.id,
    required this.name,
    required this.image,
    required this.color,
  });
}

CategoryType getCategory(String name) {
  return categoryList.firstWhere(
    (category) => category.name == name,
    orElse: () => categoryList[0]
  );
}

final List<CategoryType> categoryList = [
  CategoryType(
    id: '1',
    name: 'apps',
    image: '$imgPath/apps.png',
    color: Colors.deepPurpleAccent,
  ),
  CategoryType(
    id: '2',
    name: 'atm',
    image: '$imgPath/atm.png',
    color: Colors.green,
  ),
  CategoryType(
    id: '3',
    name: 'blog',
    image: '$imgPath/blog.png',
    color: Colors.deepPurpleAccent,
  ),
  CategoryType(
    id: '4',
    name: 'building',
    image: '$imgPath/building.png',
    color: Colors.cyanAccent,
  ),
  CategoryType(
    id: '5',
    name: 'computer',
    image: '$imgPath/computer.png',
    color: Colors.deepPurple,
  ),
  CategoryType(
    id: '6',
    name: 'contact',
    image: '$imgPath/contact.png',
    color: Colors.purpleAccent,
  ),
  CategoryType(
    id: '7',
    name: 'education',
    image: '$imgPath/education.png',
    color: Colors.cyan,
  ),
  CategoryType(
    id: '8',
    name: 'electric',
    image: '$imgPath/electric.png',
    color: Colors.amber,
  ),
  CategoryType(
    id: '9',
    name: 'entertainment',
    image: '$imgPath/entertainment.png',
    color: Colors.purpleAccent,
  ),
  CategoryType(
    id: '10',
    name: 'expense',
    image: '$imgPath/expense.png',
    color: Colors.red,
  ),
  CategoryType(
    id: '11',
    name: 'family',
    image: '$imgPath/family.png',
    color: Colors.orange,
  ),
  CategoryType(
    id: '12',
    name: 'faq',
    image: '$imgPath/faq.png',
    color: Colors.lightBlue,
  ),
  CategoryType(
    id: '13',
    name: 'fashion',
    image: '$imgPath/fashion.png',
    color: Colors.purpleAccent,
  ),
  CategoryType(
    id: '14',
    name: 'food',
    image: '$imgPath/food.png',
    color: Colors.deepOrange,
  ),
  CategoryType(
    id: '15',
    name: 'game',
    image: '$imgPath/game.png',
    color: Colors.pink,
  ),
  CategoryType(
    id: '16',
    name: 'gift',
    image: '$imgPath/gift.png',
    color: Colors.amber,
  ),
  CategoryType(
    id: '17',
    name: 'work',
    image: '$imgPath/work.png',
    color: Colors.blue,
  ),
  CategoryType(
    id: '18',
    name: 'holiday',
    image: '$imgPath/holiday.png',
    color: Colors.yellow,
  ),
  CategoryType(
    id: '19',
    name: 'home',
    image: '$imgPath/home.png',
    color: Colors.orange,
  ),
  CategoryType(
    id: '20',
    name: 'income',
    image: '$imgPath/income.png',
    color: Colors.green,
  ),
  CategoryType(
    id: '21',
    name: 'internet',
    image: '$imgPath/internet.png',
    color: Colors.lightBlue,
  ),
  CategoryType(
    id: '22',
    name: 'kids',
    image: '$imgPath/kids.png',
    color: Colors.lightGreen,
  ),
  CategoryType(
    id: '23',
    name: 'link',
    image: '$imgPath/link.png',
    color: Colors.blue,
  ),
  CategoryType(
    id: '24',
    name: 'loan',
    image: '$imgPath/loan.png',
    color: Colors.lime,
  ),
  CategoryType(
    id: '25',
    name: 'love',
    image: '$imgPath/love.png',
    color: Colors.pink,
  ),
  CategoryType(
    id: '26',
    name: 'insurance',
    image: '$imgPath/medical.png',
    color: Colors.teal,
  ),
  CategoryType(
    id: '27',
    name: 'member',
    image: '$imgPath/member.png',
    color: Colors.cyan,
  ),
  CategoryType(
    id: '28',
    name: 'member',
    image: '$imgPath/merchant.png',
    color: Colors.orangeAccent,
  ),
  CategoryType(
    id: '29',
    name: 'message',
    image: '$imgPath/message.png',
    color: Colors.cyan,
  ),
  CategoryType(
    id: '30',
    name: 'mobile',
    image: '$imgPath/mobile.png',
    color: Colors.indigoAccent,
  ),
  CategoryType(
    id: '31',
    name: 'music',
    image: '$imgPath/music.png',
    color: Colors.limeAccent,
  ),
  CategoryType(
    id: '32',
    name: 'otp',
    image: '$imgPath/otp.png',
    color: Colors.purpleAccent,
  ),
  CategoryType(
    id: '33',
    name: 'payment',
    image: '$imgPath/payment.png',
    color: Colors.purple,
  ),
  CategoryType(
    id: '34',
    name: 'project',
    image: '$imgPath/project.png',
    color: Colors.blue,
  ),
  CategoryType(
    id: '35',
    name: 'qr',
    image: '$imgPath/qr.png',
    color: Colors.purpleAccent,
  ),
  CategoryType(
    id: '36',
    name: 'scan qr',
    image: '$imgPath/scan_qr.png',
    color: Colors.cyanAccent,
  ),
  CategoryType(
    id: '37',
    name: 'service',
    image: '$imgPath/service.png',
    color: Colors.blue,
  ),
  CategoryType(
    id: '38',
    name: 'setting',
    image: '$imgPath/setting.png',
    color: Colors.indigoAccent,
  ),
  CategoryType(
    id: '39',
    name: 'social',
    image: '$imgPath/social.png',
    color: Colors.deepPurpleAccent,
  ),
  CategoryType(
    id: '40',
    name: 'souvenir',
    image: '$imgPath/souvenir.png',
    color: Colors.brown,
  ),
  CategoryType(
    id: '41',
    name: 'sport',
    image: '$imgPath/sport.png',
    color: Colors.lightGreen,
  ),
  CategoryType(
    id: '42',
    name: 'tax',
    image: '$imgPath/tax.png',
    color: Colors.green,
  ),
  CategoryType(
    id: '43',
    name: 'ticket',
    image: '$imgPath/orange.png',
    color: Colors.green,
  ),
  CategoryType(
    id: '44',
    name: 'toys',
    image: '$imgPath/toys.png',
    color: Colors.yellow,
  ),
  CategoryType(
    id: '45',
    name: 'transfer',
    image: '$imgPath/transfer.png',
    color: Colors.indigoAccent,
  ),
  CategoryType(
    id: '46',
    name: 'transportation',
    image: '$imgPath/transportation.png',
    color: Colors.lime,
  ),
  CategoryType(
    id: '47',
    name: 'tv',
    image: '$imgPath/tv.png',
    color: Colors.red,
  ),
  CategoryType(
    id: '48',
    name: 'upload qr',
    image: '$imgPath/upload_qr.png',
    color: Colors.lightBlue,
  ),
  CategoryType(
    id: '49',
    name: 'voucher',
    image: '$imgPath/voucher.png',
    color: Colors.purple,
  ),
  CategoryType(
    id: '50',
    name: 'wallet',
    image: '$imgPath/wallet.png',
    color: Colors.green,
  ),
];

