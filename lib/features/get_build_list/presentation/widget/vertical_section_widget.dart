import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/get_build_list/presentation/bloc/completed_build/completed_build_bloc.dart';
import 'package:rakit_komputer/features/get_build_list/presentation/pages/build_list_page.dart';

import 'featured_tile_widget.dart';
import 'horizontal_tile_widget.dart';

class VerticalSection extends StatelessWidget {
  const VerticalSection({
    Key key,
  }) : super(key: key);

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
                  "Completed Build",
                  style: AppStyle.textBlackSemiBold16,
                  textAlign: TextAlign.left,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => BuildListPage(
                          isRecommendedBuild: false,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "See Others",
                    style: AppStyle.textRedRegular14,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          BlocBuilder<CompletedBuildBloc, CompletedBuildState>(
            buildWhen: (p, n) => true,
            builder: (context, state) {
              if (state is CompletedBuildLoading) {
                return Column(
                  children: <Widget>[
                    SizedBox(width: 14),
                    Text("Loading"),
                    SizedBox(width: 14),
                  ],
                );
              }
              if (state is CompletedBuildError) {
                return Column(
                  children: <Widget>[
                    SizedBox(width: 14),
                    Text("Error"),
                    SizedBox(width: 14),
                  ],
                );
              }
              if (state is CompletedBuildLoaded) {
                return Column(
                  children: <Widget>[
                    SizedBox(width: 14),
                    FeaturedBuild(),
                    HorizontalTile(
                      buildList: state.completedBuild[0],
                    ),
                    HorizontalTile(
                      buildList: state.completedBuild[1],
                    ),
                    HorizontalTile(
                      buildList: state.completedBuild[2],
                    ),
                    HorizontalTile(
                      buildList: state.completedBuild[3],
                    ),
                    HorizontalTile(
                      buildList: state.completedBuild[4],
                    ),
                    SizedBox(width: 14),
                  ],
                );
              } else {
                return Column(
                  children: <Widget>[
                    SizedBox(width: 14),
                    Text("Empty"),
                    SizedBox(width: 14),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
