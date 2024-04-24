import 'package:chopper/chopper.dart';
import 'package:table_side/const/api.dart';
import 'package:table_side/models/api.dart';

part 'order.chopper.dart';

@ChopperApi(baseUrl: '$kApiBaseUrl/orders')
abstract class OrderService extends ChopperService {
  static OrderService $create([final ChopperClient? client]) =>
      _$OrderService(client);

  // Create a new order
  @FactoryConverter(request: JsonConverter.requestFactory)
  @Post(path: '/')
  Future<RawResponse> createOrder({
    @Field('restaurantId') required String restaurantId,
    @Field('items') required List<Map<String, dynamic>> items,
  });

// checkout
  @Post(path: '/{orderId}/checkout')
  Future<RawResponse> checkout({
    @Path('orderId') required String orderId,
  });
}
