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

        final currentUser = await Authentication.readFromStorage();

        if (currentUser != null) {
          return applyHeader(
            request,
            "Authorization",
            'Bearer ${currentUser.sessionToken}',
            override: false,
          );
        }

        return request;
      },
    ],
  );
}
