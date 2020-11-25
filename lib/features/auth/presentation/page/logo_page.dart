import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/auth/presentation/page/bording_page.dart';
import 'package:rakit_komputer/features/auth/presentation/page/login_page.dart';
import 'package:rakit_komputer/features/get_build/presentation/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoPage extends StatefulWidget {
  final FirebaseAuth mAuth;

  const LogoPage({Key key, this.mAuth}) : super(key: key);
  @override
  _LogoPageState createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      _prefs.then((_pref) {
        final hasSeen = _pref.getBool("hasSeen");

        if (hasSeen == null) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => BoardingScreen()));
          _pref.setBool("hasSeen", true);
        } else {
          Future<FirebaseUser> _futureUser = widget.mAuth.currentUser();
          _futureUser.then((user) {
            if(user == null){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage()));
            }else{
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage()));

            }
          });
          }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 160,
                height: 99,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 22,
                      height: 42,
                      margin: EdgeInsets.only(top: 18),
                      child: Image.asset(
                        "assets/images/group-2.png",
                        fit: BoxFit.none,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 107,
                        height: 99,
                        margin: EdgeInsets.only(left: 1),
                        child: Image.asset(
                          "assets/images/group-3.png",
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 29,
                      height: 43,
                      margin: EdgeInsets.only(top: 18),
                      child: Image.asset(
                        "assets/images/group-1.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
//              Spacer(),
            Text("RakitkomputeR",
                textAlign: TextAlign.left, style: AppStyle.textWhite28),
          ],
        ),
      ),
    );
  }
}
