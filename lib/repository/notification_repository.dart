import 'package:ecommerceapp/models/nootification_type.dart';

class NotificationRepository {
  List<NotificationItem> getNotifications() {
    return [
      NotificationItem(
        title: 'Order confirmed',
        message:
            'your order #7876556 has been confirmed and is being processed',
        time: '11:00 PM',
        type: NootificationType.order,
        isRead: true,
      ),
      NotificationItem(
        title: 'Special Offer!',
        message: 'get 20% off on all fruites',
        time: '11:00 PM',
        type: NootificationType.promo,
        isRead: true,
      ),
      NotificationItem(
        title: 'Out for delivery',
        message: 'your order #7876556 is out for delivery',
        time: '11:00 PM',
        type: NootificationType.delivery,
        isRead: true,
      ),
      NotificationItem(
        title: 'Payment',
        message: 'payment for order #45678 successful',
        time: '2 minutes ago',
        type: NootificationType.payment,
        isRead: true,
      ),
    ];
  }
}
