import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/radii.dart';
import 'package:rakit_komputer/core/values/shadows.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/get_build/presentation/bloc/featured_build/get_featured_build_bloc.dart';
import 'package:rakit_komputer/features/get_build/presentation/pages/complated_build_detail_page.dart';

class FeaturedBuild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBuildBloc, FeaturedBuildState>(
        builder: (context, state) {
      if (state is LoadingFeatured) {
        return Text("loading");
      }
      if (state is LoadedFeatured) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => BuildDetailPage(
                      buildEntity: state.featuredBuild,
                    )));
          },
          child: Container(
            height: 292,
            margin: EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
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
                        color: AppColors.primaryColor,
                        borderRadius: Radii.topLeftRightRadius20,
                        boxShadow: [
                          Shadows.primaryShadow,
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      child: Center(
                        child: Text(
                          "Featured Build",
                          style: AppStyle.textWhiteBold14,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 252,
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                          child: Container(
                        height: 128,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: NetworkImage(state.featuredBuild.picURL),
                          ),
                        ),
                      )),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: Radii.bottomLeftRightRadius8),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(top: 8),
                                        child: Text(
                                          state.featuredBuild.owner,
                                          style: AppStyle.bodyTextVerySmall(
                                              Colors.grey),
                                        ))
                                  ],
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 2),
                                    child: Text(
                                      state.featuredBuild.title,
                                      style: AppStyle.heading2(
                                          AppColors.accentColor),
                                    )),
                                Container(
                                  margin: EdgeInsets.only(top: 6),
                                  child: Text(
                                    state.featuredBuild.cpu.toString(),
                                    style:
                                        AppStyle.bodyTextVerySmall(Colors.grey),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 4),
                                  child: Text(
                                    state.featuredBuild.gpu,
                                    style:
                                        AppStyle.bodyTextVerySmall(Colors.grey),
                                  ),
                                ),
                                Expanded(child: Container()),
                                Divider(
                                  thickness: 1,
                                  color: Colors.grey.shade200,
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 8,),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Rp. " +
                                            state.featuredBuild.overallPrice,
                                        style: AppStyle.heading3(
                                            AppColors.primaryColor),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "188",
                                            style: AppStyle.bodyTextVerySmall(
                                                AppColors.accentColor),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Icon(
                                            Icons.arrow_upward,
                                            color: AppColors.accentColor,
                                            size: 12,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "188",
                                            style: AppStyle.bodyTextVerySmall(
                                                AppColors.accentColor),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Icon(
                                            Icons.messenger_outline,
                                            color: AppColors.accentColor,
                                            size: 12,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
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
