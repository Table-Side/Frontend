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
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            //todo: for all restaurants, display option card
                                            for (var i = 0; i < 30; i++)
                                              RestaurantCard(
                                                label: "McDonalds",
                                                onTap: () {
                                                  // TODO(A): FIX RESTAURANT TO ROUTE PROPERLY
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const RestaurantView()),
                                                  );
                                                },
                                                height: 165,
                                                width: 200,
                                              ), //TODO: need to pass in restaurant details
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
                            // color: Colors.orange,
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
                                          // TODO(A): GET DATA FROM DB
                                          child: RestaurantCard(
                                            label: "McDonalds",
                                            // TODO(A): FIX RESTAURANT TO ROUTE PROPERLY
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
