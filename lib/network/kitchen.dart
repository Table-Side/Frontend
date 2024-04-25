import 'package:chopper/chopper.dart';
import 'package:table_side/const/api.dart';
import 'package:table_side/models/api.dart';

part 'kitchen.chopper.dart';

@ChopperApi(baseUrl: '$kApiBaseUrl/kitchen')
abstract class KitchenService extends ChopperService {
  static KitchenService $create([final ChopperClient? client]) =>
      _$KitchenService(client);

  ///List of all orders for a restaurant
  @Get(path: '/{restaurantId}')
  Future<RawResponse> getAll({
    @Path('restaurantId') required String restaurantId,
  });

  /// Get specific order by ID
  @Get(path: '/{restaurantId}/{orderId}')
  Future<RawResponse> get({
    @Path('restaurantId') required String restaurantId,
    @Path('orderId') required String orderId,
  });

  /// Order is complete
  @Put(path: '/{restaurantId}/{orderId}/done')
  Future<RawResponse> done({
    @Path('restaurantId') required String restaurantId,
    @Path('orderId') required String orderId,
  });
}
