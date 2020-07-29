import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:rakit_komputer/features/get_build_list/presentation/bloc/recommended_build_bloc.dart';

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
                Text(
                  "See Others",
                  style: AppStyle.textRedRegular14,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          BlocBuilder(
            builder: (BuildContext context, state) {
              if(state is CompletedBuildLoading){
                return Column(
                  children: <Widget>[
                    SizedBox(width: 14),
                    Text("Loading"),
                    SizedBox(width: 14),
                  ],
                );
              }
              if(state is CompletedBuildError){
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
                    HorizontalTile(),
                    HorizontalTile(),
                    HorizontalTile(),
                    HorizontalTile(),
                    SizedBox(width: 14),
                  ],
                );
              }
              else{
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
