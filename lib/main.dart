import 'package:flutter/material.dart';
import 'package:rakit_komputer/features/get_build/presentation/pages/home_page.dart';
import 'package:rakit_komputer/features/get_build/presentation/pages/build_list_page.dart';

import 'core/data/admin_util/firestore_util.dart';
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
    MaintainFirestore maintainFirestore = MaintainFirestore(firestore: sl());
//    maintainFirestore.moveDocuments(
//      "completed_build",
//      "completed_build/completed_build/completed_build",
//    );

    return MaterialApp(
      home: HomePage(),
    );
  }
}
