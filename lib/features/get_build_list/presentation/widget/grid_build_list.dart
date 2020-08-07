import 'package:flutter/material.dart';
import 'package:rakit_komputer/features/get_build_list/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_build_list/presentation/widget/vertical_tile_widget.dart';

class GridBuildList extends StatelessWidget {
  final List<BuildEntity> listBuild;

  const GridBuildList({
    Key key,
    @required this.listBuild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (MediaQuery.of(context).size.width/4) /
                (MediaQuery.of(context).size.height / 6)),
        itemCount: listBuild.length,
        itemBuilder: (BuildContext context, int index) {
          return VerticalTile(buildEntity: listBuild[index]);
        },
      ),
    );
  }
}
