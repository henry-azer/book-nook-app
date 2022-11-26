class EndPoints {
  // base
  static const String baseUrl = 'https://henry-book-nook-backend.herokuapp.com/book-service/api';

  // auth
  static const String signin = '$baseUrl/auth/log-in';
  static const String refreshToken = '$baseUrl/auth/refresh-token';
  static const String currentUser = '$baseUrl/auth/current';
}
