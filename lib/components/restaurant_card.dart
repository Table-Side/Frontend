import 'package:flutter/material.dart';
import 'package:table_side/components/option_card.dart';
import 'package:table_side/models/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantDetails restaurant;

  const RestaurantCard({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(final BuildContext context) {
    return OptionCard(
      label: restaurant.name,
      onTap: () {},
      height: 200,
      width: 350,
    );
  }
}
