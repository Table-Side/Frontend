import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:table_side/components/custom_app_bar.dart';
import 'package:table_side/const/design.dart';
import 'package:table_side/locator.dart';
import 'package:table_side/network/item.dart';
import 'package:table_side/provider/menu_provider.dart';
import 'package:table_side/screens/admin/menu_view.dart';

class AddNewMenuItem extends ConsumerStatefulWidget {
  final String restaurantId;
  final String menuId;

  const AddNewMenuItem({
    super.key,
    required this.restaurantId,
    required this.menuId,
  });

  @override
  ConsumerState<AddNewMenuItem> createState() => _AddNewMenuItemState();
}

class _AddNewMenuItemState extends ConsumerState<AddNewMenuItem> {
  final TextEditingController _itemShortNameController =
      TextEditingController();
  final TextEditingController _itemDisplayNameController =
      TextEditingController();
  final TextEditingController _itemDescriptionController =
      TextEditingController();
  final TextEditingController _itemPriceController = TextEditingController();

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
    return Scaffold(
      appBar: const CustomAppBar(text: 'Add New Menu Item'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 40),
              child: Container(
                color: Colors.grey.withOpacity(0.2),
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextFormField(
                                      controller: _itemShortNameController,
                                      decoration: const InputDecoration(
                                        labelText: "Item Short Name",
                                        border: UnderlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(height: 50),
                                    TextFormField(
                                      controller: _itemDisplayNameController,
                                      decoration: const InputDecoration(
                                        labelText: "Item Name",
                                        border: UnderlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(height: 50),
                                    TextFormField(
                                      controller: _itemDescriptionController,
                                      decoration: const InputDecoration(
                                        labelText: "Item Description",
                                        border: UnderlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(height: 50),
                                    TextFormField(
                                      controller: _itemPriceController,
                                      decoration: const InputDecoration(
                                        labelText: "Item Price",
                                        border: UnderlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(height: 60),
                                    MaterialButton(
                                      color: purpleColor,
                                      onPressed: () async {
                                        await getApiService<ItemService>()
                                            .create(
                                          restaurantId: widget.restaurantId,
                                          menuId: widget.menuId,
                                          displayName:
                                              _itemDisplayNameController.text,
                                          shortName:
                                              _itemShortNameController.text,
                                          description:
                                              _itemDescriptionController.text,
                                          price: _itemPriceController.text,
                                        );

                                        ref.invalidate(menuInfoProvider(
                                            widget.restaurantId,
                                            widget.menuId));

                                        if (context.mounted) {
                                          context.pop();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MenuView(
                                                  restaurantId:
                                                      widget.restaurantId),
                                            ),
                                          );
                                        }
                                      },
                                      minWidth:
                                          MediaQuery.of(context).size.width *
                                              0.2,
                                      child: const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(
                                          "Add Item",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 35,
                                              color: Colors.white),
                                        ),
                                      ),
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
