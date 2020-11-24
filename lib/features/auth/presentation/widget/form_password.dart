import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/presentation/widget/custom_textfield.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/constant.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/auth/presentation/bloc/auth_bloc.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key key,
    @required this.passwordController,
  }) : super(key: key);

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is Error) {
        if (state.message == INVALID_PASSWORD_MESSAGE) {
          return Column(
            children: <Widget>[
              CustomTextField(
                  controller: passwordController,
                  obSecure: true,
                  border:
                      Border.all(color: AppColors.primaryColor, width: 1),
                  hintText: "Password",
                  margin: EdgeInsets.symmetric(vertical: 5)),
                 Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: AppStyle.textRedRegular12,
                ),

              SizedBox(
                height: 10,
              )
            ],
          );
        }
      }
      return CustomTextField(
          controller: passwordController,
          obSecure: true,
          hintText: "Password",
          margin: EdgeInsets.symmetric(vertical: 5));
    });
  }
}
