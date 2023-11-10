import 'package:flutter/material.dart';
import 'package:flutter_navigation_2_0_simple/pages/error_page.dart';
import 'package:flutter_navigation_2_0_simple/pages/home_page.dart';
import 'package:flutter_navigation_2_0_simple/pages/second_page.dart';
import 'package:flutter_navigation_2_0_simple/pages/third_page.dart';

// ii ) Create a page builder and return the page based on their page name

class PageBuilder {

  // create a static build method

  // input the route settings as the parameter's

  static Page build ( RouteSettings settings ) {
    // return the page based on the name of the setting or the name of the static const value
    switch (settings.name) {
      case MyHomePage.pageName:
        // Must pass the unique value key for all of the pages you want's other wise it will not change the page in your app when your url of teh address bar changes
        return const MaterialPage(
            child: MyHomePage(title: "Home Page"),
            key: ValueKey(MyHomePage.pageName));

      case SecondPage.pageName:
        return const MaterialPage(
            child: SecondPage(), key: ValueKey(SecondPage.pageName));

      case ThirdPage.pageName:
        return const MaterialPage(
            child: ThirdPage(), key: ValueKey(ThirdPage.pageName));

      default:
        return const MaterialPage(
            child: ErrorPage(), key: ValueKey(ErrorPage.pageName));
    }
  }

  // create a static method that will check the the entered page name is valid page or not

  static bool isValidPage(RouteSettings settings) {
    return settings.name == MyHomePage.pageName ||
        settings.name == SecondPage.pageName ||
        settings.name == MyHomePage.pageName ||
        settings.name == ThirdPage.pageName;
  }
}



