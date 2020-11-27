import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/radii.dart';
import 'package:rakit_komputer/core/values/shadows.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/get_build/presentation/pages/complated_build_detail_page.dart';
import 'package:rakit_komputer/features/get_build/domain/entity/build_entity.dart';

class VerticalBuildTile extends StatelessWidget {
  final BuildEntity buildEntity;

  const VerticalBuildTile({
    Key key,
    @required this.buildEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => BuildDetailPage(
                      buildEntity: buildEntity,
                    )));
      },
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          width: 150,
          height: 305,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: Radii.appTileRadius8,
            boxShadow: [
              Shadows.primaryShadow,
            ],
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                // child: Placeholder(),
                child: ClipRRect(
                    borderRadius: Radii.appTileRadius8,
                    child: Image.network(
                      buildEntity.picURL,
                      fit: BoxFit.fitHeight,
                    )),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left:12, right:12, top: 8),
                child: Text(
                  "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style:  AppStyle.bodyTextVerySmall(Colors.grey),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left:12, right:12, top: 4),
                alignment: Alignment.centerLeft,
                child: Text(
                  buildEntity.title,
                  style: AppStyle.heading2(AppColors.accentColor),
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(child: Container()),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left:12, right:12, bottom: 4),
                child: Text(
                  "Rp "+ buildEntity.overallPrice,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style:  AppStyle.heading3(AppColors.primaryColor),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left:12, right:12, top: 4),
                child: Text(
                  buildEntity.cpu,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style:  AppStyle.bodyTextVerySmall(Colors.grey),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left:12, right:12, top: 4),
                child: Text(
                  buildEntity.gpu,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style:  AppStyle.bodyTextVerySmall(Colors.grey),
                ),
              ),
              SizedBox(height: 8,),
              Container(
                margin: EdgeInsets.only(bottom: 10 ),
                child: Row(children: [
                  SizedBox(width: 12,),
                  Icon(Icons.arrow_upward, color: AppColors.accentColor,size: 12,),
                  SizedBox(width: 4,),
                  Text("20", style: AppStyle.bodyTextVerySmall(AppColors.accentColor),),
                  SizedBox(width: 8,),
                  Icon(Icons.messenger_outline, color: AppColors.accentColor,size: 12,),
                  SizedBox(width: 4,),
                  Text("20", style: AppStyle.bodyTextVerySmall(AppColors.accentColor),),
                ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}
