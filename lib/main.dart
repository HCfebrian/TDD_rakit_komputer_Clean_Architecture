import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/error/auth/failures.dart';
import 'package:rakit_komputer/features/auth/presentation/page/logo_page.dart';
import 'package:rakit_komputer/features/get_build/presentation/pages/home_page.dart';

import 'features/get_profile/presentation/page/profile_page.dart';
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

    return MaterialApp(
      home: LogoPage(),
    );
  }
}
