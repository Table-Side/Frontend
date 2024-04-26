import 'package:chopper/chopper.dart';
import 'package:table_side/const/api.dart';
import 'package:table_side/models/api.dart';

part 'authentication.chopper.dart';

@ChopperApi(baseUrl: kOIDCBaseUrl)
abstract class AuthenticationService extends ChopperService {
  // Factory method to create the service instance
  static AuthenticationService $create() {
    final client = ChopperClient(
      services: [_$AuthenticationService()],
      converter: const FormUrlEncodedConverter(),
    );
    return _$AuthenticationService(client);
  }

  /// Get the current user
  @Get(path: '/userinfo')
  @FormUrlEncoded()
  Future<RawResponse> getCurrentUser();

  /// Obtain access token
  @Post(path: '/token')
  @FormUrlEncoded()
  Future<RawResponse> login({
    @Field() required String username,
    @Field() required String password,
    @Field('client_id') String clientId = kOIDCClientID,
    @Field('client_secret') String clientSecret = kOIDCClientSecret,
    @Field('grant_type') String grantType = 'password',
    @Field('scope') String scope = kOIDCScope,
  });

  /// Logout the current user
  @Post(path: '/', optionalBody: true)
  Future<Response<void>> logout();
}
