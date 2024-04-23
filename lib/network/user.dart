import 'package:chopper/chopper.dart';
import 'package:table_side/const/api.dart';
import 'package:table_side/models/api.dart';

part 'user.chopper.dart';

@ChopperApi(baseUrl: '$kApiBaseUrl/restaurants')
abstract class UserService extends ChopperService {
  static UserService $create([final ChopperClient? client]) =>
      _$UserService(client);

  /// List current user's restaurants
  @Get(path: '/mine')
  Future<RawResponse> ownedRestaurants();
}
