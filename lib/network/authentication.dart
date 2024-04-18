import 'package:chopper/chopper.dart';
import 'package:table_side/provider/authentication_provider.dart';

part 'authentication.chopper.dart';

// const baseUrl = 'https://auth.tableside.site';
const realm = 'Tableside';
const clientId = 'apisix';
const grantType = 'password';
const scope = 'openid';
const clientSecret = '97WttOkNUXpZ9syENIBNhkXssmMKUUzd';

// @ChopperApi(baseUrl: "https://auth.tableside.site/realms/Tableside")
@ChopperApi()
abstract class AuthenticationService extends ChopperService {
  @Get(
    path:
        'https://auth.tableside.site/realms/Tableside/protocol/openid-connect/userinfo',
  )
  @formUrlEncoded
  Future<Response<Map<String, dynamic>>> getCurrentUser(
    @Header('Authorization') String accessToken,
  );

  // Define a method to obtain access token
  @Post(
      path:
          'https://auth.tableside.site/realms/Tableside/protocol/openid-connect/token')
  @formUrlEncoded
  Future<Response<Map<String, dynamic>>> login(
      @Body() Map<String, String> fields);

  // Factory method to create the service instance
  static AuthenticationService create() {
    final client = ChopperClient(
      services: [_$AuthenticationService()],
      // Set the FormUrlEncodedConverter here
      converter: const FormUrlEncodedConverter(),
    );
    return _$AuthenticationService(client);
  }

  // Logout
  @Post(path: '', optionalBody: true)
  Future<Response<void>> logout();
}
