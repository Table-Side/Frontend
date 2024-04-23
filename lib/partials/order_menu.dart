import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_side/models/restaurant.dart';
import 'package:table_side/provider/local/current_order_provider.dart';

class OrderMenu extends ConsumerWidget {
  final Menu menu;

  const OrderMenu({super.key, required this.menu});

  @override
  Widget build(BuildContext context, final WidgetRef ref) {
    final order =
        ref.watch(currentOrderProvider(menu.restaurantId, menu.id).notifier);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                "Menu",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              for (final item in menu.items!)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
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
                                  Text(
                                    item.shortName,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    item.displayName,
                                    textAlign: TextAlign.start,
                                  ),
                                  Text(
                                    item.description,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  Text(
                                    "£${item.price}",
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        order.addItem(item);
                                      },
                                      icon: const Icon(Icons.add)),
                                  IconButton(
                                    onPressed: () {
                                      order.removeItem(item);
                                    },
                                    icon: const Icon(Icons.remove),
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
  }
}
