import 'package:ewallet_app/constants/img_api.dart';
import 'package:ewallet_app/models/transaction.dart';
import 'package:ewallet_app/models/transfer_history.dart';
import 'package:ewallet_app/models/vendor.dart';
import 'package:ewallet_app/models/category_type.dart';

class Purchase {
  final String id;
  final String userId;
  final String productName;
  final String? thumb;
  final Vendor? vendor;
  final CategoryType category;
  final DateTime transactionDate;
  final TransactionStatus status;
  final double price;
  final TransferType type;

  Purchase({
    required this.id,
    required this.userId,
    required this.productName,
    this.thumb,
    this.vendor,
    required this.category,
    required this.transactionDate,
    required this.status,
    required this.price,
    required this.type
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'productName': productName,
      'thumb': thumb,
      'vendor': vendor,
      'category': category,
      'transactionDate': transactionDate,
      'status': status,
      'price': price,
      'type': type
    };
  }
}

final List<Purchase> purchaseList = [
  Purchase(
    id: '1',
    userId: 'john.doe@mail.com',
    vendor: vendorList[0],
    productName: 'Skills Starter Pack',
    thumb: ImgApi.photo[51],
    category: categoryList[0],
    transactionDate: DateTime.parse('2025-04-02'),
    status: TransactionStatus.success,
    price: 99,
    type: TransferType.send
  ),
  Purchase(
    id: '2',
    userId: 'john.doe@mail.com',
    vendor: vendorList[12],
    productName: 'The Complete Prompt Engineering for AI',
    category: categoryList[6],
    transactionDate: DateTime.parse('2025-04-02'),
    status: TransactionStatus.success,
    price: 10,
    type: TransferType.send
  ),
  Purchase(
    id: '3',
    userId: '080987654321',
    vendor: vendorList[65],
    productName: 'Call and SMS Package',
    category: categoryList[29],
    thumb: ImgApi.photo[192],
    transactionDate: DateTime.parse('2025-02-02'),
    status: TransactionStatus.success,
    price: 3,
    type: TransferType.send
  ),
  Purchase(
    id: '4',
    userId: '081234567890',
    vendor: vendorList[23],
    productName: 'News and Entertainment Subscription',
    category: categoryList[8],
    transactionDate: DateTime.parse('2025-03-02'),
    status: TransactionStatus.success,
    price: 5,
    type: TransferType.send
  ),
  Purchase(
    id: '5',
    userId: '081234567890',
    vendor: vendorList[68],
    productName: 'Combo Internet Package',
    category: categoryList[29],
    transactionDate: DateTime.parse('2025-03-02'),
    status: TransactionStatus.success,
    price: 10,
    type: TransferType.send
  ),
  Purchase(
    id: '6',
    userId: '081234567890',
    vendor: vendorList[68],
    productName: 'Combo Internet Package',
    category: categoryList[29],
    transactionDate: DateTime.parse('2025-02-02'),
    status: TransactionStatus.success,
    price: 10,
    type: TransferType.send
  ),
  Purchase(
    id: '7',
    userId: '081234567890',
    vendor: vendorList[20],
    productName: 'Movie and Series',
    category: categoryList[8],
    thumb: ImgApi.photo[95],
    transactionDate: DateTime.parse('2025-03-02'),
    status: TransactionStatus.success,
    price: 5,
    type: TransferType.send
  ),
  Purchase(
    id: '8',
    userId: '#ABC123456',
    vendor: vendorList[32],
    productName: 'Space Stickers',
    category: categoryList[16],
    thumb: ImgApi.photo[121],
    transactionDate: DateTime.parse('2025-02-02'),
    status: TransactionStatus.success,
    price: 55,
    type: TransferType.send
  ),
  Purchase(
    id: '9',
    userId: 'XYZ_ROEROE',
    vendor: vendorList[34],
    productName: 'Football Event Pass',
    category: categoryList[14],
    thumb: ImgApi.photo[123],
    transactionDate: DateTime.parse('2025-01-02'),
    status: TransactionStatus.success,
    price: 25,
    type: TransferType.send
  ),
  Purchase(
    id: '10',
    userId: 'john.doe@mail.com',
    vendor: vendorList[1],
    productName: 'Business Suite',
    thumb: ImgApi.photo[26],
    category: categoryList[0],
    transactionDate: DateTime.parse('2025-04-02'),
    status: TransactionStatus.success,
    price: 99,
    type: TransferType.send
  ),
  Purchase(
    id: '11',
    userId: 'john.doe@mail.com',
    vendor: vendorList[2],
    productName: 'Design Deluxe',
    thumb: ImgApi.photo[29],
    category: categoryList[0],
    transactionDate: DateTime.parse('2025-04-02'),
    status: TransactionStatus.success,
    price: 99,
    type: TransferType.send
  ),
  Purchase(
    id: '12',
    userId: 'john.doe@mail.com',
    vendor: vendorList[13],
    productName: 'The Complete Prompt Engineering for AI',
    category: categoryList[6],
    transactionDate: DateTime.parse('2025-04-02'),
    status: TransactionStatus.success,
    price: 10,
    type: TransferType.send
  ),
  Purchase(
    id: '13',
    userId: 'john.doe@mail.com',
    vendor: vendorList[14],
    productName: 'The Complete Prompt Engineering for AI',
    category: categoryList[6],
    transactionDate: DateTime.parse('2025-04-02'),
    status: TransactionStatus.success,
    price: 10,
    type: TransferType.send
  ),
  Purchase(
    id: '14',
    userId: 'XYZ_ROEROE',
    vendor: vendorList[33],
    productName: 'Ticket Event Pass',
    category: categoryList[14],
    thumb: ImgApi.photo[125],
    transactionDate: DateTime.parse('2025-01-02'),
    status: TransactionStatus.success,
    price: 25,
    type: TransferType.send
  ),
];
