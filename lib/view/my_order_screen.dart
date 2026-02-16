import 'package:ecommerceapp/models/order.dart';
import 'package:ecommerceapp/repository/order_repository.dart';
import 'package:ecommerceapp/utils/app_theme.dart';
import 'package:ecommerceapp/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrderScreen extends StatelessWidget {
  MyOrderScreen({super.key});
  OrderRepository orderRepository = OrderRepository();

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_outlined),
          ),
          title: Text(
            'My Orders',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottom: TabBar(
            indicatorColor: AppTheme.light.primaryColor,
            unselectedLabelColor: isdark
                ? Colors.grey[200]!
                : Colors.grey[600]!,
            tabs: const [
              Tab(text: 'Active'),
              Tab(text: 'Completed'),
              Tab(text: 'Cancelled'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildOrderList(context, OrderStatus.active),
            buildOrderList(context, OrderStatus.completed),
            buildOrderList(context, OrderStatus.cencelled),
          ],
        ),
      ),
    );
  }

  Widget buildOrderList(BuildContext context, OrderStatus status) {
    final order = orderRepository.getOrderbyStatus(status);
    final isdark = Theme.of(context).brightness == Brightness.dark;

    return ListView.builder(
      itemCount: order.length,
      padding: .all(8),
      itemBuilder: (context, index) {
        return OrderCard(
          order: order[index],
          onViewDetails: () {
            Get.snackbar(
              'Implementation Error',
              'There is no implementation for view details',
              borderRadius: 50,
            );
          },
        );
      },
    );
  }
}
