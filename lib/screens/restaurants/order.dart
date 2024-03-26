import 'package:flutter/material.dart';
import 'package:table_side/components/CustomAppBar.dart';

class OrderForm extends StatelessWidget {
  const OrderForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Order'),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
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
                          const Text(
                            "Menu",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
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
                                              // name - need to get from db
                                              Text(
                                                "Item Name",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),

                                              // price - need to get from db
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
                                                  onPressed: () {
                                                    // TODO(A): MAKE POST REQUEST FOR ITEMS
                                                  },
                                                  icon: const Icon(Icons.add)),
                                              IconButton(
                                                onPressed: () {
                                                  // TODO(A): MAKE DELETE REQUEST
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
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 40),
              child: Container(
                color: Colors.grey.withOpacity(0.2),
                width: MediaQuery.of(context).size.width * 0.3,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const Text(
                            "My Order",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          // TODO: FOR LOOP WILL BE ADJUSTED TO GO THROUGH THE LIST OF MENU ITEMS FROM DB
                          for (int i = 0; i < 5; i++)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Column(
                                          children: [
                                            SizedBox(height: 15),
                                            // name - need to get from db
                                            Text(
                                              "Item Name",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),

                                            // price - need to get from db
                                            Text(
                                              "Item Price",
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(height: 15),
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
                                                  // TODO: VALUE WILL CHANGE BASED ON HOW MANY OF ITEM ADDED
                                                  child: const Center(
                                                      child: Text("1")),
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
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: MaterialButton(
                        color: const Color(0xff5603AD),
                        onPressed: () {
                          // TODO: MAKE POST REQUEST WITH ORDER
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
