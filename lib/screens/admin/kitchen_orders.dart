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
      appBar: const CustomAppBar(text: 'Manage Orders'),
      body: SingleChildScrollView(
        child: AsyncBuilder(
          selector: (final ref) =>
              ref.watch(ordersProvider(widget.restaurantId)),
          builder: (context, final orders) {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 35),
                        child: Text(
                          "Orders",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          "Tick to complete order",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                EditOrders(
                  restaurantId: widget.restaurantId,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
