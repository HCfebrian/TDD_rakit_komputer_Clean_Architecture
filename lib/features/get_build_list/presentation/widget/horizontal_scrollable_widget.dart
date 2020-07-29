import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/get_build_list/presentation/bloc/recommended_build_bloc.dart';
import 'package:rakit_komputer/features/get_build_list/presentation/widget/vertical_tile_widget.dart';

class HorizontalScrollableSection extends StatelessWidget {
  const HorizontalScrollableSection({
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
                  "Rekomendasi PC",
                  style: AppStyle.textBlackSemiBold16,
                  textAlign: TextAlign.left,
                ),
                GestureDetector(
                  onTap: (){
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
          BlocBuilder<RecommendedBuildBloc, RecommendedBuildState>(
            buildWhen: (p ,n ) => true,
              builder: (context, state) {
                if(state is RecommendedLoading){
                  print("loading");
                  return Text("Loading");
                }

                if(state is RecommendedEmpty){
                  print("empty");
                  return Text("empty");
                }
                
                if(state is RecommendedLoaded){
                  print("Loaded");
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 18),
                        VerticalTile(buildList: state.recommendedBuild[0],),
                        VerticalTile(buildList: state.recommendedBuild[1],),
                        VerticalTile(buildList: state.recommendedBuild[2],),
                        VerticalTile(buildList: state.recommendedBuild[3],),
                        VerticalTile(buildList: state.recommendedBuild[4],),
                        SizedBox(width: 14),
                      ],
                    ),
                  );
                }
                else{
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
