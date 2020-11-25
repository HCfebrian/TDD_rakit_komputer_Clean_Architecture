import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/presentation/widget/decoration.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rakit_komputer/features/auth/presentation/page/register_page.dart';
import 'package:rakit_komputer/features/auth/presentation/widget/auth_status.dart';
import 'package:rakit_komputer/features/auth/presentation/widget/btn_facebook.dart';
import 'package:rakit_komputer/features/auth/presentation/widget/btn_google.dart';
import 'package:rakit_komputer/features/auth/presentation/widget/btn_login.dart';
import 'package:rakit_komputer/features/auth/presentation/widget/form_email.dart';
import 'package:rakit_komputer/features/auth/presentation/widget/form_password.dart';
import 'package:rakit_komputer/features/get_build/presentation/pages/home_page.dart';
import 'package:rakit_komputer/injection_container.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundColor,
        body: BlocProvider(
          create: (BuildContext context) => sl<AuthBloc>(),
          child: MyForm(),
        ));
  }
}

class MyForm extends StatelessWidget {
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Loaded) {
          Scaffold.of(context).hideCurrentSnackBar();
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()));
        }
        if (state is Loading) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Validating..."),
          ));
        }
        if (state is Error) {
          Scaffold.of(context).hideCurrentSnackBar();
        }
      },
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 48, bottom: 10),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<AuthBloc>(context).add(SkipAuth());
                  },
                  child: Text(
                    "Skip",
                    style: AppStyle.button(AppColors.primaryColor),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.center,
                child: Text(
                  "Login",
                  style: AppStyle.heading1(AppColors.accentColor),
                ),
              ),
              GoogleButton(margin: EdgeInsets.only(bottom: 10),),
              FacebookButton(
                margin: EdgeInsets.only(bottom: 10),
                onPressed: () {},
              ),
              OrDecoration(
                margin: EdgeInsets.symmetric(vertical: 10),
              ),
              EmailInput(
                controllerEmail: emailController,
              ),
              PasswordField(passwordController: passwordController),
              LoginButton(
                emailController: emailController,
                passwordController: passwordController,
              ),
              AuthStatus(),
              Container(
                margin: EdgeInsets.only(top: 18),
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Lupa Password",
                  style: AppStyle.heading3(AppColors.accentColor),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Belum punya akun?",
                      style: AppStyle.heading3(AppColors.accentColor),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                      },
                      child: Text(
                        "Register",
                        style: AppStyle.button(AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
