enum OrderStatus { active, completed, cencelled }

class MyOrder {
  final String orderNumber;
  final String itemCount;
  final String totalAmmount;
  final String status;
  final String imageUrl;
  final DateTime orderDate;

  MyOrder({
    required this.orderNumber,
    required this.itemCount,
    required this.totalAmmount,
    required this.status,
    required this.imageUrl,
    required this.orderDate,
  });

  // String get formattedDate {
  //   return '${orderDate.day}/${orderDate.month}/${orderDate.year}';
  // }
}
