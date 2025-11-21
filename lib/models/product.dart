import 'package:ewallet_app/app/app_link.dart';
import 'package:flutter/material.dart';

const String imgPath = 'assets/images/icons/3d';

class Product {
  String id;
  String name;
  Color color;
  String icon;
  String description;
  String? route;

  Product({
    required this.id,
    required this.name,
    this.color = Colors.purple,
    required this.icon,
    required this.description,
    this.route,
  });
}

List<Product> productList = [
  Product(
    id: '1',
    name: 'apps',
    icon: '$imgPath/apps.png',
    color: Colors.deepPurpleAccent,
    description: 'Apps and digital products',
    route: AppLink.appList,
  ),
  Product(
    id: '2',
    name: 'education',
    icon: '$imgPath/education.png',
    color: Colors.cyan,
    description: 'Educational apps, online courses, and Elearning platforms',
    route: AppLink.educationList,
  ),
  Product(
    id: '3',
    name: 'electricity',
    icon: '$imgPath/electric.png',
    color: Colors.yellow,
    description: 'Electricity and energy-related apps',
    route: AppLink.electricityPurchase
  ),
  Product(
    id: '4',
    name: 'streaming',
    icon: '$imgPath/entertainment.png',
    description: 'Entertainment and streaming apps',
    color: Colors.purpleAccent,
    route: AppLink.entertainmentList
  ),
  Product(
    id: '5',
    name: 'games',
    icon: '$imgPath/game.png',
    description: 'Gaming topup and in-game purchases',
    color: Colors.pink,
    route: AppLink.gameList
  ),
  Product(
    id: '6',
    name: 'internet',
    icon: '$imgPath/internet.png',
    description: 'Internet Billing',
    color: Colors.lightBlue,
    route: AppLink.internetBilling
  ),
  Product(
    id: '7',
    name: 'insurance',
    icon: '$imgPath/medical.png',
    description: 'Medical insurance and health-related apps',
    color: Colors.teal,
    route: AppLink.insuranceBilling
  ),
  Product(
    id: '8',
    name: 'mobile',
    icon: '$imgPath/mobile.png',
    description: 'Mobile credit, data packages and prepaid services',
    color: Colors.indigoAccent,
    route: AppLink.mobileList
  ),
  Product(
    id: '9',
    name: 'TV',
    icon: '$imgPath/tv.png',
    description: 'TV and streaming services',
    color: Colors.red,
    route: AppLink.tvBilling
  ),
  Product(
    id: '10',
    name: 'more',
    icon: 'assets/images/icons/gradient/others.png',
    description: '',
    color: Colors.purpleAccent,
    route: '/'
  ),
];
