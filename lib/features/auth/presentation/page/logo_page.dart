import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/auth/presentation/page/bording_page.dart';


class LogoPage extends StatefulWidget {
  @override
  _LogoPageState createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => BoardingScreen1())));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.secondaryElement,
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
      ),
    );
  }
}
