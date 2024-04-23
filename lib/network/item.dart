import 'package:chopper/chopper.dart';
import 'package:table_side/const/api.dart';
import 'package:table_side/models/api.dart';

part 'item.chopper.dart';

@ChopperApi(baseUrl: '$kApiBaseUrl/restaurants')
abstract class ItemService extends ChopperService {
  static ItemService $create([final ChopperClient? client]) =>
      _$ItemService(client);

  /// List all items for a menu
  @Get(path: '/{restaurantId}/menus/{menuId}/items')
  Future<RawResponse> getAll({
    @Path('restaurantId') required String restaurantId,
    @Path('menuId') required String menuId,
  });

  /// Add an item to a menu
  @FactoryConverter(request: JsonConverter.requestFactory)
  @Put(path: '/{restaurantId}/menus/{menuId}/items')
  Future<RawResponse> create({
    @Path('restaurantId') required String restaurantId,
    @Path('menuId') required String menuId,
    @Field('displayName') required String displayName,
    @Field('shortName') required String shortName,
    @Field('description') required String description,
    @Field('price') required String price,
  });

  /// Update an item
  @FactoryConverter(request: JsonConverter.requestFactory)
  @Patch(path: '/{restaurantId}/menus/{menuId}/items/{itemId}')
  Future<RawResponse> update({
    @Path('restaurantId') required String restaurantId,
    @Path('menuId') required String menuId,
    @Path('itemId') required String itemId,
    @Field('displayName') required String displayName,
    @Field('shortName') required String shortName,
    @Field('description') required String description,
    @Field('price') required String price,
  });

  /// Mark an item as available or not available
  @FactoryConverter(request: JsonConverter.requestFactory)
  @Patch(path: '/{restaurantId}/menus/{menuId}/items/{itemId}/availability')
  Future<RawResponse> setAvailability({
    @Path('restaurantId') required String restaurantId,
    @Path('menuId') required String menuId,
    @Path('itemId') required String itemId,
    @Field('isAvailable') required bool isAvailable,
  });

  /// Delete an item
  @Delete(path: '/{restaurantId}/menus/{menuId}/items/{itemId}')
  Future<void> delete({
    @Path('restaurantId') required String restaurantId,
    @Path('menuId') required String menuId,
    @Path('itemId') required String itemId,
  });
}
