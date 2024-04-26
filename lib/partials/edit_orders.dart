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
                                      const Text("Order ID:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(transaction.orderId),
                                      const Text("Ordered:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(DateFormat('yyyy-MM-dd HH:mm:ss')
                                          .format(transaction.createdAt)),
                                      const Text("Order Items and Quantity:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      for (var item in transaction.items) ...[
                                        Row(
                                          children: [
                                            Text(
                                              item.shortName,
                                            ),
                                            const SizedBox(width: 15),
                                            Text(
                                              "x${item.quantity}",
                                            ),
                                          ],
                                        ),
                                      ],
                                      const SizedBox(height: 15),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 100),
                                        child: IconButton(
                                          onPressed: () async {
                                            await getApiService<
                                                    KitchenService>()
                                                .finish(
                                              orderId: transaction.id,
                                              restaurantId:
                                                  transaction.restaurantId,
                                            );

                                            ref.invalidate(ordersProvider(
                                                widget.restaurantId));
                                          },
                                          icon: const Icon(Icons.done),
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
