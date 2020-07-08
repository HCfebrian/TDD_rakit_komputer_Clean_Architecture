import 'package:flutter/material.dart';
import 'package:rakit_komputer/features/auth/presentation/page/logo_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => LogoPage()));
            },
            child: Text("home")),
      ),
    );
  }
}
