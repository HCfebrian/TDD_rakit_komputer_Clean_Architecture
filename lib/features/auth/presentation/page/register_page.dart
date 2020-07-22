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

import '../../../../injection_container.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.backgroundColor,
          body: BlocProvider(
            create: (BuildContext context) => sl<AuthBloc>(),
            child: RegisterForm(),
          )),
    );
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
        } else if (state is Loading) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("Validating..."),),);
        } else if (state is Error){
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
              GoogleButton(),
              FacebookButton(
                onPressed: () {},
              ),
              OrDecoration(
                margin: EdgeInsets.symmetric(vertical: 10),
              ),
              FormUsername(tfUsernameController: tfUsernameController),
              EmailInput(
                controllerEmail: tfEmailController,
              ),
              PasswordConfirm(tfPasswordController: tfPasswordController, tfConfirmController: tfConfirmController),
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
                      style: AppStyle.textBlackLight14,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) =>
                                LoginPage()));
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
    );
  }
}


//
//class PasswordConfirm extends StatelessWidget {
//  const PasswordConfirm({
//    Key key,
//    @required this.tfPasswordController,
//    @required this.tfConfirmController,
//  }) : super(key: key);
//
//  final TextEditingController tfPasswordController;
//  final TextEditingController tfConfirmController;
//
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      children: <Widget>[
//        CustomTextField(
//          controller: tfPasswordController,
//          obSecure: true,
//          margin: EdgeInsets.symmetric(vertical: 5),
//          hintText: "Password",
//        ),
//        CustomTextField(
//          controller: tfConfirmController,
//          obSecure: true,
//          margin: EdgeInsets.symmetric(vertical: 5),
//          hintText: "Confirm Password",
//        ),
//      ],
//    );
//  }
//}
