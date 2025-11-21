import 'package:ewallet_app/constants/img_api.dart';
import 'package:ewallet_app/models/category_type.dart';
import 'package:ewallet_app/models/transfer_history.dart';

enum TransactionStatus {
  pending,
  success,
  failed,
  unknown
}

class Transaction {
  final String id;
  final String name;
  final String? thumb;
  final CategoryType category;
  final DateTime transactionDate;
  final TransactionStatus status;
  final TransferType type;
  final double price;

  Transaction({
    required this.id,
    required this.name,
    this.thumb,
    required this.category,
    required this.transactionDate,
    required this.type,
    required this.status,
    required this.price,
  });
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'thumb': thumb,
      'category': category,
      'transactionDate': transactionDate,
      'type': type,
      'status': status,
      'price': price,
    };
  }
}

final List<Transaction> transactionList = [
  Transaction(
    id: '1',
    name: 'Skills Starter Pack',
    thumb: ImgApi.photo[51],
    category: categoryList[0],
    transactionDate: DateTime.parse('2025-04-02'),
    status: TransactionStatus.success,
    type: TransferType.send,
    price: 99
  ),
  Transaction(
    id: '2',
    name: 'The Complete Prompt Engineering for AI',
    category: categoryList[6],
    transactionDate: DateTime.parse('2025-04-02'),
    status: TransactionStatus.success,
    type: TransferType.send,
    price: 10
  ),
  Transaction(
    id: '3',
    name: 'Call and SMS Package',
    category: categoryList[29],
    thumb: ImgApi.photo[192],
    transactionDate: DateTime.parse('2025-02-02'),
    status: TransactionStatus.success,
    type: TransferType.send,
    price: 3
  ),
  Transaction(
    id: '4',
    name: 'News and Entertainment Subscription',
    category: categoryList[8],
    transactionDate: DateTime.parse('2025-03-02'),
    status: TransactionStatus.failed,
    type: TransferType.send,
    price: 5
  ),
  Transaction(
    id: '5',
    name: 'Combo Internet Package',
    category: categoryList[29],
    transactionDate: DateTime.parse('2025-03-02'),
    status: TransactionStatus.success,
    type: TransferType.send,
    price: 10
  ),
  Transaction(
    id: '6',
    name: 'Combo Internet Package',
    category: categoryList[29],
    transactionDate: DateTime.parse('2025-02-02'),
    status: TransactionStatus.failed,
    type: TransferType.send,
    price: 10
  ),
  Transaction(
    id: '7',
    name: 'Movie and Series',
    category: categoryList[8],
    thumb: ImgApi.photo[95],
    transactionDate: DateTime.parse('2025-03-02'),
    status: TransactionStatus.pending,
    type: TransferType.send,
    price: 5
  ),
  Transaction(
    id: '8',
    name: 'Space Stickers',
    category: categoryList[14],
    thumb: ImgApi.photo[121],
    transactionDate: DateTime.parse('2025-02-02'),
    status: TransactionStatus.success,
    type: TransferType.send,
    price: 55
  ),
  Transaction(
    id: '9',
    name: 'Football Event Pass',
    category: categoryList[14],
    thumb: ImgApi.photo[123],
    transactionDate: DateTime.parse('2025-01-02'),
    status: TransactionStatus.pending,
    type: TransferType.send,
    price: 25
  ),
  Transaction(
    id: '10',
    name: 'Business Suite',
    thumb: ImgApi.photo[0],
    category: categoryList[0],
    transactionDate: DateTime.parse('2025-04-02'),
    status: TransactionStatus.success,
    type: TransferType.send,
    price: 99
  ),
  Transaction(
    id: '11',
    name: 'Design Deluxe',
    thumb: ImgApi.photo[0],
    category: categoryList[0],
    transactionDate: DateTime.parse('2025-04-02'),
    status: TransactionStatus.success,
    type: TransferType.send,
    price: 99
  ),
  Transaction(
    id: '12',
    name: 'The Complete Prompt Engineering for AI',
    category: categoryList[6],
    transactionDate: DateTime.parse('2025-04-02'),
    status: TransactionStatus.success,
    type: TransferType.send,
    price: 10
  ),
  Transaction(
    id: '13',
    name: 'The Complete Prompt Engineering for AI',
    category: categoryList[6],
    transactionDate: DateTime.parse('2025-04-02'),
    status: TransactionStatus.success,
    type: TransferType.send,
    price: 10
  ),
];
