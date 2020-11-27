import 'package:flutter/material.dart';
import 'package:rakit_komputer/features/get_build/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_build/presentation/widget/vertical_build_tile_widget.dart';

class GridBuildList extends StatelessWidget {
  final List<BuildEntity> listBuild;
  final ScrollController controller;

  const GridBuildList({
    Key key,
    @required this.listBuild, @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: CustomScrollView(
        controller: controller,
        slivers: [
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (c, i) => VerticalBuildTile(buildEntity: listBuild[i]),
              childCount: listBuild.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (MediaQuery.of(context).size.width / 4) /
                    (MediaQuery.of(context).size.height / 4.2)),
          ),
          SliverToBoxAdapter(
            child: Container(height:60,child: Container(height: 50,child: Center(child: CircularProgressIndicator()))),
          ),
        ],
      ),
    );
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (MediaQuery.of(context).size.width / 4) /
                (MediaQuery.of(context).size.height / 4.2)),
        itemCount: listBuild.length,
        itemBuilder: (BuildContext context, int index) {
          return VerticalBuildTile(buildEntity: listBuild[index]);
        },
      ),
    );
  }
}
