import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/radii.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/core/presentation/widget/app_fab.dart';
import 'package:rakit_komputer/features/get_profile/presentation/bloc/profile/bloc_profile_bloc.dart';

import '../../../../injection_container.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
        create: (BuildContext context) => sl<ProfileBloc>(),
        child: ProfilePage());
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    BlocProvider.of<ProfileBloc>(context).add(GetProfileEvent());
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, state) {
        if (state is ProfileLoadingState) {
          return Scaffold(
            body: CircularProgressIndicator(),
          );
        }
        if (state is ProfileLogInState) {
          return Scaffold(
            floatingActionButton: AppFAB(),
            body: Stack(
              children: [
                Container(
                  height: 315,
                  decoration: BoxDecoration(
                    borderRadius: Radii.bottomLeftRightRadius20,
                    color: AppColors.primaryColor,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              onPressed: () {}),
                          IconButton(
                              icon: Icon(Icons.settings), onPressed: () {})
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Container(
                          height: 100,
                          width: 100,
                          child: CircleAvatar(
                            child: Container(
                                child: Icon(
                              Icons.account_circle,
                              size: 100,
                              color: Colors.grey,
                            )),
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Guest",
                        style: AppStyle.textWhite22,
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
        return Scaffold(
          floatingActionButton: AppFAB(),
          body: Stack(
            children: [
              Container(
                height: 315,
                decoration: BoxDecoration(
                  borderRadius: Radii.bottomLeftRightRadius20,
                  color: AppColors.primaryColor,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            onPressed: () {}),
                        Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Container(
                        height: 100,
                        width: 100,
                        child: CircleAvatar(
                          child: Container(
                              child: Icon(
                            Icons.account_circle,
                            size: 100,
                            color: Colors.grey,
                          )),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Guest",
                      style: AppStyle.textWhite22,
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
