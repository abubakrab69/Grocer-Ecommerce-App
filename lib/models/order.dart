import 'package:flutter/widgets.dart';

enum OrderStatus { active, completed, cencelled }

class MyOrder {
  final String orderNumber;
  final String itemCount;
  final String totalAmount;
  final OrderStatus status;
  final String imageUrl;
  final DateTime orderDate;

  MyOrder({
    required this.orderNumber,
    required this.itemCount,
    required this.totalAmount,
    required this.status,
    required this.imageUrl,
    required this.orderDate,
  });

  String get statusString => status.name;
}
