import 'package:flutter/material.dart';
import 'package:table_side/components/CustomAppBar.dart';

// TODO: ALL VALUES HARDCODED ATM NEEDS TO BE CHANGED TO USE VALUES FROM DB

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: "Restaurant Name - Admin Dashboard"),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: Container(
                          color: Colors.grey.withOpacity(0.2),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "About Us",
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 15),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        child: Column(
                                          children: [
                                            const Text(
                                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed "
                                              "do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                                              "Aliquet risus feugiat in ante metus dictum at tempor. Lobortis "
                                              "elementum nibh tellus molestie nunc non blandit massa.",
                                              style: TextStyle(fontSize: 25),
                                            ),
                                            const SizedBox(height: 100),
                                            MaterialButton(
                                              color: const Color(0xff5603AD),
                                              minWidth: 200,
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (final context) =>
                                                      AlertDialog(
                                                    title: const Text(
                                                        "Edit About Us"),
                                                    content: TextFormField(
                                                      decoration:
                                                          const InputDecoration(
                                                        labelText:
                                                            "Enter About Us",
                                                        border:
                                                            UnderlineInputBorder(),
                                                      ),
                                                    ),
                                                    actions: [
                                                      OutlinedButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
                                                            "Cancel"),
                                                      ),
                                                      OutlinedButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child:
                                                            const Text("Save"),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                              child: const Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Text(
                                                  "About Us",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 30,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      color: const Color(0xff5603AD)
                                          .withOpacity(0.2),
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.55,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Column(
                                          children: [
                                            const Text(
                                              "Opening Times",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 10),
                                            const Text(
                                                "this will be the times"),
                                            const SizedBox(height: 15),
                                            const Text(
                                              "Location",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 10),
                                            const Text(
                                                "this will be the location"),
                                            const SizedBox(height: 15),
                                            const Text(
                                              "Type of Cuisine",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 10),
                                            const Text(
                                                "this will be the type of cuisine served"),
                                            const SizedBox(height: 150),
                                            MaterialButton(
                                              color: const Color(0xff5603AD),
                                              minWidth: 200,
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (final context) =>
                                                      AlertDialog(
                                                    title: const Text(
                                                        "Edit Details"),
                                                    content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        TextFormField(
                                                          decoration:
                                                              const InputDecoration(
                                                            labelText:
                                                                "Opening Times",
                                                            border:
                                                                UnderlineInputBorder(),
                                                          ),
                                                        ),
                                                        TextFormField(
                                                          decoration:
                                                              const InputDecoration(
                                                            labelText:
                                                                "Location",
                                                            border:
                                                                UnderlineInputBorder(),
                                                          ),
                                                        ),
                                                        TextFormField(
                                                          // TODO: CAN MAKE THIS INTO A DROPDOWN MENU
                                                          decoration:
                                                              const InputDecoration(
                                                            labelText:
                                                                "Type of Cuisine Available",
                                                            border:
                                                                UnderlineInputBorder(),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    actions: [
                                                      OutlinedButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
                                                            "Cancel"),
                                                      ),
                                                      OutlinedButton(
                                                        onPressed: () {
                                                          // TODO: PATCH/PUT REQUEST
                                                        },
                                                        child:
                                                            const Text("Save"),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                              child: const Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Text(
                                                  "Edit Details",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 30,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: Container(
                          color: Colors.grey.withOpacity(0.2),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Menu",
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 15),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 80,
                                            right: 80,
                                            top: 20,
                                            bottom: 20),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                // TODO: OPEN MENU TO VIEW ITEMS AND EDIT/REMOVE INDIVIDUAL ITEMS
                                              },
                                              child: Material(
                                                color: Colors.white,
                                                child: Center(
                                                  child: Ink(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.2,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.4,
                                                    decoration: ShapeDecoration(
                                                      color: const Color(
                                                          0xff5603AD),
                                                      shape: Border.all(
                                                        color: const Color(
                                                            0xff5603AD),
                                                        width: 5.0,
                                                      ),
                                                    ),
                                                    child: const Icon(
                                                      Icons.menu_book_outlined,
                                                      color: Colors.white,
                                                      size: 70,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 50),
                                            GestureDetector(
                                              onTap: () {
                                                // TODO: OPEN FORM TO ADD NEW MENU ITEM
                                              },
                                              child: Material(
                                                color: Colors.white,
                                                child: Center(
                                                  child: Ink(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.2,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.4,
                                                    decoration: ShapeDecoration(
                                                      color: const Color(
                                                          0xff5603AD),
                                                      shape: Border.all(
                                                        color: const Color(
                                                            0xff5603AD),
                                                        width: 5.0,
                                                      ),
                                                    ),
                                                    child: const Icon(
                                                      Icons.edit_note_outlined,
                                                      color: Colors.white,
                                                      size: 70,
                                                    ),
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          )
        ],
      ),
    );
  }
}
