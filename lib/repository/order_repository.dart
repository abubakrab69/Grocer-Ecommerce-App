import 'package:ecommerceapp/models/order.dart';

class OrderRepository {
  List<MyOrder> getOrders() {
    return [
      MyOrder(
        orderNumber: '267627',
        itemCount: '5',
        totalAmmount: '77',
        status: OrderStatus.completed.toString().split('.').last,
        imageUrl: 'assets/images/fruit.png',
        orderDate: DateTime(2023, 12, 12),
      ),
      MyOrder(
        orderNumber: '267627',
        itemCount: '5',
        totalAmmount: '77',
        status: OrderStatus.active.toString().split('.').last,
        imageUrl: 'assets/images/fruit.png',
        orderDate: DateTime(2023, 12, 12),
      ),
      MyOrder(
        orderNumber: '267627',
        itemCount: '5',
        totalAmmount: '77',
        status: OrderStatus.cencelled.toString().split('.').last,
        imageUrl: 'assets/images/fruit.png',
        orderDate: DateTime(2023, 12, 12),
      ),
      MyOrder(
        orderNumber: '267627',
        itemCount: '5',
        totalAmmount: '77',
        status: OrderStatus.completed.toString().split('.').last,
        imageUrl: 'assets/images/fruit.png',
        orderDate: DateTime(2023, 12, 12),
      ),
      MyOrder(
        orderNumber: '267627',
        itemCount: '5',
        totalAmmount: '77',
        status: OrderStatus.cencelled.toString().split('.').last,
        imageUrl: 'assets/images/fruit.png',
        orderDate: DateTime(2023, 12, 12),
      ),
      MyOrder(
        orderNumber: '267627',
        itemCount: '5',
        totalAmmount: '77',
        status: OrderStatus.completed.toString().split('.').last,
        imageUrl: 'assets/images/fruit.png',
        orderDate: DateTime(2023, 12, 12),
      ),
    ];
  }
}
