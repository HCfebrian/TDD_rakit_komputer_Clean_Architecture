import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/presentation/widget/custom_textfield.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/get_build/presentation/bloc/completed_build/completed_build_bloc.dart';
import 'package:rakit_komputer/features/get_build/presentation/bloc/recommended_build/recommended_build_bloc.dart';
import 'package:rakit_komputer/features/get_build/presentation/widget/completed_build_list.dart';
import 'package:rakit_komputer/features/get_build/presentation/widget/recommended_build_list.dart';
import 'package:rakit_komputer/injection_container.dart';

class BuildListPage extends StatelessWidget {
  final bool isRecommendedBuild;

  const BuildListPage({Key key, @required this.isRecommendedBuild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();

    return  Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: AppColors.backgroundColor,
            leading: IconButton(
              color: AppColors.accentColor,
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(
                isRecommendedBuild ? "Recommended Build" : "Completed Build",
                style: AppStyle.textBlackSemiBold22)),
        body: MultiBlocProvider(
          providers: [
            BlocProvider<CompletedBuildBloc>(
              create: (BuildContext context) => sl<CompletedBuildBloc>(),
            ),
            BlocProvider<RecommendedBuildBloc>(
              create: (BuildContext context) => sl<RecommendedBuildBloc>(),
            ),
          ],
          child: ListBuildContent(
            isRecommendedBuild: isRecommendedBuild,
          ),
        ),
      );
  }
}

class ListBuildContent extends StatelessWidget {
  final bool isRecommendedBuild;

  const ListBuildContent({
    Key key,
    @required this.isRecommendedBuild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isRecommendedBuild) {
      BlocProvider.of<RecommendedBuildBloc>(context).add(GetRecommendedList());
    } else {
      BlocProvider.of<CompletedBuildBloc>(context).add(GetInitCompletedBuildList());
    }
    return Container(
      margin: EdgeInsets.only(
        left: 12,
        right: 12,
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: CustomTextField(
                    margin: EdgeInsets.only(right: 10),
                    iconData: Icons.search,
                    hintText: "Search",
                  ),
                ),
                Image.asset(
                  "assets/images/iconFilter.png",
                  height: 34,
                  width: 34,
                )
              ],
            ),
          ),
          isRecommendedBuild
              ? RecommendedBuildList(

                )
              : CompletedBuildList(
                ),
        ],
      ),
    );
  }
}
