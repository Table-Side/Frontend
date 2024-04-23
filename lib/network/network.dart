import 'package:chopper/chopper.dart';
import 'package:table_side/utils/auth_context_interceptor.dart';

ChopperClient setUpClient({
  required final AuthenticationContext authenticator,
  required final Iterable<ChopperService> services,
}) {
  return ChopperClient(
    baseUrl: Uri.parse('http://localhost:3000/'),
    services: services,
    converter: const JsonConverter(),
    errorConverter: const JsonConverter(),
    interceptors: [
      authenticator,
    ],
  );
}
