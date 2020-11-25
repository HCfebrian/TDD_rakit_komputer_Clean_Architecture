import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/data/admin_util/firestore_util.dart';
import 'package:rakit_komputer/core/presentation/widget/custom_textfield.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/get_build/presentation/bloc/completed_build/completed_build_bloc.dart';
import 'package:rakit_komputer/features/get_build/presentation/bloc/featured_build/get_featured_build_bloc.dart';
import 'package:rakit_komputer/features/get_build/presentation/bloc/recommended_build/recommended_build_bloc.dart';
import 'package:rakit_komputer/core/presentation/widget/app_fab.dart';
import 'package:rakit_komputer/features/get_build/presentation/widget/custom_bottom_navigation.dart';
import 'package:rakit_komputer/features/get_build/presentation/widget/horizontal_scrollable_widget.dart';
import 'package:rakit_komputer/features/get_build/presentation/widget/vertical_section_widget.dart';

import '../../../../injection_container.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<RecommendedBuildBloc>(
              create: (BuildContext context) => sl<RecommendedBuildBloc>()),
          BlocProvider<CompletedBuildBloc>(
              create: (BuildContext context) => sl<CompletedBuildBloc>()),
          BlocProvider<FeaturedBuildBloc>(
              create: (BuildContext context) => sl<FeaturedBuildBloc>()),
        ],
        child:Scaffold(
              resizeToAvoidBottomInset: false,
              floatingActionButton: Container(child: AppFAB()),
              backgroundColor: AppColors.backgroundColor,
              body: HomeContent(),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: AppColors.primaryColor,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: (index) {},
                items: [
                  BottomNavigationBarItem(
                      icon: Image.asset(
                        "assets/images/IconNotif.png",
                        color: Colors.white,
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Image.asset(
                        "assets/images/IconHomeSelected.png",
                        color: Colors.white,
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Image.asset(
                        "assets/images/IconProfile.png",
                        color: Colors.white,
                      ),
                      label: ""),
                ],
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
    // for test
    MaintainFirestore maintainFirestore = MaintainFirestore(firestore: sl());
    //
    BlocProvider.of<FeaturedBuildBloc>(context).add(GetFeaturedBuild());
    BlocProvider.of<RecommendedBuildBloc>(context).add(GetRecommendedList());
    BlocProvider.of<CompletedBuildBloc>(context).add(GetCompletedBuildList());

    return Container(
      child: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 24, right: 24, top: 28, bottom: 5),
              child: Text(
                "Hi.",
                style: AppStyle.headingReguler(Colors.grey),
              )),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 24, right: 24, bottom: 10),
              child: Text(
                "Build your PC Now",
                style: AppStyle.heading1(AppColors.accentColor),
              )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: CustomTextField(
              iconData: Icons.search,
              hintText: "Search Complite Build",
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
        ],
      ),
    );
  }
}
