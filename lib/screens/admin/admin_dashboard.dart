import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_side/components/async_builder.dart';
import 'package:table_side/components/custom_app_bar.dart';
import 'package:table_side/const/design.dart';
import 'package:table_side/locator.dart';
import 'package:table_side/network/restaurant.dart';
import 'package:table_side/provider/menu_provider.dart';
import 'package:table_side/provider/restaurant_provider.dart';
import 'package:table_side/screens/admin/add_new_menu_item.dart';
import 'package:table_side/screens/admin/menu_view.dart';

class AdminDashboard extends ConsumerStatefulWidget {
  const AdminDashboard({super.key});

  @override
  ConsumerState<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends ConsumerState<AdminDashboard> {
  final TextEditingController _aboutUsController = TextEditingController();

  @override
  void dispose() {
    _aboutUsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AsyncBuilder(
      selector: (final ref) => ref.watch(primaryOwnedRestaurantProvider),
      builder: (context, final restaurant) {
        if (restaurant == null) {
          return const Scaffold(
            body: Center(
              child: Text("You do not own any restaurants"),
            ),
          );
        }

        return Scaffold(
          appBar: CustomAppBar(text: "${restaurant.name} - Admin Dashboard"),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.grey.withOpacity(0.2),
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Edit About Us",
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 15),
                                      Expanded(
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.4,
                                          child: ListView(
                                            shrinkWrap: true,
                                            children: [
                                              Text(
                                                restaurant.description,
                                                style: const TextStyle(
                                                    fontSize: 25),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: MaterialButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          color: purpleColor,
                                          minWidth: 200,
                                          onPressed: () {
                                            _aboutUsController.text =
                                                restaurant.description;
                                            showDialog(
                                              context: context,
                                              builder: (final context) =>
                                                  AlertDialog(
                                                title:
                                                    const Text("Edit About Us"),
                                                content: TextFormField(
                                                  controller:
                                                      _aboutUsController,
                                                  decoration:
                                                      const InputDecoration(
                                                    labelText: "Enter About Us",
                                                    border:
                                                        UnderlineInputBorder(),
                                                  ),
                                                ),
                                                actions: [
                                                  OutlinedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text("Cancel"),
                                                  ),
                                                  OutlinedButton(
                                                    onPressed: () async {
                                                      await getApiService<
                                                              RestaurantService>()
                                                          .update(
                                                              id: restaurant.id,
                                                              name: restaurant
                                                                  .name,
                                                              description:
                                                                  _aboutUsController
                                                                      .text);
                                                      ref.invalidate(
                                                          ownedRestaurantsProvider);

                                                      if (context.mounted) {
                                                        Navigator.pop(context);
                                                      }
                                                    },
                                                    child: const Text("Save"),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              "Edit Text",
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
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.grey.withOpacity(0.2),
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 30.0),
                                        child: Text(
                                          "Menu",
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0, top: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        // Open menu to view items and edit/remove individual items
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                MenuView(
                                                                    restaurantId:
                                                                        restaurant
                                                                            .id),
                                                          ),
                                                        );
                                                      },
                                                      child: Material(
                                                        color: Colors.white,
                                                        child: Center(
                                                          child: Ink(
                                                            width: constraints
                                                                    .maxWidth *
                                                                0.25,
                                                            height: constraints
                                                                    .maxHeight *
                                                                0.5,
                                                            decoration:
                                                                ShapeDecoration(
                                                              color:
                                                                  purpleColor,
                                                              shape: Border.all(
                                                                color:
                                                                    purpleColor,
                                                                width: 5.0,
                                                              ),
                                                            ),
                                                            child: const Center(
                                                              child: Text(
                                                                "View Menu",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        30,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 50),
                                                    AsyncBuilder(
                                                      selector:
                                                          (final ref) =>
                                                              ref.watch(
                                                                  menusProvider(
                                                                      restaurant
                                                                          .id)),
                                                      builder:
                                                          (context, menus) =>
                                                              GestureDetector(
                                                        onTap: () async {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  AddNewMenuItem(
                                                                      restaurantId:
                                                                          restaurant
                                                                              .id,
                                                                      menuId: menus
                                                                          .first
                                                                          .id),
                                                            ),
                                                          );
                                                        },
                                                        child: Material(
                                                          color: Colors.white,
                                                          child: Center(
                                                            child: Ink(
                                                              width: constraints
                                                                      .maxWidth *
                                                                  0.25,
                                                              height: constraints
                                                                      .maxHeight *
                                                                  0.5,
                                                              decoration:
                                                                  ShapeDecoration(
                                                                color:
                                                                    purpleColor,
                                                                shape:
                                                                    Border.all(
                                                                  color:
                                                                      purpleColor,
                                                                  width: 5.0,
                                                                ),
                                                              ),
                                                              child:
                                                                  const Center(
                                                                child: Text(
                                                                  "Add New Item to Menu",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          30,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.grey.withOpacity(0.2),
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 30.0),
                                        child: Text(
                                          "Orders",
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0, top: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        // TODO: Open list of orders
                                                      },
                                                      child: Material(
                                                        color: Colors.white,
                                                        child: Center(
                                                          child: Ink(
                                                            width: constraints
                                                                    .maxWidth *
                                                                0.25,
                                                            height: constraints
                                                                    .maxHeight *
                                                                0.5,
                                                            decoration:
                                                                ShapeDecoration(
                                                              color:
                                                                  purpleColor,
                                                              shape: Border.all(
                                                                color:
                                                                    purpleColor,
                                                                width: 5.0,
                                                              ),
                                                            ),
                                                            child: const Center(
                                                              child: Text(
                                                                "View Current Orders",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        30,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 50),
                                                    GestureDetector(
                                                      onTap: () {
                                                        // TODO: Open list of completed orders
                                                      },
                                                      child: Material(
                                                        color: Colors.white,
                                                        child: Center(
                                                          child: Ink(
                                                            width: constraints
                                                                    .maxWidth *
                                                                0.25,
                                                            height: constraints
                                                                    .maxHeight *
                                                                0.5,
                                                            decoration:
                                                                ShapeDecoration(
                                                              color:
                                                                  purpleColor,
                                                              shape: Border.all(
                                                                color:
                                                                    purpleColor,
                                                                width: 5.0,
                                                              ),
                                                            ),
                                                            child: const Center(
                                                              child: Text(
                                                                "View Completed Orders",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        30,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
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
      },
    );
  }
}
