import 'package:chopper/chopper.dart';

part 'authentication.chopper.dart';

@ChopperApi(baseUrl: '/authenticate')
abstract class AuthenticationService extends ChopperService {
  static AuthenticationService create([final ChopperClient? client]) =>
      _$AuthenticationService(client);

  @Post(path: '/login')
  Future<Response<Map<String, dynamic>>> login({
    @Field() required final String email,
    @Field() required final String password,
  });

  @Post(path: '/logout', optionalBody: true)
  Future<Response<void>> logout();
}
