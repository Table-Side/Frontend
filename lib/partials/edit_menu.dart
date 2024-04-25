import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_side/components/async_builder.dart';
import 'package:table_side/locator.dart';
import 'package:table_side/network/item.dart';
import 'package:table_side/provider/menu_provider.dart';

class EditMenu extends ConsumerStatefulWidget {
  final String restaurantId;
  final String menuId;

  const EditMenu({
    super.key,
    required this.restaurantId,
    required this.menuId,
  });

  @override
  ConsumerState<EditMenu> createState() => _EditMenuState();
}

class _EditMenuState extends ConsumerState<EditMenu> {
  late final TextEditingController _itemShortNameController;
  late final TextEditingController _itemDisplayNameController;
  late final TextEditingController _itemDescriptionController;
  late final TextEditingController _itemPriceController;

  @override
  void initState() {
    _itemShortNameController = TextEditingController();
    _itemDisplayNameController = TextEditingController();
    _itemDescriptionController = TextEditingController();
    _itemPriceController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _itemShortNameController.dispose();
    _itemDisplayNameController.dispose();
    _itemDescriptionController.dispose();
    _itemPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AsyncBuilder(
      selector: (final ref) =>
          ref.watch(menuInfoProvider(widget.restaurantId, widget.menuId)),
      builder: (context, menu) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        onPressed: () async {
                                          _itemShortNameController.text =
                                              item.shortName;
                                          _itemDisplayNameController.text =
                                              item.displayName;
                                          _itemDescriptionController.text =
                                              item.description;
                                          _itemPriceController.text =
                                              item.price;

                                          await showDialog<void>(
                                            context: context,
                                            builder: (final context) =>
                                                AlertDialog(
                                              title:
                                                  const Text("Edit Menu Item"),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  TextField(
                                                    controller:
                                                        _itemShortNameController,
                                                    decoration:
                                                        const InputDecoration(
                                                      label: Text(
                                                          "Item Short Name"),
                                                      border:
                                                          UnderlineInputBorder(),
                                                    ),
                                                  ),
                                                  TextField(
                                                    controller:
                                                        _itemDisplayNameController,
                                                    decoration:
                                                        const InputDecoration(
                                                      label: Text("Item Name"),
                                                      border:
                                                          UnderlineInputBorder(),
                                                    ),
                                                  ),
                                                  TextField(
                                                    controller:
                                                        _itemDescriptionController,
                                                    decoration:
                                                        const InputDecoration(
                                                      label: Text(
                                                          "Item Description"),
                                                      border:
                                                          UnderlineInputBorder(),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  TextField(
                                                    controller:
                                                        _itemPriceController,
                                                    decoration:
                                                        const InputDecoration(
                                                      label: Text("Item Price"),
                                                      border:
                                                          UnderlineInputBorder(),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                ],
                                              ),
                                              actions: [
                                                OutlinedButton(
                                                  onPressed: () async {
                                                    await getApiService<
                                                            ItemService>()
                                                        .update(
                                                      restaurantId:
                                                          widget.restaurantId,
                                                      menuId: widget.menuId,
                                                      itemId: item.id,
                                                      displayName:
                                                          _itemDisplayNameController
                                                              .text,
                                                      shortName:
                                                          _itemShortNameController
                                                              .text,
                                                      description:
                                                          _itemDescriptionController
                                                              .text,
                                                      price:
                                                          _itemPriceController
                                                              .text,
                                                    );

                                                    ref.invalidate(
                                                        menuInfoProvider(
                                                            widget.restaurantId,
                                                            widget.menuId));

                                                    if (context.mounted) {
                                                      Navigator.pop(context);
                                                    }
                                                  },
                                                  child: const Text("Save"),
                                                ),
                                                OutlinedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text("Cancel"),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                        icon: const Icon(Icons.edit),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          await getApiService<ItemService>()
                                              .delete(
                                            restaurantId: widget.restaurantId,
                                            menuId: widget.menuId,
                                            itemId: item.id,
                                          );

                                          ref.invalidate(menuInfoProvider(
                                              widget.restaurantId,
                                              widget.menuId));
                                        },
                                        icon: const Icon(Icons.delete),
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
