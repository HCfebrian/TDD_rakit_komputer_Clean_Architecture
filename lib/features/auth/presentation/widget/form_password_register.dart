import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/presentation/widget/custom_textfield.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/constant.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/auth/presentation/bloc/auth_bloc.dart';

class PasswordConfirm extends StatelessWidget {
  const PasswordConfirm({
    Key key,
    @required this.tfPasswordController,
    @required this.tfConfirmController,
  }) : super(key: key);

  final TextEditingController tfPasswordController;
  final TextEditingController tfConfirmController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc,AuthState>(builder: (context,state){
      if(state is Error){
        if(state.message == INVALID_PASSWORD_MESSAGE ||
        state.message == PASSWORD_DID_NOT_MATCH){
          return Column(
            children: <Widget>[
              CustomTextField(
                controller: tfPasswordController,
                obSecure: true,
                border: Border.all(color: AppColors.primaryColor, width: 1),
                margin: EdgeInsets.symmetric(vertical: 5),
                hintText: "Password",
              ),
              CustomTextField(
                controller: tfConfirmController,
                obSecure: true,
                border:
                Border.all(color: AppColors.primaryColor, width: 1),
                margin: EdgeInsets.symmetric(vertical: 5),
                hintText: "Confirm Password",
              ),
              Text(state.message,textAlign: TextAlign.center,style: AppStyle.textRedRegular12,),
              SizedBox(
                height: 10,
              )
            ],
          );
        }
      }
      return Column(
        children: <Widget>[
          CustomTextField(
            controller: tfPasswordController,
            obSecure: true,
            margin: EdgeInsets.symmetric(vertical: 5),
            hintText: "Password",
          ),
          CustomTextField(
            controller: tfConfirmController,
            obSecure: true,
            margin: EdgeInsets.symmetric(vertical: 5),
            hintText: "Confirm Password",
          ),
        ],
      );
    });

  }
}


