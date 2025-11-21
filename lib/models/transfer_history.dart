import 'package:ewallet_app/models/bank.dart';
import 'package:ewallet_app/models/category_type.dart';
import 'package:ewallet_app/models/transaction.dart';
import 'package:ewallet_app/models/user.dart';
import 'package:ewallet_app/models/vendor.dart';

enum TransferType {
  send,
  receive,
  withdraw
}

class Transfer {
  final String id;
  final String? desc;
  final CategoryType? category;
  final DateTime transactionDate;
  final TransactionStatus status;
  final double price;
  final TransferType type;
  final dynamic subject;

  Transfer({
    required this.id,
    this.desc,
    this.category,
    required this.transactionDate,
    required this.status,
    required this.price,
    required this.type,
    required this.subject,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'desc': desc,
      'category': category,
      'transactionDate': transactionDate,
      'status': status,
      'price': price,
      'type': type,
      'subject': subject.name,
    };
  }
}

final List<Transfer> transferList = [
  Transfer(
    id: "t001",
    desc: "Payment for project",
    transactionDate: DateTime.now().subtract(Duration(days: 1)),
    status: TransactionStatus.success,
    category: categoryList[33],
    price: 149.99,
    type: TransferType.send,
    subject: userList[1]
  ),
  Transfer(
    id: "t002",
    desc: "Received payment from John Doe",
    category: categoryList[5],
    transactionDate: DateTime.now().subtract(Duration(days: 2)),
    status: TransactionStatus.success,
    price: 500.00,
    type: TransferType.receive,
    subject: userList[2]
  ),
  Transfer(
    id: "t003",
    desc: "Bill payment",
    category: categoryList[32],
    transactionDate: DateTime.now().subtract(Duration(days: 3)),
    status: TransactionStatus.success,
    price: 65.50,
    type: TransferType.send,
    subject: userList[6],
  ),
  Transfer(
    id: "t004",
    desc: "Transfer to bank account",
    category: categoryList[44],
    transactionDate: DateTime.now().subtract(Duration(days: 4)),
    status: TransactionStatus.pending,
    price: 200.00,
    type: TransferType.send,
    subject: bankList[0]
  ),
  Transfer(
    id: "t005",
    desc: "Transfer to bank account",
    category: categoryList[44],
    transactionDate: DateTime.now().subtract(Duration(days: 4)),
    status: TransactionStatus.failed,
    price: 200.00,
    type: TransferType.send,
    subject: bankList[1]
  ),
  Transfer(
    id: "t006",
    desc: "Oct 2025",
    category: categoryList[27],
    transactionDate: DateTime.now().subtract(Duration(days: 6)),
    status: TransactionStatus.success,
    price: 100.00,
    type: TransferType.withdraw,
    subject: vendorList[10]
  ),
  Transfer(
    id: "t007",
    desc: "Received cashback from GoPay",
    category: categoryList[19],
    transactionDate: DateTime.now().subtract(Duration(days: 7)),
    status: TransactionStatus.success,
    price: 10.00,
    type: TransferType.receive,
    subject: userList[1]
  ),
  Transfer(
    id: "t008",
    desc: "Mobile data purchase",
    category: categoryList[29],
    transactionDate: DateTime.now().subtract(Duration(days: 8)),
    status: TransactionStatus.success,
    price: 25.00,
    type: TransferType.send,
    subject: userList[4]
  ),
  Transfer(
    id: "t009",
    desc: "Withdrawal for cash",
    category: categoryList[1],
    transactionDate: DateTime.now().subtract(Duration(days: 9)),
    status: TransactionStatus.success,
    price: 300.00,
    type: TransferType.withdraw,
    subject: vendorList[9]
  ),
  Transfer(
    id: "t010",
    desc: "Failed transfer to bank",
    category: categoryList[44],
    transactionDate: DateTime.now().subtract(Duration(days: 10)),
    status: TransactionStatus.failed,
    price: 59.99,
    type: TransferType.send,
    subject: bankList[3]
  ),
];
