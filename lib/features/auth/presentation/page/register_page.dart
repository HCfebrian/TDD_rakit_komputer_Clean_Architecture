import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/presentation/widget/decoration.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rakit_komputer/features/auth/presentation/page/login_page.dart';
import 'package:rakit_komputer/features/auth/presentation/widget/auth_status.dart';
import 'package:rakit_komputer/features/auth/presentation/widget/btn_facebook.dart';
import 'package:rakit_komputer/features/auth/presentation/widget/btn_google.dart';
import 'package:rakit_komputer/features/auth/presentation/widget/btn_register.dart';
import 'package:rakit_komputer/features/auth/presentation/widget/form_email.dart';
import 'package:rakit_komputer/features/auth/presentation/widget/form_password_register.dart';
import 'package:rakit_komputer/features/auth/presentation/widget/form_username.dart';
import 'package:rakit_komputer/features/get_build/presentation/pages/home_page.dart';

import '../../../../injection_container.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundColor,
        body: BlocProvider(
          create: (BuildContext context) => sl<AuthBloc>(),
          child: RegisterForm(),
        ));
  }
}

class RegisterForm extends StatelessWidget {
  final tfEmailController = TextEditingController();
  final tfPasswordController = TextEditingController();
  final tfConfirmController = TextEditingController();
  final tfUsernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Loaded) {
          Scaffold.of(context).hideCurrentSnackBar();
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()));
        } else if (state is Loading) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Validating..."),
            ),
          );
        } else if (state is Error) {
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
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("Skip",
                      style: AppStyle.button(AppColors.primaryColor)),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Sign Up",
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
              FormUsername(tfUsernameController: tfUsernameController),
              EmailInput(
                controllerEmail: tfEmailController,
              ),
              PasswordConfirm(
                  tfPasswordController: tfPasswordController,
                  tfConfirmController: tfConfirmController),
              RegisterButton(
                emailController: tfEmailController,
                passwordController: tfPasswordController,
                confirmController: tfConfirmController,
                usernameController: tfUsernameController,
              ),
              AuthStatus(),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Sudah Punya Akun?",
                      style: AppStyle.heading3(AppColors.accentColor),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginPage()));
                      },
                      child: Text(
                        "Login",
                        style: AppStyle.button(AppColors.primaryColor),
                      ),
                    )
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
