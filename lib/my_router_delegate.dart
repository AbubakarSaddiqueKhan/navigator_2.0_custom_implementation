import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation_2_0_simple/page_builder.dart';
import 'package:flutter_navigation_2_0_simple/pages/error_page.dart';
import 'package:flutter_navigation_2_0_simple/pages/home_page.dart';

class MyRouterDelegate extends RouterDelegate
//  According to the official documentation
// A delegate that is used by the Router widget to build and configure a navigating widget.
//  It responds to push route and pop route intents from the engine and notifies the Router to rebuild.
//  It also acts as a builder for the Router widget and builds a navigating widget, typically a Navigator, when the Router widget builds.
    <RouteSettings>
    with
        ChangeNotifier
        //  /////////////////////////////////////////////////
        //  mixin class ChangeNotifier implements Listenable
        ////////////////////////////////////////////////////

        // According to the official documentation
        // A class that can be extended or mixed in that provides a change notification API using VoidCallback for notifications
        // A data structure can extend or mix in [ChangeNotifier] to implement the [Listenable] interface and thus become usable with widgets that listen for changes to [Listenable]s, such as [ListenableBuilder]
        ,
        PopNavigatorRouterDelegateMixin
//  According to the official documentation
// A mixin that wires [RouterDelegate.popRoute] to the [Navigator] it builds.

// This mixin calls [Navigator.maybePop] when it receives an Android back button intent through the [RouterDelegate.popRoute].
//Using this mixin guarantees that the back button still respects pageless routes in the navigator.

// Only use this mixin if you plan to build a navigator in the [RouterDelegate.build].
{
  // Make a list that will store the list of page's data or route settings
  // using this list we will perform our navigation by adding or removing the widget's

  final _stack = <RouteSettings>[
    RouteSettings(name: MyHomePage.pageName),
  ];

  @override
  Widget build(BuildContext context) {
    // According to the official documentation
    // Called by the [Router] to obtain the widget tree that represents the current state.

// This is called whenever the [Future]s returned by [setInitialRoutePath], [setNewRoutePath], or [setRestoredRoutePath] complete as well as when this notifies its clients (see the [Listenable] interface, which this interface includes).
// In addition, it may be called at other times. It is important, therefore, that the methods above do not update the state that the [build] method uses before they complete their respective futures.
    return
        // According to the official documentation
        // navigator is used to Creates a widget that maintains a stack-based history of child widgets.
        // Many apps have a navigator near the top of their widget hierarchy in order to display their logical history using an Overlay with the most recently visited pages visually on top of the older pages.
        // Working of navigator class
        // The Navigator will convert its Navigator.pages into a stack of Routes if it is provided.
        //A change in Navigator.pages will trigger an update to the stack of Routes. The Navigator will update its routes to match the new configuration of its Navigator.pages.

        Navigator(
      // this navigator key is fetched from the below get method of the global key of navigator state

      key: navigatorKey,
      // Pages contain's a list of pages that are included (All of our pages and the screen's are included in the pages) .
      pages: [
        // The list of pages with which to populate the history.
// Pages are turned into routes using [Page.createRoute]

        for (RouteSettings pageSettings in _stack)
          PageBuilder.build(pageSettings)
      ],
      // On pop page will be made below
      // According to the official documentation
      // Called when pop is invoked but the current Route corresponds to a Page found in the pages list.

// The result argument is the value with which the route is to complete (e.g. the value returned from a dialog).

// This callback is responsible for calling Route.didPop and returning whether this pop is successful.
      onPopPage: onPopPage,
    );
  }

  @override
  GlobalKey<NavigatorState>? get
      // According to the official documentation
      // The key used for retrieving the current navigator.
// When using this mixin, be sure to use this key to create the navigator.
// Copied from PopNavigatorRouterDelegateMixin.

      navigatorKey => GlobalKey<NavigatorState>();

// The key used for retrieving the current navigator.

// When using this mixin, be sure to use this key to create the navigator.

// Copied from PopNavigatorRouterDelegateMixin.
  @override
  Future<void> setNewRoutePath
      // Called by the [Router] when the [Router.routeInformationProvider] reports that a new route has been pushed to the application by the operating system.
// Note :
// Consider using a [SynchronousFuture] if the result can be computed synchronously, so that the [Router] does not need to wait for the next microtask to schedule a build.
// Copied from RouterDelegate.

      (RouteSettings configuration) {
    _stack
      ..clear()
      ..add(configuration);
    return SynchronousFuture(null);
  }

  // Must override the following method also (explicitly)

// i ) setInitialRoutePath

  @override
  Future<void> setInitialRoutePath
      // setInitialRoutePath is used to set the initial rout path or to set the initial route that will be displayed at the start of the app
      // According to the official documentation
      // Called by the [Router] at startup with the structure that the [RouteInformationParser] obtained from parsing the initial route.

// This should configure the [RouterDelegate] so that when [build] is invoked, it will create a widget tree that matches the initial route.

// By default, this method forwards the [configuration] to [setNewRoutePath].
      (RouteSettings configuration) {
    setNewRoutePath(configuration);
    return super.setInitialRoutePath(configuration);
  }

  //  ii ) currentConfiguration

  @override
  RouteSettings? get currentConfiguration
      // it is used to get the current  route's configuration
      // According to the official documentation
      // Called by the Router when it detects a route information may have changed as a result of rebuild.

      // If this getter returns non-null, the Router will start to report new route information back to the engine. In web applications, the new route information is used for populating browser history in order to support the forward and the backward buttons.

      // Note :
      // When overriding this method, the configuration returned by this getter must be able to construct the current app state and build the widget with the same configuration in the build method if it is passed back to the setNewRoutePath.
      // Otherwise, the browser backward and forward buttons will not work properly.

      // By default, this getter returns null, which prevents the Router from reporting the route information.

      => _stack.isNotEmpty
          // Called by the [Router] when it detects a route information may have changed as a result of rebuild.

          ? _stack.last
          : const RouteSettings(name: ErrorPage.pageName);

// Make the following method or functions

// make a static of function that work's like the of method that will return the object of that type when they are used as inherited widget

  static MyRouterDelegate of(BuildContext context) {
    var delegate = Router.of(context).routerDelegate;

    // According to the official documentation
    //  /// The router delegate for the router.
    ///
    /// This delegate consumes the configuration from [routeInformationParser] and
    /// builds a navigating widget for the [Router].
    ///
    /// It is also the primary respondent for the [backButtonDispatcher]. The
    /// [Router] relies on [RouterDelegate.popRoute] to handle the back
    /// button.
    ///
    /// If the [RouterDelegate.currentConfiguration] returns a non-null object,
    /// this [Router] will opt for URL updates.
    ///
    ///
    ///
    assert(delegate is MyRouterDelegate);
    return delegate as MyRouterDelegate;
  }

// pop method is used to pop the current route and go back to the previous route
//
  dynamic pop([dynamic? data]) {
    if (_stack.isNotEmpty) {
      _stack.remove(_stack.last);

      // According to the official documentation
      // Call all the registered listeners.

// Call this method whenever the object changes, to notify any clients the object may have changed.
// Listeners that are added during this iteration will not be visited. Listeners that are removed during this iteration will not be visited after they are removed.

// Exceptions thrown by listeners will be caught and reported using FlutterError.reportError.

      notifyListeners();
    }
    return data;
  }

// push method is used to move from the current page or route to the given route
  push(RouteSettings settings) {
    _stack.add(settings);
    notifyListeners();
  }

// On pop page is used to check whether the current page will be popped or not or in other word's it is used to handle the willpopscope widget of the navigator 1.0
// It is used to handle the pop of the current route here either you will ask the user for the confirmation of the pop either by the dialog

  bool onPopPage(Route<dynamic> route, dynamic data) {
    if (_stack.isNotEmpty) {
      _stack.remove(_stack.last);
      notifyListeners();
    }

    return route.didPop(data);
  }
}
