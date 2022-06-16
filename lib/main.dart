import 'package:flutter/material.dart';
import 'package:homework6vinh/my_custom_scroll_behavior.dart';

import 'home/home_page.dart';

void main() {
  runApp(const HomeWork6());
}

class HomeWork6 extends StatelessWidget {
  const HomeWork6({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
