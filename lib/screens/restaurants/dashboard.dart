import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_side/components/custom_app_bar.dart';
import 'package:table_side/components/restaurant_card.dart';
import 'package:table_side/provider/restaurant_provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Table Side'),
      body: Consumer(
        builder: (final context, final ref, final child) {
          final restaurantsState = ref.watch(restaurantsProvider);

          if (restaurantsState.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final restaurants = restaurantsState.value;

          if (restaurants == null || restaurants.isEmpty) {
            return const Center(
              child: Text(
                "No Restaurants",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            );
          }

          return Container(
            color: Colors.white,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox(
                  height: constraints.maxHeight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      // title
                                      const Padding(
                                        padding: EdgeInsets.only(left: 80.0),
                                        child: Text(
                                          "All Restaurants",
                                          style: TextStyle(fontSize: 40),
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 10,
                                      ),

                                      // list of restaurants
                                      SingleChildScrollView(
                                        child: Center(
                                          child: Wrap(
                                            children: [
                                              const SizedBox(height: 20),
                                              for (final restaurant
                                                  in restaurants) ...[
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: RestaurantCard(
                                                      restaurant: restaurant),
                                                ),
                                                const SizedBox(height: 20),
                                              ],
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
