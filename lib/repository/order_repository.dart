import 'package:ecommerceapp/models/order.dart';
import 'package:flutter/widgets.dart';

class OrderRepository {
  List<MyOrder> getOrders() {
    return [
      MyOrder(
        orderNumber: '267627',
        itemCount: '2',
        totalAmount: '366.90',
        status: OrderStatus.completed,
        imageUrl: 'assets/images/apple.png',
        orderDate: DateTime(2023, 12, 12),
      ),
      MyOrder(
        orderNumber: '267628',
        itemCount: '7',
        totalAmount: '3467.90',
        status: OrderStatus.active,
        imageUrl: 'assets/images/grapes.png',
        orderDate: DateTime(2023, 12, 12),
      ),
      MyOrder(
        orderNumber: '267629',
        itemCount: '5',
        totalAmount: '77',
        status: OrderStatus.cencelled,
        imageUrl: 'assets/images/banana.png',
        orderDate: DateTime(2023, 12, 12),
      ),
      MyOrder(
        orderNumber: '267630',
        itemCount: '1',
        totalAmount: '77.99',
        status: OrderStatus.completed,
        imageUrl: 'assets/images/orange.webp',
        orderDate: DateTime(2023, 12, 12),
      ),
      MyOrder(
        orderNumber: '267631',
        itemCount: '5',
        totalAmount: '454.90',
        status: OrderStatus.cencelled,
        imageUrl: 'assets/images/pinapple.png',
        orderDate: DateTime(2023, 12, 12),
      ),
      MyOrder(
        orderNumber: '267632',
        itemCount: '9',
        totalAmount: '7789.78',
        status: OrderStatus.completed,
        imageUrl: 'assets/images/vegetable.png',
        orderDate: DateTime(2023, 12, 12),
      ),
    ];
  }

  List<MyOrder> getOrderbyStatus(OrderStatus status) {
    return getOrders().where((order) => order.status == status).toList();
  }
}
