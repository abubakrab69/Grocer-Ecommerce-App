import 'package:ecommerceapp/models/nootification_type.dart';
import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationUtils {
  static IconData getNotificationIcon(NootificationType type) {
    switch (type) {
      case NootificationType.order:
        return Icons.shopping_cart;
      case NootificationType.delivery:
        return Icons.local_shipping_outlined;
      case NootificationType.promo:
        return Icons.local_offer_outlined;
      case NootificationType.payment:
        return Icons.payment_outlined;
    }
  }

  static Color getNotificationIconColor(
    BuildContext context,
    NootificationType type,
  ) {
    switch (type) {
      case NootificationType.order:
        return AppTheme.light.primaryColor;
      case NootificationType.delivery:
        return Colors.green[100]!;
      case NootificationType.promo:
        return Colors.orange[100]!;
      case NootificationType.payment:
        return Colors.red[100]!;
    }
  }

  static Color getIconColor(BuildContext context, NootificationType type) {
    switch (type) {
      case NootificationType.order:
        return Colors.white;
      case NootificationType.delivery:
        return Colors.green[700]!;
      case NootificationType.promo:
        return Colors.orange[700]!;
      case NootificationType.payment:
        return Colors.red[700]!;
    }
  }
}
