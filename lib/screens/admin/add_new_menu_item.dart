import 'package:flutter/material.dart';
import 'package:table_side/components/CustomAppBar.dart';

class AddNewMenuItem extends StatelessWidget {
  const AddNewMenuItem({super.key});

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
                child: Column(
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
                                      decoration: const InputDecoration(
                                        labelText: "Item Name",
                                        border: UnderlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(height: 50),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: "Item Price",
                                        border: UnderlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(height: 100),
                                    MaterialButton(
                                      color: const Color(0xff5603AD),
                                      onPressed: () {
                                        // TODO: MAKE POST REQUEST
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
