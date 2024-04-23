import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:table_side/components/option_card.dart';
import 'package:table_side/models/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(final BuildContext context) {
    return OptionCard(
      label: restaurant.name,
      onTap: () => context.go('/restaurant/${restaurant.id}/details'),
      height: 200,
      width: 350,
    );
  }
}
