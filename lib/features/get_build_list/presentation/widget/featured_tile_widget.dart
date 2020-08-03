import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/radii.dart';
import 'package:rakit_komputer/core/values/shadows.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/get_build_list/presentation/bloc/featured_build/get_featured_build_bloc.dart';

class FeaturedBuild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBuildBloc, FeaturedBuildState>(
        builder: (context, state) {
      if (state is LoadingFeatured) {
        return Text("loading");
      }
      if (state is LoadedFeatured) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: AppColors.secondaryElement,
            borderRadius: Radii.appTileRadius8,
            boxShadow: [
              Shadows.primaryShadow,
            ],
          ),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryElement,
                      borderRadius: Radii.topLeftRightRadius20,
                      boxShadow: [
                        Shadows.primaryShadow,
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    child: Text(
                      "Featured Build",
                      style: AppStyle.textWhiteBold14,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: Radii.bottomLeftRightRadius20,
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: NetworkImage(state.featuredBuild.picURL),
                          ),
                        ),
                      )),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white, borderRadius: Radii.appTileRadius8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          state.featuredBuild.owner,
                          style: AppStyle.textBlackSemiBold14,
                        ),
                        Text(
                          state.featuredBuild.title.toUpperCase(),
                          style: AppStyle.textBlackSemiBold14,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Rp${state.featuredBuild.overallPrice}",
                                style: AppStyle.textBlackBold14,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "200",
                                    style: AppStyle.textBlackLight12,
                                  ),
                                  Image.asset("assets/images/IconUpvote.png"),
                                  SizedBox(width: 6),
                                  Text(
                                    "200",
                                    style: AppStyle.textBlackLight12,
                                  ),
                                  SizedBox(width: 6),
                                  Image.asset("assets/images/IconComment.png"),
                                  SizedBox(width: 10),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }
      if (state is ErrorFeatured) {
        return Text("error");
      } else {
        return Text("EmptyFeatured");
      }
    });
  }
}
