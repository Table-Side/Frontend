import 'package:chopper/chopper.dart';
import 'package:get_it/get_it.dart';
import 'package:table_side/const/api.dart';
import 'package:table_side/network/authentication.dart';
import 'package:table_side/network/item.dart';
import 'package:table_side/network/kitchen.dart';
import 'package:table_side/network/menu.dart';
import 'package:table_side/network/network.dart';
import 'package:table_side/network/order.dart';
import 'package:table_side/network/restaurant.dart';
import 'package:table_side/network/user.dart';
import 'package:table_side/utils/auth_context_interceptor.dart';
import 'package:table_side/utils/jwt_auth_context_interceptor.dart';
import 'package:table_side/utils/oidc_auth_context_interceptor.dart';

final locator = GetIt.instance;

T getApiService<T extends ChopperService>() {
  return locator.get<ChopperClient>().getService<T>();
}

JwtAuthContext getApiAuthenticator() =>
    locator.get<JwtAuthContext>(instanceName: "authenticator");

Future<void> setupLocator() async {
  final authenticator = JwtAuthContext(
    storageKey: 'tableside.auth',
    skipAuthenticationFilters: const [
      // Skip authentication for the /token endpoint (used to obtain a new token
      // for authentication).
      SkipAuthentication(
        domain: 'auth.tableside.site',
        entirePath: '$kOIDCEndpoint/token',
      ),
    ],
    accessManager: JwtBearerTokenAccessManager(),
    refreshManager: OidcJwtRefreshManager(
      baseUrl: kOIDCBaseUrl,
      clientId: kOIDCClientID,
      clientSecret: kOIDCClientSecret,
      scope: kOIDCScope,
    ),
  );

  await authenticator.loadFromStorage();

  locator.registerSingleton(authenticator, instanceName: "authenticator");
  locator.registerSingleton(
    setUpClient(
      authenticator: authenticator,
      services: [
        AuthenticationService.$create(),
        RestaurantService.$create(),
        MenuService.$create(),
        ItemService.$create(),
        UserService.$create(),
        OrderService.$create(),
        KitchenService.$create(),
      ],
    ),
  );
}
