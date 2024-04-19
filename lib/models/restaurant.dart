class RestaurantDetails {
  final String id;
  // final UserDetails restaurantOwner;
  final String name;
  final String description;

  RestaurantDetails({
    required this.id,
    // required this.restaurantOwner,
    required this.name,
    required this.description,
  });

  factory RestaurantDetails.fromJson(Map<String, dynamic> json) {
    return RestaurantDetails(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}

class Item {
  final String id;
  final String itemName;
  final String description;
  final int price;
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
  final RestaurantDetails restaurant;

  Menu({
    required this.id,
    required this.menuTitle,
    required this.items,
    required this.restaurant,
  });
}
