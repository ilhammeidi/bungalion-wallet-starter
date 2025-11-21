import 'package:ewallet_app/models/category_type.dart';

class CategoryReport {
  final String id;
  final CategoryType category;
  final double amount;
  final double percentage;

  CategoryReport({
    required this.id,
    required this.category,
    required this.amount,
    required this.percentage,
  });
}

final List<CategoryReport> expenseByCategoryList = [
  CategoryReport(
    id: '1',
    category: categoryList[0],
    amount: 250.0,
    percentage: 25.0,
  ),
  CategoryReport(
    id: '2',
    category: categoryList[1],
    amount: 150.0,
    percentage: 15.0,
  ),
  CategoryReport(
    id: '3',
    category: categoryList[2],
    amount: 100.0,
    percentage: 10.0,
  ),
  CategoryReport(
    id: '4',
    category: categoryList[3],
    amount: 200.0,
    percentage: 20.0,
  ),
  CategoryReport(
    id: '5',
    category: categoryList[4],
    amount: 300.0,
    percentage: 30.0,
  ),
  CategoryReport(
    id: '6',
    category: categoryList[5],
    amount: 50.0,
    percentage: 5.0,
  ),
  CategoryReport(
    id: '7',
    category: categoryList[6],
    amount: 75.0,
    percentage: 7.5,
  ),
  CategoryReport(
    id: '8',
    category: categoryList[7],
    amount: 125.0,
    percentage: 12.5,
  ),
  CategoryReport(
    id: '9',
    category: categoryList[8],
    amount: 175.0,
    percentage: 17.5,
  ),
  CategoryReport(
    id: '10',
    category: categoryList[9],
    amount: 225.0,
    percentage: 22.5,
  ),
];

final List<CategoryReport> incomeByCategoryList = [
  CategoryReport(
    id: '5',
    category: categoryList[33],
    amount: 300.0,
    percentage: 30.0,
  ),
  CategoryReport(
    id: '6',
    category: categoryList[33],
    amount: 50.0,
    percentage: 5.0,
  ),
  CategoryReport(
    id: '7',
    category: categoryList[35],
    amount: 75.0,
    percentage: 7.5,
  ),
  CategoryReport(
    id: '8',
    category: categoryList[19],
    amount: 125.0,
    percentage: 12.5,
  ),
];

