import 'package:flutter/material.dart';
import 'package:flutter_navigation_2_0_simple/my_router_delegate.dart';
import 'package:flutter_navigation_2_0_simple/pages/third_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});
  static const pageName = "/secondpage";

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  void goToNext() {
    MyRouterDelegate.of(context).push(RouteSettings(name: ThirdPage.pageName));
  }

  void goBack() {
    MyRouterDelegate.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text("Second Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Second Page",
              style: TextStyle(color: Colors.red, fontSize: 40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: goToNext,
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: goBack,
                  child: Icon(Icons.remove),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
