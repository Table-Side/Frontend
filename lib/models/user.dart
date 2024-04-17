import 'package:table_side/models/session.dart';
import 'package:table_side/models/user_details.dart';

// part 'user.g.dart';

class User {
  final UserDetails user;
  final Session session;

  User({
    required this.user,
    required this.session,
  });
}
