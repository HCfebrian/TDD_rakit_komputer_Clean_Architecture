import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/features/get_build_list/presentation/bloc/completed_build/completed_build_bloc.dart';

import 'grid_build_list.dart';

class CompletedBuildList extends StatelessWidget {
  const CompletedBuildList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompletedBuildBloc, CompletedBuildState>(
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
          return GridBuildList(listBuild: state.completedBuild);
        } else {
          return Text("empty");
        }
      },
    );
  }
}
