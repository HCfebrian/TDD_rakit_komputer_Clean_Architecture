import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/get_build/presentation/bloc/recommended_build/recommended_build_bloc.dart';
import 'package:rakit_komputer/features/get_build/presentation/pages/build_list_page.dart';
import 'package:rakit_komputer/features/get_build/presentation/widget/vertical_build_tile_widget.dart';

class RecommendedScrollableSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Recommended PC",
                  style: AppStyle.heading3(AppColors.accentColor),
                  textAlign: TextAlign.left,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => BuildListPage(
                          isRecommendedBuild: true,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "See More",
                    style: AppStyle.heading3(AppColors.primaryColor),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          BlocBuilder<RecommendedBuildBloc, RecommendedBuildState>(
              buildWhen: (p, n) => true,
              builder: (context, state) {
                if (state is RecommendedLoading) {
                  print("loading");
                  return Text("Loading");
                }

                if (state is RecommendedEmpty) {
                  print("empty");
                  return Text("empty");
                }

                if (state is RecommendedLoaded) {
                  print("Loaded");
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 18),
                        VerticalBuildTile(
                          buildEntity: state.recommendedBuild[0],
                        ),
                        VerticalBuildTile(
                          buildEntity: state.recommendedBuild[1],
                        ),
                        VerticalBuildTile(
                          buildEntity: state.recommendedBuild[2],
                        ),
                        VerticalBuildTile(
                          buildEntity: state.recommendedBuild[3],
                        ),
                        VerticalBuildTile(
                          buildEntity: state.recommendedBuild[4],
                        ),
                        SizedBox(width: 14),
                      ],
                    ),
                  );
                } else {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 18),
                        Container(),
                        Container(),
                        SizedBox(width: 14),
                      ],
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}
