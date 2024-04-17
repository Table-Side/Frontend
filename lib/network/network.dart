import 'package:chopper/chopper.dart';
import 'package:table_side/provider/authentication_provider.dart';

ChopperClient setUpClient({required final Iterable<ChopperService> services}) {
  return ChopperClient(
    baseUrl: Uri.parse('http://localhost:3000/'),
    services: services,
    converter: const JsonConverter(),
    errorConverter: const JsonConverter(),
    interceptors: [
      (final Request request) async {
        if (request.uri.path == '/authenticate/login') return request;

        final currentSession = Authentication.instance.getCurrentSession();

        if (currentSession != null) {
          // Check if the token is expired
          if (currentSession.isExpired()) {
            print("Token expired. Refreshing...");

            // Todo: Refresh session
            await Authentication.instance.refreshSession();
          }

          // Add the access token to the request header
          return applyHeader(
            request,
            "Authorization",
            'Bearer ${currentSession.accessToken}',
            override: false,
          );
        }

        return request;
      },
    ],
  );
}
