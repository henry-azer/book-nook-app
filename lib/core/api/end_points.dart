class EndPoints {
  // base
  static const String baseStagingUrl = 'http://192.168.1.7:8010/book-service/api';
  static const String baseProductionUrl = 'https://henry-book-nook-backend.herokuapp.com/book-service/api';

  // auth
  static const String signin = '$baseProductionUrl/auth/log-in';
  static const String signout = '$baseProductionUrl/auth/log-out';
  static const String currentUser = '$baseProductionUrl/auth/current';
  static const String refreshToken = '$baseProductionUrl/auth/refresh-token';

  // user
  static const String signup = '$baseProductionUrl/user';

  // book
  static const String recommendedBooks = '$baseProductionUrl/book/find-all-recommended';
}
