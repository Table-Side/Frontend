import 'package:flutter/material.dart';
import 'package:table_side/components/CustomAppBar.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO(A): GET DATA FROM DB
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
                            // TODO: FOR LOOP WILL BE ADJUSTED TO GO THROUGH THE LIST OF MENU ITEMS FROM DB
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
                                                // TODO(A): GET DATA FROM DB
                                                Text(
                                                  "Item Name",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),

                                                // TODO(A): GET DATA FROM DB
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
                                                        content: const Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            TextField(
                                                              decoration:
                                                                  InputDecoration(
                                                                label: Text(
                                                                    "Item Name"),
                                                                border:
                                                                    UnderlineInputBorder(),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 20),
                                                            TextField(
                                                              decoration:
                                                                  InputDecoration(
                                                                label: Text(
                                                                    "Item Price"),
                                                                border:
                                                                    UnderlineInputBorder(),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 20),
                                                          ],
                                                        ),
                                                        actions: [
                                                          OutlinedButton(
                                                            onPressed:
                                                                () async {
                                                              // TODO(A): MAKE PATCH/PUT REQUEST
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
                                                    // TODO(A): MAKE DELETE REQUEST
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
