import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/radii.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/auth/presentation/bloc/auth_bloc.dart';

class GoogleButton extends StatelessWidget {
  final textButton = "Continue With Google";

  final margin;

  const GoogleButton({Key key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      margin: margin,
      child: RaisedButton(
        elevation: 5,
        color: AppColors.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/googleIcon.png"),
            SizedBox(width: 10),
            Text(
              textButton,
              style: AppStyle.textWhiteBold14,
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: Radii.appFormRadius),
        onPressed: (){
          BlocProvider.of<AuthBloc>(context)
              .add(LoginOrRegisterGoogle());
        }
      ),
    );
  }
}
