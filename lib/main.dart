import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/data/admin_util/firestore_util.dart';
import 'package:rakit_komputer/features/get_build_list/presentation/pages/home_page.dart';

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
//    MaintainFirestore maintainFirestore = MaintainFirestore(firestore: sl());
//    maintainFirestore.moveDocuments(
//      "completed_build",
//      "completed_build/completed_build/completed_build",
//    );

    return MaterialApp(home: HomePage());
  }
}
