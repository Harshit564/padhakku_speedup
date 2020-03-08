import 'package:flutterapp/data.dart';
import 'package:flutterapp/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/login_page.dart';
import 'package:flutterapp/splash/splash_screens.dart';
import 'Constant/Constant.dart';
import 'home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Padhakku',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData.dark(),
      home: AnimatedSplashScreen(),
      onGenerateRoute: (settings) => generateRoute(settings),
      routes: <String,WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context)=> AnimatedSplashScreen(),
        HOME_SCREEN: (BuildContext context)=> Home(),
        LOGIN_SCREEN: (BuildContext context)=> LoginPage(),
      },
    );
  }

  ///Generate parameterized route --> e.g: detail/some book title
  generateRoute(RouteSettings settings) {
    final path = settings.name.split('/');
    final title = path[1];

    Book book = books.firstWhere((it) => it.title == title);
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => Detail(book),
    );
  }
}
