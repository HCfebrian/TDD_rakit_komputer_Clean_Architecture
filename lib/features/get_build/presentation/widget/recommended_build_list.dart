import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/features/get_build/presentation/bloc/completed_build/completed_build_bloc.dart';
import 'package:rakit_komputer/features/get_build/presentation/bloc/recommended_build/recommended_build_bloc.dart';

import 'grid_build_list.dart';

class RecommendedBuildList extends StatelessWidget {
  const RecommendedBuildList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedBuildBloc, RecommendedBuildState>(
      builder: (context, state) {
        if (state is RecommendedLoading) {
          return Column(
            children: <Widget>[
              SizedBox(width: 14),
              Text("Loading"),
              SizedBox(width: 14),
            ],
          );
        }
        if (state is RecommendedError) {
          return Column(
            children: <Widget>[
              SizedBox(width: 14),
              Text("Error"),
              SizedBox(width: 14),
            ],
          );
        }
        if (state is RecommendedLoaded) {
          return GridBuildList(listBuild: state.recommendedBuild);
        } else {
          return Text("empty");
        }
      },
    );
  }
}
