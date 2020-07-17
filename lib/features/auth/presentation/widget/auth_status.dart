import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/values/constant.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/auth/presentation/bloc/auth_bloc.dart';

class AuthStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is Error) {
        if (state.message == LOGIN_FAILURE_MESSAGE ||
            state.message == NETWORK_FAILURE_MESSAGE ||
            state.message == PASSWORD_DID_NOT_MATCH ||
            state.message == REGISTER_FAILURE_MESSAGE ||
            state.message == Email_ALREADY_EXSIST_MESSAGE)
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
      return Container();
    });
  }
}
