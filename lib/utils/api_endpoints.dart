class ApiEndPoints {
  static const String baseUrl = 'http://restapi.adequateshop.com/api/';
  static AuthEndPoints authEndPoints = AuthEndPoints();
}

class AuthEndPoints {
  final String registerEmail = 'authaccount/registration';
  final String loginEmail = 'authaccount/login';
}