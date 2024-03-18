import 'dart:ffi';

import 'package:table_side/models/user.dart';

// TODO: WILL PROBABLY CHANGE

class Restaurant {
  final String id;
  final User restaurantOwner;
  final String restaurantName;
  final String description;
  final DateTime openingHours;
  final DateTime closingHours;

  Restaurant({
    required this.id,
    required this.restaurantOwner,
    required this.restaurantName,
    required this.description,
    required this.openingHours,
    required this.closingHours,
  });
}

class Item {
  final String id;
  final String itemName;
  final String description;
  final Int price;
  final bool availability;

  Item({
    required this.id,
    required this.itemName,
    required this.description,
    required this.price,
    required this.availability,
  });
}

class Menu {
  final String id;
  final String menuTitle;
  final List<Item> items;
  final Restaurant restaurant;

  Menu({
    required this.id,
    required this.menuTitle,
    required this.items,
    required this.restaurant,
  });
}

class RestaurantTable {
  final String id;
  final User user;
  final Int amountGuest;
  final Restaurant restaurant;

  RestaurantTable({
    required this.id,
    required this.user,
    required this.amountGuest,
    required this.restaurant,
  });
}
