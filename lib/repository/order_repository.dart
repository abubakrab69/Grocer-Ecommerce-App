import 'package:ecommerceapp/models/order.dart';

class OrderRepository {
  List<MyOrder> getOrders() {
    return [
      MyOrder(
        orderNumber: '267627',
        itemCount: '2',
        totalAmmount: '366.90',
        status: OrderStatus.completed.toString().split('.').last,
        imageUrl: 'assets/images/fruit.png',
        orderDate: DateTime(2023, 12, 12),
      ),
      MyOrder(
        orderNumber: '267628',
        itemCount: '7',
        totalAmmount: '3467.90',
        status: OrderStatus.active.toString().split('.').last,
        imageUrl: 'assets/images/fruit.png',
        orderDate: DateTime(2023, 12, 12),
      ),
      MyOrder(
        orderNumber: '267629',
        itemCount: '5',
        totalAmmount: '77',
        status: OrderStatus.cencelled.toString().split('.').last,
        imageUrl: 'assets/images/fruit.png',
        orderDate: DateTime(2023, 12, 12),
      ),
      MyOrder(
        orderNumber: '267630',
        itemCount: '1',
        totalAmmount: '77.99',
        status: OrderStatus.completed.toString().split('.').last,
        imageUrl: 'assets/images/fruit.png',
        orderDate: DateTime(2023, 12, 12),
      ),
      MyOrder(
        orderNumber: '267631',
        itemCount: '5',
        totalAmmount: '454.90',
        status: OrderStatus.cencelled.toString().split('.').last,
        imageUrl: 'assets/images/fruit.png',
        orderDate: DateTime(2023, 12, 12),
      ),
      MyOrder(
        orderNumber: '267632',
        itemCount: '9',
        totalAmmount: '7789.78',
        status: OrderStatus.completed.toString().split('.').last,
        imageUrl: 'assets/images/fruit.png',
        orderDate: DateTime(2023, 12, 12),
      ),
    ];
  }

  List<MyOrder> getOrderbyStatus(OrderStatus status) {
    return getOrders().where((order) => order.status == status).toList();
  }
}
