import 'package:flutter/material.dart';
import 'package:flutter_app/features/number_trivia/presentation/pages/number_trivia_page.dart';
import 'package:flutter_app/navigation/route_generator.dart';
import 'navigation/bottom_nav.dart';
import './styles.dart';
import './injection_container.dart' as di;
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yodo Study English',
      theme: ThemeData(
        // Define the default brightness and colors.
        primaryColor: primaryColor,
        primaryColorLight: subTextColor,
        // Define the default font family.
        fontFamily: 'OpenSans',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: titleFontSize,
                color: primaryColor,
                fontWeight: FontWeight.bold),
            bodyText1: TextStyle(fontSize: normalFontSize),
            subtitle1: TextStyle(fontSize: smallFontSize, color: subTextColor),
            bodyText2: TextStyle(fontSize: normalFontSize),
            subtitle2:
                TextStyle(fontSize: normalFontSize, color: subTextColor)),
      ),
      home: App(),
    );
  }
}

// class RootNavigator extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//         initialRoute: '/', onGenerateRoute: RouteGenerator.generateRoute);
//   }
// }
