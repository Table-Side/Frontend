import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_side/components/async_builder.dart';
import 'package:table_side/locator.dart';
import 'package:table_side/network/kitchen.dart';
import 'package:table_side/provider/kitchen_provider.dart';

class EditOrders extends ConsumerStatefulWidget {
  final String restaurantId;

  const EditOrders({
    super.key,
    required this.restaurantId,
  });

  @override
  ConsumerState<EditOrders> createState() => _EditMenuState();
}

class _EditMenuState extends ConsumerState<EditOrders> {
  @override
  Widget build(BuildContext context) {
    return AsyncBuilder(
      selector: (final ref) => ref.watch(ordersProvider(widget.restaurantId)),
      builder: (context, transactions) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  for (final transaction in transactions)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 15),
                                      Text("Order ID: ${transaction.orderId}"),
                                      Text(
                                          "Ordered at: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(transaction.createdAt)}"),
                                      for (var item in transaction.items)
                                        Text(
                                            "Item: ${item.shortName} - Quantity: ${item.quantity}"),
                                      const SizedBox(height: 15),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                        onPressed: () async {
                                          await getApiService<KitchenService>()
                                              .finish(
                                            orderId: transaction.id,
                                            restaurantId:
                                                transaction.restaurantId,
                                          );

                                          ref.invalidate(ordersProvider(
                                            widget.restaurantId,
                                          ));
                                        },
                                        icon: const Icon(Icons.done),
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
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
