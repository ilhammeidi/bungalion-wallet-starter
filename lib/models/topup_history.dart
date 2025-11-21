import 'package:flutter/material.dart';

class TopupHistory {
  String id;
  String userId;
  String bank;
  double amount;
  DateTime transactionDate;
  DateTime confirmedDate;
  DateTime? paidDate;
  int status;
  String notes;

  TopupHistory({
    this.id = '0',
    required this.userId,
    required this.bank,
    required this.amount,
    required this.transactionDate,
    required this.confirmedDate,
    this.paidDate,
    required this.status,
    required this.notes,
  });
}

final List<TopupHistory> topupHistoryList = [
  TopupHistory(
    id: '0',
    userId: '0',
    bank: 'Bank 1',
    amount: 20,
    transactionDate: DateTime.parse('2023-01-01'),
    confirmedDate: DateTime.parse('2023-01-02'),
    status: 1,
    notes: '',
  ),
  TopupHistory(
    id: '1',
    userId: '0',
    bank: 'Bank 1',
    amount: 20,
    transactionDate: DateTime.parse('2023-01-01'),
    confirmedDate: DateTime.parse('2023-01-02'),
    status: 1,
    notes: '',
  ),
  TopupHistory(
    id: '2',
    userId: '0',
    bank: 'Bank 1',
    amount: 10,
    transactionDate: DateTime.parse('2023-01-01'),
    confirmedDate: DateTime.parse('2023-01-02'),
    status: 2,
    notes: '',
  ),
  TopupHistory(
    id: '3',
    userId: '0',
    bank: 'Bank 1',
    amount: 25,
    transactionDate: DateTime.parse('2023-01-01'),
    confirmedDate: DateTime.parse('2023-01-02'),
    status: 3,
    notes: '',
  ),
  TopupHistory(
    id: '4',
    userId: '0',
    bank: 'Bank 1',
    amount: 200,
    transactionDate: DateTime.parse('2023-01-01'),
    confirmedDate: DateTime.parse('2023-01-02'),
    status: 3,
    notes: '',
  )
];

class TopupStatus {
  final Color color;
  final String text;
  final IconData icon;

  const TopupStatus({
    required this.color,
    required this.text,
    required this.icon,
  });
}
