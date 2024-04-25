import 'package:flutter/material.dart';
import 'package:table_side/components/async_builder.dart';
import 'package:table_side/components/custom_app_bar.dart';
import 'package:table_side/partials/edit_orders.dart';
import 'package:table_side/provider/kitchen_provider.dart';

class KitchenOrders extends StatefulWidget {
  final String restaurantId;

  const KitchenOrders({
    super.key,
    required this.restaurantId,
  });

  @override
  State<KitchenOrders> createState() => _KitchenOrdersState();
}

class _KitchenOrdersState extends State<KitchenOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Order History'),
      body: SingleChildScrollView(
        child: AsyncBuilder(
          selector: (final ref) =>
              ref.watch(ordersProvider(widget.restaurantId)),
          builder: (context, final orders) {
            return EditOrders(
              restaurantId: widget.restaurantId,
            );
          },
        ),
      ),
    );
  }
}
