import 'package:flutter/material.dart';
import 'package:flutter_navigation_2_0_simple/my_route_information_parser.dart';
import 'package:flutter_navigation_2_0_simple/my_router_delegate.dart';
import 'package:flutter_navigation_2_0_simple/pages/home_page.dart';

// i ) Create all of the pages you want's in your app

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp.router is the named constructor 
    // According to the official documentation
    // Creates a MaterialApp that uses the Router instead of a Navigator.

// If the routerConfig is provided, the other router related delegates, routeInformationParser, routeInformationProvider, routerDelegate, and backButtonDispatcher, must all be null.
    return MaterialApp.router(
      // pass your own custom routerDelegate and routeInformationParser in it 
      // That's all for the navigator 2.0 
      routerDelegate: MyRouterDelegate(),
      routeInformationParser: MyRouteInformationParser(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
