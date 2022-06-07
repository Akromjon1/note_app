import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/splash_page.dart';
import 'pages/test_page.dart';
void main(){
  runApp(const MyTodoApp());
}
class MyTodoApp extends StatelessWidget {
  const MyTodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
            primary: Colors.red,
          ),
        ),
      home: const SplashPage(),
      routes: {
        SplashPage.id: (context) => const SplashPage(),
        HomePage.id: (context) => const HomePage(),
        HomePageTwo.id: (context) => const HomePageTwo(),
      }
    );
  }
}
