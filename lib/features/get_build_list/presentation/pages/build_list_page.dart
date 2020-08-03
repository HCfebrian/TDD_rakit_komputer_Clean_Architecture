import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/presentation/widget/custom_textfield.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/get_build_list/presentation/bloc/completed_build/completed_build_bloc.dart';
import 'package:rakit_komputer/features/get_build_list/presentation/bloc/recommended_build/recommended_build_bloc.dart';
import 'package:rakit_komputer/features/get_build_list/presentation/widget/completed_build_list.dart';
import 'package:rakit_komputer/features/get_build_list/presentation/widget/filter_bubble.dart';
import 'package:rakit_komputer/features/get_build_list/presentation/widget/recommended_build_list.dart';
import 'package:rakit_komputer/injection_container.dart';

class BuildListPage extends StatelessWidget {
  final bool isRecommendedBuild;

  const BuildListPage({Key key, @required this.isRecommendedBuild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: MultiBlocProvider(
          providers: [
            BlocProvider<CompletedBuildBloc>(
              create: (BuildContext context) => sl<CompletedBuildBloc>(),
            ),
            BlocProvider<RecommendedBuildBloc>(
              create: (BuildContext context) => sl<RecommendedBuildBloc>(),
            ),
          ],
          child: ListBuildContent(
            isRecommendedBuild: isRecommendedBuild,
          ),
        ),
      ),
    );
  }
}

class ListBuildContent extends StatelessWidget {
  final bool isRecommendedBuild;

  const ListBuildContent({
    Key key,
    @required this.isRecommendedBuild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isRecommendedBuild) {
      BlocProvider.of<RecommendedBuildBloc>(context).add(GetRecommendedList());
    } else {
      BlocProvider.of<CompletedBuildBloc>(context).add(GetCompletedBuildList());
    }
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Stack(
              children: <Widget>[
                Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.arrow_back_ios)),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    isRecommendedBuild
                        ? "Recommended Build"
                        : "Completed Build",
                    style: AppStyle.textBlackSemiBold22,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: CustomTextField(
                    margin: EdgeInsets.only(right: 10),
                    iconData: Icons.search,
                    hintText: "Search",
                  ),
                ),
                Image.asset(
                  "assets/images/iconFilter.png",
                  height: 34,
                  width: 34,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FilterBubble(
                color: AppColors.secondaryElement,
                text: "All",
              ),
              FilterBubble(
                text: "Popular",
              ),
              FilterBubble(
                text: "New",
              ),
              FilterBubble(
                text: "Featured",
              ),
            ],
          ),
          isRecommendedBuild ? RecommendedBuildList() : CompletedBuildList(),
        ],
      ),
    );
  }
}
