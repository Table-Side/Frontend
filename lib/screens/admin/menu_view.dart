import 'package:flutter/material.dart';
import 'package:table_side/components/CustomAppBar.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  late final TextEditingController _itemNameController;
  late final TextEditingController _itemPriceController;

  @override
  void initState() {
    _itemNameController = TextEditingController();
    _itemPriceController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _itemNameController.dispose();
    _itemPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Menu'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 40),
                child: Container(
                  color: Colors.grey.withOpacity(0.2),
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            // TODO: Will loop through the list of menu items from db
                            for (int i = 0; i < 15; i++)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Column(
                                              children: [
                                                SizedBox(height: 15),
                                                // TODO: Get data from db
                                                Text(
                                                  "Item Name",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),

                                                // TODO: Get data from db
                                                Text(
                                                  "Item Price",
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(height: 15),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                IconButton(
                                                  onPressed: () async {
                                                    await showDialog<void>(
                                                      context: context,
                                                      builder:
                                                          (final context) =>
                                                              AlertDialog(
                                                        title: const Text(
                                                            "Edit Menu Item"),
                                                        content: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            TextField(
                                                              controller:
                                                                  _itemNameController,
                                                              decoration:
                                                                  const InputDecoration(
                                                                label: Text(
                                                                    "Item Name"),
                                                                border:
                                                                    UnderlineInputBorder(),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 20),
                                                            TextField(
                                                              controller:
                                                                  _itemPriceController,
                                                              decoration:
                                                                  const InputDecoration(
                                                                label: Text(
                                                                    "Item Price"),
                                                                border:
                                                                    UnderlineInputBorder(),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 20),
                                                          ],
                                                        ),
                                                        actions: [
                                                          OutlinedButton(
                                                            onPressed:
                                                                () async {
                                                              // TODO: Make patch request to update menu item
                                                              // make request with _itemNameController.text and _itemPriceController.text
                                                            },
                                                            child: const Text(
                                                                "Save"),
                                                          ),
                                                          OutlinedButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                "Cancel"),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  icon: const Icon(Icons.edit),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    // TODO: Make delete request to delete menu item
                                                  },
                                                  icon:
                                                      const Icon(Icons.delete),
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
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
