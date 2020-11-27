import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/values/constant.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/auth/presentation/bloc/auth_bloc.dart';

class AuthStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final excludedMessage = [
      EMPTY_EMAIL_FIELD_MESSAGE,
      INVALID_EMAIL_MESSAGE,
      INVALID_PASSWORD_MESSAGE,
      INVALID_USERNAME_MESSAGE,
      PASSWORD_DID_NOT_MATCH
    ];
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is Error) {
        print("ini loh broo");
        print(state.message);
        print(state.message != EMPTY_EMAIL_FIELD_MESSAGE);
        if (!excludedMessage.contains(state.message)) {
          print("if else jalan");
          return Column(
            children: <Widget>[
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
      }
      return Container();
    });
  }
}
