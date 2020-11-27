import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/presentation/widget/custom_textfield.dart';
import 'package:rakit_komputer/core/values/constant.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/auth/presentation/bloc/auth_bloc.dart';

class FormUsername extends StatelessWidget {
  const FormUsername({
    Key key,
    @required this.tfUsernameController,
  }) : super(key: key);

  final TextEditingController tfUsernameController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc,AuthState>(
      builder: (context, state) {
        if (state is Error) {
          if (state.message == INVALID_USERNAME_MESSAGE) {
            return Column(
              children: <Widget>[
                CustomTextField(
                  controller: tfUsernameController,
                  margin: EdgeInsets.only(top: 10, bottom: 5),
                  hintText: "Username",
                ),
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
          controller: tfUsernameController,
          margin: EdgeInsets.only(top: 10, bottom: 5),
          hintText: "Username",
        );
      },
    );
  }
}
