import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/presentation/widget/decoration.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/core/presentation/widget/custom_button.dart';
import 'package:rakit_komputer/core/presentation/widget/custom_textfield.dart';
import 'package:rakit_komputer/features/auth/presentation/page/login_page.dart';
import 'package:rakit_komputer/home.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 28, bottom: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text("Skip", style: AppStyle.textRedRegular14),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Register",
                    style: AppStyle.textBlackSemiBold22,
                  ),
                ),
                GoogleButton(
                  onPressed: () {},
                ),
                FacebookButton(
                  onPressed: () {},
                ),
                OrDecoration(
                  margin: EdgeInsets.symmetric(vertical: 10),
                ),
                CustomTextField(
                  margin: EdgeInsets.only(top: 10, bottom: 5),
                  hintText: "Username",
                ),
                CustomTextField(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  hintText: "Email",
                ),
                CustomTextField(
                  obSecure: true,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  hintText: "Password",
                ),
                CustomTextField(
                  obSecure: true,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  hintText: "Confirm Password",
                ),
                CustomButton(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  text: "Signup",
                  colorBg: AppColors.secondaryElement,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Sudah Punya Akun?",
                        style: AppStyle.textBlackLight14,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginPage()));
                        },
                        child: Text(
                          "Login",
                          style: AppStyle.textRedRegular14,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
