import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_side/components/custom_app_bar.dart';
import 'package:table_side/components/async_builder.dart';
import 'package:table_side/const/design.dart';
import 'package:table_side/models/restaurant.dart';
import 'package:table_side/provider/menu_provider.dart';
import 'package:table_side/provider/restaurant_provider.dart';
import 'package:table_side/screens/restaurants/order.dart';

class RestaurantView extends ConsumerWidget {
  final String restaurantId;

  const RestaurantView({super.key, required this.restaurantId});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    return AsyncBuilder(
      selector: (final ref) => ref.watch(restaurantInfoProvider(restaurantId)),
      builder: (BuildContext context, Restaurant restaurant) {
        return Scaffold(
          appBar: CustomAppBar(text: restaurant.name),
          body: Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "About Us",
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 15),
                                    Expanded(
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: [
                                            Text(
                                              restaurant.description,
                                              style:
                                                  const TextStyle(fontSize: 25),
                                            ),
                                          ],
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
                  const SizedBox(height: 50),
                  AsyncBuilder(
                    selector: (final ref) =>
                        ref.watch(menusProvider(restaurantId)),
                    builder: (context, menus) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            color: purpleColor,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OrderForm(
                                    restaurantId: restaurantId,
                                    menuId: menus.first.id,
                                  ),
                                ),
                              );
                            },
                            minWidth: MediaQuery.of(context).size.width * 0.2,
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Order",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
