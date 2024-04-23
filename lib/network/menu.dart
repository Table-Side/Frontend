import 'package:chopper/chopper.dart';
import 'package:table_side/const/api.dart';
import 'package:table_side/models/api.dart';

part 'menu.chopper.dart';

@ChopperApi(baseUrl: '$kApiBaseUrl/restaurants')
abstract class MenuService extends ChopperService {
  static MenuService $create([final ChopperClient? client]) =>
      _$MenuService(client);

  /// List all menus for a restaurant
  @Get(path: '/{restaurantId}/menus')
  Future<RawResponse> getAll({
    @Path('restaurantId') required String restaurantId,
  });

  /// Get a specific menu by ID
  @Get(path: '/{restaurantId}/menus/{menuId}')
  Future<RawResponse> get({
    @Path('restaurantId') required String restaurantId,
    @Path('menuId') required String menuId,
  });

  /// Create a new menu
  @FactoryConverter(request: JsonConverter.requestFactory)
  @Put(path: '/{restaurantId}/menus')
  Future<RawResponse> create({
    @Path('restaurantId') required String restaurantId,
    @Field('name') required String name,
  });

  /// Update a menu
  @FactoryConverter(request: JsonConverter.requestFactory)
  @Patch(path: '/{restaurantId}/menus/{menuId}')
  Future<RawResponse> update({
    @Path('restaurantId') required String restaurantId,
    @Path('menuId') required String menuId,
    @Field('name') required String name,
  });

  /// Delete a menu
  @Delete(path: '/{restaurantId}/menus/{menuId}')
  Future<void> delete({
    @Path('restaurantId') required String restaurantId,
    @Path('menuId') required String menuId,
  });
}
