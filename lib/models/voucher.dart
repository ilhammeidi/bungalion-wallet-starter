import 'package:ewallet_app/constants/img_api.dart';
import 'package:flutter/material.dart';

class Voucher {
  final String id;
  final String title;
  final String desc;
  final Color color;
  String? image;

  Voucher({
    required this.id,
    required this.title,
    required this.desc,
    this.color = Colors.grey,
    this.image
  });
}

final List<Voucher> voucherList = [
  Voucher(
    id: '1',
    title: 'Up to \$50 Off Hotels',
    desc: 'Expires in 3 days | Promo Code: 50DEAL50',
    color: Colors.blue,
    image: ImgApi.photo[265]
  ),
  Voucher(
    id: '2',
    title: 'Up to \$10 Off Hotels',
    desc: 'Min. spend Rp1,767,000 | Expires in 3 days | Promo Code: AGODADEAL8',
    color: Colors.green,
    image: ImgApi.photo[199]
  ),
  Voucher(
    id: '3',
    title: 'Limited Time Price Drop',
    desc: 'Unlock special rates at your dream destination. ',
    color: Colors.red,
    image: ImgApi.photo[165]
  ),
  Voucher(
    id: '4',
    title: 'Save On Holidays & Save Wildlife',
    desc: 'We\'ll donate \$1 to WWF for every reservation you make!',
    color: Colors.purple,
    image: ImgApi.photo[150]
  ),
  Voucher(
    id: '5',
    title: 'Elite Offers - Up to 30% off',
    desc: 'Enjoy travel discounts! Save on participating holidays',
    color: Colors.purple,
    image: ImgApi.photo[150]
  ),
  Voucher(
    id: '6',
    title: 'Premium Offers - Up to 25% off',
    desc: 'Enjoy travel discounts! Save on participating holidays',
    color: Colors.orange,
    image: ImgApi.photo[121]
  ),
  Voucher(
    id: '7',
    title: 'Select Offers - Up to 15% off',
    desc: 'Expires in 3 days | Promo Code: 50DEAL50',
    color: Colors.blue,
    image: ImgApi.photo[122]
  ),
  Voucher(
    id: '8',
    title: 'Local Deals - Up to 25% off',
    desc: 'Get special rates on local hotels and resorts.',
    color: Colors.blue,
    image: ImgApi.photo[122]
  ),
  Voucher(
    id: '9',
    title: 'International Deals - Up to 30%',
    desc: 'Get special rates on international hotels and resorts.',
    color: Colors.blue,
    image: ImgApi.photo[122]
  ),
  Voucher(
    id: '10',
    title: 'Continue browsing on our App!',
    desc: 'Visit app to get access to all your deals, offers, and discounts',
    color: Colors.blue,
    image: ImgApi.photo[128]
  ),
  Voucher(
    id: '11',
    title: 'Up to \$50 Off Hotels',
    desc: 'Expires in 3 days | Promo Code: 50DEAL50',
    color: Colors.green,
  ),
  Voucher(
    id: '12',
    title: 'Up to \$50 Off Hotels',
    desc: 'Expires in 3 days | Promo Code: 50DEAL50',
    color: Colors.teal,
  ),
  Voucher(
    id: '13',
    title: 'Up to \$50 Off Hotels',
    desc: 'Expires in 3 days | Promo Code: 50DEAL50',
    color: Colors.pink,
  ),
  Voucher(
    id: '14',
    title: 'Up to \$50 Off Hotels',
    desc: 'Expires in 3 days | Promo Code: 50DEAL50',
    color: Colors.cyan,
  ),
  Voucher(
    id: '15',
    title: 'Up to \$50 Off Hotels',
    desc: 'Expires in 3 days | Promo Code: 50DEAL50',
    color: Colors.teal,
  ),
];