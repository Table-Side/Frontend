import 'package:chopper/chopper.dart';
import 'package:http/src/base_response.dart';
import 'package:table_side/models/api.dart';

part 'restaurants.chopper.dart';

@ChopperApi(baseUrl: 'https://api.tableside.site/restaurants')
abstract class RestaurantsService extends ChopperService {
  static RestaurantsService create([final ChopperClient? client]) =>
      _$RestaurantsService(client);

  // get all restaurants
  @Get(path: '/all', headers: {
    "Content-Type": "application/json",
    "Access-Control-Allow-Origin": "*",
    "Referrer-Policy": "no-referrer",
  })
  Future<RawApiResponse> getAllRestaurants();
}
