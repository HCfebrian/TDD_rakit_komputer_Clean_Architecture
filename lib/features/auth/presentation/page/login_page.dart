import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/presentation/widget/decoration.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/core/presentation/widget/custom_button.dart';
import 'package:rakit_komputer/core/presentation/widget/custom_textfield.dart';
import 'package:rakit_komputer/features/auth/presentation/page/signup_page.dart';
import 'package:rakit_komputer/home.dart';

class LoginPage extends StatelessWidget {
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
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 28,bottom: 10),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Skip",
                    style: AppStyle.textRedRegular14,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  child: Text(
                    "Login",
                    style: AppStyle.textBlackSemiBold22,
                  ),
                ),
                GoogleButton(
                  onPressed: () {},
                ),
                FacebookButton(
                  onPressed: () {},
                ),
                OrDecoration(margin: EdgeInsets.symmetric(vertical: 10),),
                CustomTextField(
                    hintText: "Email",
                    margin: EdgeInsets.only(top: 10, bottom: 5)),
                CustomTextField(
                  obSecure: true,
                    hintText: "Password",
                    margin: EdgeInsets.symmetric(vertical: 5)),
                CustomButton(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  text: "Login",
                  colorBg: AppColors.secondaryElement,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 18),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Lupa Password",
                    style: AppStyle.textBlackLight14,
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Belum punya akun?",
                        style: AppStyle.textBlackLight14,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignUpPage()));
                        },
                        child: Text(
                          "Register",
                          style: AppStyle.textRedRegular14,
                        ),
                      ),
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
