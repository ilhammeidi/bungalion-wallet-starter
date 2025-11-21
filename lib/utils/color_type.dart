import 'package:ewallet_app/models/billing.dart';
import 'package:ewallet_app/models/transaction.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:flutter/material.dart';

Color colorType(String type) {
  switch(type) {
    case 'primary':
      return ThemePalette.primaryMain;
    case 'secondary':
      return ThemePalette.secondaryMain;
    case 'tertiary':
      return ThemePalette.tertiaryMain;
    default:
      return Colors.grey;
  }
}

Color billingType(BillingStatus type) {
  switch(type) {
    case BillingStatus.paid:
      return Colors.green;
    case BillingStatus.pending:
      return Colors.orange;
    case BillingStatus.unpaid:
      return Colors.orange;
    case BillingStatus.failed:
      return Colors.red;
    default:
      return Colors.grey;
  }
}

Color transactionColor(TransactionStatus type) {
  switch(type) {
    case TransactionStatus.success:
      return Colors.green;
    case TransactionStatus.pending:
      return Colors.amber;
    case TransactionStatus.failed:
      return Colors.red;
    default:
      return Colors.grey;
  }
}

