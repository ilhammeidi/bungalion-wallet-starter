import 'package:ewallet_app/constants/img_api.dart';
import 'package:ewallet_app/models/vendor.dart';
import 'package:flutter/material.dart';

enum BillingStatus {
  pending,
  unpaid,
  paid,
  expired,
  failed,
}


class Billing {
  final String id;
  final String name;
  final String period;
  final DateTime dueDate;
  final String? description;
  final double price;
  final String? thumb;
  final IconData icon;
  final String category;
  final Vendor? vendor;
  final double adminFee;
  final double? points;
  final BillingStatus status;

  Billing({
    required this.id,
    required this.name,
    required this.period,
    required this.dueDate,
    this.description,
    required this.price,
    this.thumb,
    required this.icon,
    required this.category,
    this.vendor,
    required this.adminFee,
    this.points,
    required this.status,
  });
}

final List<Billing> mobileBilling = [
  Billing(
    id: '1',
    name: 'Mobile Billing',
    period: 'Oct 2025',
    dueDate: DateTime.parse('2026-01-02'),
    description: 'Payment for mobile services',
    price: 29.12,
    thumb: ImgApi.photo[329],
    icon: Icons.phone_android,
    category: 'Mobile',
    vendor: vendorList[68],
    adminFee: 2.99,
    points: 10.0,
    status: BillingStatus.unpaid,
  ),
];

final List<Billing> internetBilling = [
  Billing(
    id: '1',
    name: 'Internet Billing',
    period: 'Oct 2025',
    dueDate: DateTime.parse('2026-01-02'),
    description: 'Payment for internet services',
    price: 84.39,
    thumb: ImgApi.photo[301],
    icon: Icons.wifi,
    category: 'Internet',
    vendor: vendorList[40],
    adminFee: 1.99,
    points: 10.0,
    status: BillingStatus.unpaid,
  ),
  Billing(
    id: '2',
    name: 'Internet Billing',
    period: 'Oct 2025',
    dueDate: DateTime.parse('2026-01-02'),
    description: 'Payment for internet services',
    price: 84.39,
    thumb: ImgApi.photo[302],
    icon: Icons.wifi,
    category: 'Internet',
    vendor: vendorList[40],
    adminFee: 1.99,
    points: 10.0,
    status: BillingStatus.unpaid,
  ),
];

final List<Billing> electricBilling = [
  Billing(
    id: '1',
    name: 'Electricity Billing',
    period: 'Oct 2025',
    dueDate: DateTime.parse('2026-01-02'),
    description: 'Payment for electricity services',
    price: 54.33,
    thumb: ImgApi.icon3dElectric,
    icon: Icons.bolt,
    category: 'Electric',
    vendor: vendorList[40],
    adminFee: 1.99,
    points: 10.0,
    status: BillingStatus.unpaid,
  ),
];

final List<Billing> tvBilling = [
  Billing(
    id: '1',
    name: 'TV Cable Billing',
    period: 'Oct 2025',
    dueDate: DateTime.parse('2026-01-02'),
    description: 'Payment for TV cable services',
    price: 103.12,
    thumb: ImgApi.photo[338],
    icon: Icons.tv,
    category: 'TV',
    vendor: vendorList[77],
    adminFee: 1.99,
    points: 10.0,
    status: BillingStatus.unpaid,
  ),
  Billing(
    id: '2',
    name: 'TV Satelite Billing',
    period: 'Oct 2025',
    dueDate: DateTime.parse('2026-01-02'),
    description: 'Payment for TV cable services',
    price: 103.12,
    thumb: ImgApi.photo[332],
    icon: Icons.tv,
    category: 'TV',
    vendor: vendorList[77],
    adminFee: 1.99,
    points: 10.0,
    status: BillingStatus.unpaid,
  ),
  Billing(
    id: '3',
    name: 'TV Internet Billing',
    period: 'Oct 2025',
    dueDate: DateTime.parse('2026-01-02'),
    description: 'Payment for TV cable services',
    price: 103.12,
    thumb: ImgApi.photo[336],
    icon: Icons.tv,
    category: 'TV',
    vendor: vendorList[77],
    adminFee: 1.99,
    points: 10.0,
    status: BillingStatus.unpaid,
  ),
];

final List<Billing> entertainmentBilling = [
  Billing(
    id: '1',
    name: 'Entertainment Billing',
    period: 'Oct 2025',
    dueDate: DateTime.parse('2026-01-02'),
    description: 'Payment for Entertainment services',
    price: 103.12,
    thumb: ImgApi.photo[286],
    icon: Icons.tv,
    category: 'TV',
    vendor: vendorList[25],
    adminFee: 1.99,
    points: 10.0,
    status: BillingStatus.unpaid,
  ),
];

final List<Billing> educationBilling = [
  Billing(
    id: '1',
    name: 'Online Course Billing',
    period: 'Oct 2025',
    dueDate: DateTime.parse('2026-01-02'),
    description: 'Payment for Online Course',
    price: 250.42,
    thumb: ImgApi.photo[271],
    icon: Icons.school,
    category: 'Education',
    vendor: vendorList[10],
    adminFee: 1.99,
    points: 10.0,
    status: BillingStatus.unpaid,
  ),
];

final List<Billing> insuranceBilling = [
  Billing(
    id: '1',
    name: 'Education Insurance Billing',
    period: 'Oct 2025',
    dueDate: DateTime.parse('2026-01-02'),
    description: 'Payment for Education Insurance',
    price: 75.89,
    thumb: ImgApi.photo[314],
    icon: Icons.school,
    category: 'Education',
    vendor: vendorList[57],
    adminFee: 1.99,
    points: 10.0,
    status: BillingStatus.unpaid,
  ),
  Billing(
    id: '2',
    name: 'Health Insurance Billing',
    period: 'Oct 2025',
    dueDate: DateTime.parse('2026-01-02'),
    description: 'Payment for Health Insurance',
    price: 75.89,
    thumb: ImgApi.photo[318],
    icon: Icons.health_and_safety,
    category: 'medical',
    vendor: vendorList[57],
    adminFee: 1.99,
    points: 10.0,
    status: BillingStatus.unpaid,
  ),
  Billing(
    id: '3',
    name: 'Home Insurance Billing',
    period: 'Oct 2025',
    dueDate: DateTime.parse('2026-01-02'),
    description: 'Payment for Home Insurance',
    price: 75.89,
    thumb: ImgApi.photo[317],
    icon: Icons.group,
    category: 'family',
    vendor: vendorList[57],
    adminFee: 1.99,
    points: 10.0,
    status: BillingStatus.unpaid,
  ),
];