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
                Text(
                  "See Others",
                  style: AppStyle.textRedRegular14,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),

          BlocBuilder<RecommendedBuildBloc,RecommendedBuildState>(builder: (context, state){
            if(state is Loaded){
              print("if true berarti salah karena build list empty");
              print(state.recommendedBuild.isNotEmpty);
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 18),
                    Container(),
                    SizedBox(width: 14),
                  ],
                ),
              );
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  SizedBox(width: 18),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                  SizedBox(width: 14),
                ],
              ),
            );
          }),

        ],
      ),
    );
  }
}
