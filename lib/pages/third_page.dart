import 'package:flutter/material.dart';
import 'package:flutter_navigation_2_0_simple/my_router_delegate.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});
  static const pageName = "/thirdpage";

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  void goBack() {
    MyRouterDelegate.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text("Third Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Third Page",
              style: TextStyle(color: Colors.black, fontSize: 40),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: goBack),
    );
  }
}
