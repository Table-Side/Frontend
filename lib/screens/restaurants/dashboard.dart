import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:table_side/components/CustomAppBar.dart';
import 'package:table_side/components/restaurant_card.dart';
import 'package:table_side/screens/restaurants/restaurant_view.dart';

// TODO: fetch restaurants from db

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Table Side'),
      body: Container(
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
                          SizedBox(
                            height: 250,
                            child: Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const Text(
                                      "Recent Restaurants",
                                      style: TextStyle(fontSize: 40),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                      // TODO: NEED TO CHECK IF THIS CAN BE DONE - if yes get data from db else remove
                                      // Recent restaurants
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            // TODO: Get data from db
                                            for (var i = 0; i < 30; i++)
                                              RestaurantCard(
                                                label: "McDonalds",
                                                onTap: () {
                                                  // TODO: Fix route
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const RestaurantView()),
                                                  );
                                                },
                                                height: 165,
                                                width: 200,
                                              ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // title
                                  const Text(
                                    "All Restaurants",
                                    style: TextStyle(fontSize: 40),
                                  ),

                                  const SizedBox(
                                    height: 10,
                                  ),

                                  // list of restaurants
                                  Wrap(
                                    children: [
                                      for (var i = 0; i < 30; i++)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          // TODO: Get data from db
                                          child: RestaurantCard(
                                            label: "McDonalds",
                                            // TODO: Fix route
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const RestaurantView()),
                                              );
                                            },
                                            height: 250,
                                            width: 350,
                                          ),
                                        ),
                                    ],
                                  )
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
      ),
    );
  }
}
