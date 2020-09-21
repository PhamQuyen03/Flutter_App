class Api {
  //! Authentication
  static const String BASE_URL = 'https://apidemo.yodovn.com/api/';

  static const String LOGIN = BASE_URL + 'authenticate/login';

  static const String REGISTER = BASE_URL + 'authenticate/register';

  static const String REFRESH_TOKEN = BASE_URL + 'authenticate/token';

  static const String LOGOUT = BASE_URL + 'authenticate/logout';
  //! Subject
  static const String SUBJECT = BASE_URL + 'subject';
}
