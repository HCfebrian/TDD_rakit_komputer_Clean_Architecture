import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/features/get_build/presentation/bloc/build_part/build_part_bloc.dart';

import '../../../../injection_container.dart';
import 'horizontal_part_tile_widget.dart';

class BuildPartList extends StatefulWidget {
  const BuildPartList({
    Key key,
    @required this.buildID,
  }) : super(key: key);
  final buildID;

  @override
  _BuildPartListState createState() => _BuildPartListState();
}

class _BuildPartListState extends State<BuildPartList> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider<BuildPartBloc>(
      create: (BuildContext context) => BuildPartBloc(buildUsecase: sl()),
      child: BlocBuilder<BuildPartBloc, BuildPartState>(
        builder: (context, state) {
          BlocProvider.of<BuildPartBloc>(context)
              .add(GetPartList(buildID: widget.buildID));
          if (state is BuildPartLoaded) {
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.partList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: (MediaQuery.of(context).size.width / 1.1) /
                      (MediaQuery.of(context).size.height / 6)),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return HorizontalPartTile(
                  partEntity: state.partList[index],
                );
              },
            );
          }
          if (state is BuildPartError) {
            return Text("error");
          }

          if (state is BuildPartLoading) {
            return Text("loading");
          }
          if (state is BuildPartInitial) {
            return Container();
          }
          return Container(
            height: 0.0,
            width: 0.0,
          );
        },
      ),
    );
  }
}
