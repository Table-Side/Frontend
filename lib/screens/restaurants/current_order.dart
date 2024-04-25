import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:table_side/components/async_builder.dart';
import 'package:table_side/const/design.dart';
import 'package:table_side/models/restaurant.dart';
import 'package:table_side/provider/local/current_order_provider.dart';
import 'package:table_side/provider/menu_provider.dart';

class CurrentOrder extends ConsumerWidget {
  final String restaurantId;
  final String menuId;

  const CurrentOrder({
    super.key,
    required this.restaurantId,
    required this.menuId,
  });

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    var currentOrder = ref.watch(currentOrderProvider(restaurantId, menuId));
    bool orderPlaced = false;

    return AsyncBuilder(
      selector: (final ref) =>
          ref.watch(menuInfoProvider(restaurantId, menuId)),
      builder: (context, itemDetails) {
        final total = currentOrder.entries.fold(
            0.0,
            (previousValue, element) =>
                previousValue +
                double.parse(itemDetails.items!
                        .firstWhere((e) => e.id == element.key)
                        .price) *
                    element.value);

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text(
                    "Current Order",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  for (final entry in currentOrder.entries)
                    CurrentOrderItem(
                      item: itemDetails.items!
                          .firstWhere((element) => element.id == entry.key),
                      quantity: entry.value,
                    ),
                ],
              ),
            ),
            Text(
              "Total: £${total.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, right: 100, left: 140),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: purpleColor,
                    onPressed: () async {
                      final testing = await ref
                          .read(currentOrderProvider(restaurantId, menuId)
                              .notifier)
                          .createOrder(restaurantId, currentOrder);

                      if (testing[1] == 200) {
                        orderPlaced = true;
                      }

                      if (orderPlaced) {
                        if (context.mounted) {
                          showDialog(
                            context: context,
                            builder: (final context) => AlertDialog(
                              title: const Center(
                                  child: Text("Order placed successfully!")),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    context.pushReplacement(
                                        '/restaurant/$restaurantId/details');
                                  },
                                  child: const Text("OK"),
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Checkout",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    ref
                        .read(
                            currentOrderProvider(restaurantId, menuId).notifier)
                        .reset();
                  },
                  icon: const Icon(Icons.delete, size: 30),
                ),

                // TODO: Add pop-up "order successful" message
                // TODO: Go back to restaurant view
              ],
            ),
          ],
        );
      },
    );
  }
}

class CurrentOrderItem extends StatelessWidget {
  const CurrentOrderItem({
    super.key,
    required this.item,
    required this.quantity,
  });

  final Item item;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    // name - need to get from db
                    Text(
                      item.shortName,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                    // price - need to get from db
                    Text(
                      "£${(double.parse(item.price) * quantity).toStringAsFixed(2)} ($quantity @ £${item.price})",
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
                Column(
                  children: [
                    Material(
                      color: Colors.white,
                      child: Center(
                        child: Ink(
                          width: 30,
                          height: 30,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(quantity.toString()),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              height: 0,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
