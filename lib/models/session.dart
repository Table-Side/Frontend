class Session {
  final int iat;
  final int exp;
  final String accessToken;
  final String refreshToken;

  Session({
    required this.iat,
    required this.exp,
    required this.accessToken,
    required this.refreshToken,
  });

  bool isExpired() {
    return DateTime.now().millisecondsSinceEpoch > exp * 1000;
  }
}
