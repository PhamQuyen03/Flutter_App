import 'package:flutter/material.dart';
import 'package:flutter_app/features/speech_recognition/presentation/pages/speech_recognition_page.dart';
import '../features/authentication/presentation/pages/login_page.dart';
import '../features/authentication/presentation/pages/phone_number_verify_code.dart';
import '../features/authentication/presentation/pages/register_page.dart';
import '../features/authentication/presentation/pages/register_succeed_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/home/presentation/pages/post_detail.dart';
import '../features/number_trivia/presentation/pages/number_trivia_page.dart';
import '../features/search/presentation/pages/search_page.dart';
import '../features/settings/presentation/pages/settings_page.dart';
import '../features/test/presentation/pages/test_page.dart';
import 'navigation.dart';

// Map<TabItem,Route<dynamic>> appRoutes ={
//   TabItem.home:
// }

Route<dynamic> getTabRoute(RouteItem tabItem, RouteSettings settings) {
  switch (tabItem) {
    case RouteItem.home:
      return _homeRoute(settings);
    case RouteItem.test:
      return _testRoute(settings);
    case RouteItem.search:
      return _searchRoute(settings);
    case RouteItem.trivia:
      return _triviaRoute(settings);
    case RouteItem.settings:
      return _settingRoute(settings);
    case RouteItem.speech:
      return _speechToTextRoute(settings);
    default:
      return _errorRoute();
  }
}

Route<dynamic> _homeRoute(RouteSettings settings) {
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

Route<dynamic> _testRoute(RouteSettings settings) {
  final args = settings.arguments;
  switch (settings.name) {
    case '/':
      {
        return MaterialPageRoute(builder: (_) => TestPage());
      }
    default:
      {
        return _errorRoute();
      }
  }
}

Route<dynamic> _searchRoute(RouteSettings settings) {
  final args = settings.arguments;
  switch (settings.name) {
    case '/':
      {
        return MaterialPageRoute(builder: (_) => SearchPage());
      }
    default:
      {
        return _errorRoute();
      }
  }
}

Route<dynamic> _triviaRoute(RouteSettings settings) {
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

Route<dynamic> _settingRoute(RouteSettings settings) {
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

Route<dynamic> authenticationRoute(RouteSettings settings) {
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

Route<dynamic> _speechToTextRoute(RouteSettings settings) {
  final args = settings.arguments;
  switch (settings.name) {
    case '/':
      {
        return MaterialPageRoute(builder: (_) => SpeechRecognitionPage());
      }
    default:
      {
        return _errorRoute();
      }
  }
}
