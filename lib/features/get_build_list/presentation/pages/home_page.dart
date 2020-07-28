import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/presentation/widget/custom_textfield.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/get_build_list/presentation/bloc/recommended_build_bloc.dart';
import 'package:rakit_komputer/features/get_build_list/presentation/widget/horizontal_scrollable_widget.dart';
import 'package:rakit_komputer/features/get_build_list/presentation/widget/vertical_section_widget.dart';

import '../../../../injection_container.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton:
            Container(margin: EdgeInsets.only(bottom: 60), child: AppFAB()),
        backgroundColor: AppColors.backgroundColor,
        body: BlocProvider(
          create: (BuildContext context) => sl<RecommendedBuildBloc>(),
          child: HomeContent(),
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RecommendedBuildBloc>(context).add(GetRecommendedList());
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.centerLeft,
              margin:
                  EdgeInsets.only(left: 24, right: 24, top: 26, bottom: 5),
              child: Text(
                "hi, Username",
                style: AppStyle.textBlackLight14,
              )),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 24, right: 24, bottom: 10),
              child: Text(
                "Build your PC \nNOW",
                style: AppStyle.textBlackSemiBold22,
              )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: CustomTextField(
              iconData: Icons.search,
              hintText: "Search",
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
              child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    HorizontalScrollableSection(),
                    SizedBox(
                      height: 10,
                    ),
                    VerticalSection(),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          )),
          CustomBottomNavigation()
        ],
      ),
    );
  }
}

class AppFAB extends StatelessWidget {
  const AppFAB({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 5,
      backgroundColor: AppColors.secondaryElement,
      child: Icon(Icons.add),
      onPressed: () {},
    );
  }
}

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(color: AppColors.secondaryElement),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            "assets/images/IconNotif.png",
            color: Colors.white,
          ),
          Image.asset(
            "assets/images/IconHomeSelected.png",
            color: Colors.white,
          ),
          Image.asset(
            "assets/images/IconProfile.png",
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
