import 'package:flutter/material.dart';
import 'package:flutter_app/features/authentication/presentation/pages/login_page.dart';
import 'package:flutter_app/features/authentication/presentation/pages/phone_number_verify_code.dart';
import 'package:flutter_app/features/authentication/presentation/pages/register_page.dart';
import 'package:flutter_app/features/authentication/presentation/pages/register_succeed_page.dart';
import 'package:flutter_app/features/authentication/presentation/widgets/verify_code.dart';

import '../features/home/presentation/pages/home_page.dart';
import '../features/home/presentation/pages/post_detail.dart';
import '../features/number_trivia/presentation/pages/number_trivia_page.dart';
import '../features/settings/presentation/pages/settings_page.dart';

class HomeRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        {
          return MaterialPageRoute(builder: (_) => HomePage());
        }
      case '/post/detail':
        {
          return MaterialPageRoute(builder: (_) => PostDetail());
        }
      default:
        {
          return _errorRoute();
        }
    }
  }
}

class TriviaRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        {
          return MaterialPageRoute(builder: (_) => NumberTriviaPage());
        }
      default:
        {
          return _errorRoute();
        }
    }
  }
}

class SettingsRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        {
          return MaterialPageRoute(builder: (_) => SettingsPage());
        }
      default:
        {
          return _errorRoute();
        }
    }
  }
}

class AuthenticationRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        {
          return MaterialPageRoute(builder: (_) => LoginPage());
        }
      case '/register':
        {
          return MaterialPageRoute(builder: (_) => RegisterPage());
        }
      case '/register/verifycode':
        {
          return MaterialPageRoute(
              builder: (_) => PhoneNumberVerifyPage(
                  settings.arguments as FormVerifyCodeArguments));
        }
      case '/register/succeed':
        {
          return MaterialPageRoute(builder: (_) => RegisterSucceedPage());
        }
      default:
        {
          return _errorRoute();
        }
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('Not found'),
      ),
    );
  });
}
