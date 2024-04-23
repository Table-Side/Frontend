import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@immutable
@freezed
class Restaurant with _$Restaurant {
  const factory Restaurant({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String name,
    required String description,

    /// The menus of the restaurant.
    ///
    /// This is null unless it is populated by a specific API call. If this is
    /// ever null, it means that the menus have not been fetched. Simply use
    /// an API call that populates this field to get the menus:
    ///
    /// - `/restaurants/:restaurantId` (GET: get specific restaurant)
    List<Menu>? menus,
  }) = _Restaurant;

  factory Restaurant.fromJson(final Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}

/// A [Restaurant] menu.
@immutable
@freezed
class Menu with _$Menu {
  const factory Menu({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String name,
    required String restaurantId,

    /// The items on the menu.
    ///
    /// This is null unless it is populated by a specific API call. If this is
    /// ever null, it means that the items have not been fetched. Simply use
    /// an API call that populates this field to get the items:
    ///
    /// - `/restaurants/:restaurantId/menus/:menuId` (GET: get specific menu)
    List<Item>? items,
  }) = _Menu;

  factory Menu.fromJson(final Map<String, dynamic> json) =>
      _$MenuFromJson(json);
}

/// An individual, order-able, item on a [Menu].
@immutable
@freezed
class Item with _$Item {
  const factory Item({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String displayName,
    required String shortName,
    required String description,
    required String price,
    required bool isAvailable,
    required String menuId,
  }) = _Item;

  factory Item.fromJson(final Map<String, dynamic> json) =>
      _$ItemFromJson(json);
}
