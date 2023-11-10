import 'package:flutter/material.dart';
import 'package:flutter_navigation_2_0_simple/page_builder.dart';
import 'package:flutter_navigation_2_0_simple/pages/error_page.dart';

class MyRouteInformationParser extends 
RouteInformationParser
// According to the official documentation 
// A delegate that is used by the Router widget to parse a route information into a configuration of type T.
// Note 
// This delegate is used when the Router widget is first built with initial route information from Router.routeInformationProvider and any subsequent new route notifications from it.
// The Router widget calls the parseRouteInformation with the route information from Router.routeInformationProvider.

// One of the parseRouteInformation or parseRouteInformationWithDependencies must be implemented, otherwise a runtime error will be thrown.
<RouteSettings
// Data that might be useful in constructing a Route. 
> {
  // Must explicitly override both of the parseRouteInformation and restoreRouteInformation (by writing their names )

  @override
  Future<RouteSettings> parseRouteInformation
  // According to the official documentation
  // This method is used to 
   (

    // Converts the given route information into parsed data to pass to a RouterDelegate.

// The method should return a future which completes when the parsing is complete. The parsing may be asynchronous if, e.g., the parser needs to communicate with the OEM thread to obtain additional data about the route.

      RouteInformation
      // According to the official documentation
      // The route information is the piece of route information that consists of a location string of the application and a state object that configures the application in that location.
       routeInformation
      //  Note 
      // This information flows two ways, from the RouteInformationProvider to the Router or from the Router to RouteInformationProvider.

// In the former case, the RouteInformationProvider notifies the Router widget when a new RouteInformation is available. The Router widget takes these information and navigates accordingly.

// The latter case happens in web application where the Router reports route changes back to the web engine.
       ) {
    // create a route settings in the parseRouteInformation
    // RouteSettings settings = RouteSettings(name: routeInformation.location);

    // 'location' is deprecated and shouldn't be used. Use uri instead. This feature was deprecated after v3.8.0-3.0.pre.

    // As mentioned above before v3.8.0-3.0.pre. location is used as the name in the route settings now the uri is used instead of the location in the route settings

    RouteSettings settings = RouteSettings(name: routeInformation.location);
    if (PageBuilder.isValidPage(settings)) {
      return Future.value(settings);
    } else {
      return Future.value(const RouteSettings(
        name: ErrorPage.pageName,
      ));
    }
  }

  @override
  RouteInformation? restoreRouteInformation
  // Restore the route information from the given configuration.
  (configuration) {
    if (PageBuilder.isValidPage(configuration)) {
      return RouteInformation(location: configuration.name);
    } else {
      return RouteInformation(location: ErrorPage.pageName);
    }
  }
}
