import 'package:flutter/material.dart';
import 'package:table_side/components/async_builder.dart';
import 'package:table_side/components/custom_app_bar.dart';
import 'package:table_side/partials/order_menu.dart';
import 'package:table_side/provider/menu_provider.dart';
import 'package:table_side/screens/restaurants/current_order.dart';

class OrderForm extends StatelessWidget {
  final String restaurantId;
  final String menuId;

  const OrderForm({
    super.key,
    required this.restaurantId,
    required this.menuId,
  });

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Order'),
      body: AsyncBuilder(
          selector: (final ref) =>
              ref.watch(menuInfoProvider(restaurantId, menuId)),
          builder: (context, menu) {
            return SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 40),
                    child: Container(
                      color: Colors.grey.withOpacity(0.2),
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: OrderMenu(menu: menu),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 40),
                    child: Container(
                      color: Colors.grey.withOpacity(0.2),
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: CurrentOrder(
                        restaurantId: restaurantId,
                        menuId: menuId,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
