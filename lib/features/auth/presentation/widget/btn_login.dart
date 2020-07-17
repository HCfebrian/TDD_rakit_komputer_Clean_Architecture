import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/presentation/widget/custom_button.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/features/auth/presentation/bloc/auth_bloc.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton(
      {Key key,
        @required this.emailController,
        @required this.passwordController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      margin: EdgeInsets.symmetric(vertical: 5),
      text: "Login",
      colorBg: AppColors.secondaryElement,
      onPressed: () {
        BlocProvider.of<AuthBloc>(context).add(LoginEmailPassword(
            password: passwordController.text, email: emailController.text));
      },
    );
  }
}
