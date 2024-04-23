import 'package:chopper/chopper.dart';
import 'package:table_side/const/api.dart';
import 'package:table_side/models/api.dart';

part 'restaurant.chopper.dart';

@ChopperApi(baseUrl: '$kApiBaseUrl/restaurants')
abstract class RestaurantService extends ChopperService {
  static RestaurantService $create([final ChopperClient? client]) =>
      _$RestaurantService(client);

  /// List all restaurants
  @Get(path: '/')
  Future<RawResponse> getAll();

  /// Get a specific restaurant by ID
  @Get(path: '/{restaurantId}')
  Future<RawResponse> get({
    @Path('restaurantId') required String id,
  });

  /// Create a new restaurant
  @FactoryConverter(request: JsonConverter.requestFactory)
  @Put(path: '/')
  Future<RawResponse> create({
    @Field('name') required String name,
    @Field('description') required String description,
  });

  /// Update a restaurant
  @FactoryConverter(request: JsonConverter.requestFactory)
  @Patch(path: '/{restaurantId}')
  Future<RawResponse> update({
    @Path('restaurantId') required String id,
    @Field('name') required String name,
    @Field('description') required String description,
  });

  /// Delete a restaurant
  @Delete(path: '/{restaurantId}')
  Future<void> delete({
    @Path('restaurantId') required String id,
  });
}
