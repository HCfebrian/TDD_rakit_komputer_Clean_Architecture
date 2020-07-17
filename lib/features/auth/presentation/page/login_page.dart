import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/error/failures.dart';
import 'package:rakit_komputer/core/presentation/widget/custom_button.dart';
import 'package:rakit_komputer/core/presentation/widget/custom_textfield.dart';
import 'package:rakit_komputer/core/presentation/widget/decoration.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/constant.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rakit_komputer/features/auth/presentation/page/signup_page.dart';
import 'package:rakit_komputer/injection_container.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.backgroundColor,
          body: BlocProvider(
            create: (BuildContext context) => sl<AuthBloc>(),
            child: MyForm(),
          )),
    );
  }
}

class MyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Loaded) {
            Scaffold.of(context).hideCurrentSnackBar();
          } else if (state is Loading) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("Validating..."),
            ));
          }
        },
        child: MyLogin());
  }
}

class EmailInput extends StatelessWidget {
  final TextEditingController controllerEmail;

  const EmailInput({Key key, this.controllerEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (p, n) => true,
        builder: (context, state) {
          print("rebuild email");
          if (state is Error) {
            if (state.message == EMPTY_FIELD_MESSAGE ||
                state.message == INVALID_EMAIL_MESSAGE)
              return Column(
                children: <Widget>[
                  CustomTextField(
                    controller: controllerEmail,
                    border:
                        Border.all(color: AppColors.secondaryElement, width: 1),
                    margin: EdgeInsets.only(top: 10, bottom: 5),
                    keyboardType: TextInputType.emailAddress,
                    errorText: state.message,
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
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is Error) {
        if (state.message == LOGIN_FAILURE_MESSAGE ||
            state.message == NETWORK_FAILURE_MESSAGE)
          return Column(
            children: <Widget>[
              CustomButton(
                margin: EdgeInsets.symmetric(vertical: 5),
                text: "Login",
                colorBg: AppColors.secondaryElement,
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(LoginEmailPassword(
                      password: passwordController.text,
                      email: emailController.text));
                },
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
      return CustomButton(
        margin: EdgeInsets.symmetric(vertical: 5),
        text: "Login",
        colorBg: AppColors.secondaryElement,
        onPressed: () {
          BlocProvider.of<AuthBloc>(context).add(LoginEmailPassword(
              password: passwordController.text, email: emailController.text));
        },
      );
    });
  }
}

class MyLogin extends StatelessWidget {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 28, bottom: 10),
              alignment: Alignment.centerRight,
              child: Text(
                "Skip",
                style: AppStyle.textRedRegular14,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              child: Text(
                "Login",
                style: AppStyle.textBlackSemiBold22,
              ),
            ),
            GoogleButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(LoginOrRegisterGoogle());
              },
            ),
            FacebookButton(
              onPressed: () {},
            ),
            OrDecoration(
              margin: EdgeInsets.symmetric(vertical: 10),
            ),
            EmailInput(
              controllerEmail: emailController,
            ),
            CustomTextField(
                controller: passwordController,
                obSecure: true,
                hintText: "Password",
                margin: EdgeInsets.symmetric(vertical: 5)),
            LoginButton(
              emailController: emailController,
              passwordController: passwordController,
            ),
            Container(
              margin: EdgeInsets.only(top: 18),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Lupa Password",
                style: AppStyle.textBlackLight14,
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Belum punya akun?",
                    style: AppStyle.textBlackLight14,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUpPage()));
                    },
                    child: Text(
                      "Register",
                      style: AppStyle.textRedRegular14,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
