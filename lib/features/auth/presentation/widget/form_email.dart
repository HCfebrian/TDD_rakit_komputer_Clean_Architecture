import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/presentation/widget/custom_textfield.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/constant.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/auth/presentation/bloc/auth_bloc.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController controllerEmail;

  const EmailInput({Key key,@required this.controllerEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (p, n) => true,
        builder: (context, state) {
          print("rebuild email");
          if (state is Error) {
            if (state.message == EMPTY_EMAIL_FIELD_MESSAGE||
                state.message == INVALID_EMAIL_MESSAGE)
              return Column(
                children: <Widget>[
                  CustomTextField(
                    controller: controllerEmail,
                    border:
                    Border.all(color: AppColors.primaryColor, width: 1),
                    margin: EdgeInsets.only(top: 10, bottom: 5),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  Text(
                    state.message,
                    style: AppStyle.textRedRegular12,
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              );
          }
          return CustomTextField(
            controller: controllerEmail,
            hintText: "Email",
            margin: EdgeInsets.only(top: 10, bottom: 5),
            keyboardType: TextInputType.emailAddress,
          );
        });
  }
}
