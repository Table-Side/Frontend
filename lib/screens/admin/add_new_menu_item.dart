import 'package:flutter/material.dart';
import 'package:table_side/components/CustomAppBar.dart';
import 'package:table_side/const/design.dart';

class AddNewMenuItem extends StatefulWidget {
  const AddNewMenuItem({super.key});

  @override
  State<AddNewMenuItem> createState() => _AddNewMenuItemState();
}

class _AddNewMenuItemState extends State<AddNewMenuItem> {
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
                height: MediaQuery.of(context).size.height * 0.4,
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
                                      controller: _itemNameController,
                                      decoration: const InputDecoration(
                                        labelText: "Item Name",
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
                                      onPressed: () {
                                        // TODO: Make post request to add new menu item
                                        // make request with _itemNameController.text and _itemPriceController.text
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
