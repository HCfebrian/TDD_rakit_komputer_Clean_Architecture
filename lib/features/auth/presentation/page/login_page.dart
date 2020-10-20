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
    return MaterialApp(
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.backgroundColor,
          body: BlocProvider(
            create: (BuildContext context) => sl<AuthBloc>(),
            child: MyForm(),
          )),
    );
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
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));
        } else if (state is Loading) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Validating..."),
          ));
        } else if (state is Error) {
          Scaffold.of(context).hideCurrentSnackBar();
        }
      },
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 28, bottom: 10),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<AuthBloc>(context).add(SkipAuth());
                  },
                  child: Text(
                    "Skip",
                    style: AppStyle.textRedRegular14,
                  ),
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
              GoogleButton(),
              FacebookButton(
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
                  style: AppStyle.textBlackLight14,
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Belum punya akun?",
                      style: AppStyle.textBlackLight14,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RegisterPage()));
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
    );
  }
}
