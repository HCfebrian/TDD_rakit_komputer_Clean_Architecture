import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rakit_komputer/features/auth/presentation/page/logo_page.dart';

import 'injection_container.dart' as di;
import 'injection_container.dart';

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
      debugShowCheckedModeBanner: false,
        home: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
            child: LogoPage(mAuth: sl(),)));
  }
}
