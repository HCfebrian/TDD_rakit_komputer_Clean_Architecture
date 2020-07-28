import 'package:flutter/material.dart';
import 'package:rakit_komputer/features/auth/presentation/page/logo_page.dart';
import 'package:rakit_komputer/features/get_build_list/presentation/pages/home_page.dart';

import 'injection_container.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    //todo: change to LogoPage()
    return MaterialApp(home: HomePage());
  }
}
