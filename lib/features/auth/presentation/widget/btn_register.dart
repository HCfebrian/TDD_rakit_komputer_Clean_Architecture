import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/presentation/widget/custom_button.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/features/auth/presentation/bloc/auth_bloc.dart';

class RegisterButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController confirmController;

  const RegisterButton({
    Key key,
    @required this.emailController,
    @required this.passwordController,
    @required this.usernameController,
    @required this.confirmController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      margin: EdgeInsets.symmetric(vertical: 10),
      text: "Signup",
      colorBg: AppColors.primaryColor,
      onPressed: () {
        BlocProvider.of<AuthBloc>(context).add(RegisterEmailPassword(
            password: passwordController.text,
            email: emailController.text,
            username: usernameController.text,
            confirmPassword: confirmController.text));
      },
    );
  }
}
