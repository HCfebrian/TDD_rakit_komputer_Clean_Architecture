import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/radii.dart';
import 'package:rakit_komputer/core/values/shadows.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/get_build/presentation/pages/complated_build_detail_page.dart';
import 'package:rakit_komputer/features/get_build/domain/entity/build_entity.dart';

class HorizontalBuildTile extends StatelessWidget {
  final BuildEntity buildEntity;

  const HorizontalBuildTile({
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
          height: 165,
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: Radii.appTileRadius8,
            boxShadow: [
              Shadows.primaryShadow,
            ],
          ),
          child: Row(
            children: <Widget>[
              Container(
                child: ClipRRect(
                    borderRadius: Radii.appTileRadius8,
                    child: Image.network(
                      buildEntity.picURL,
                      fit: BoxFit.cover,
                    )),
                height: 165,
                width: 149,
                decoration: BoxDecoration(
                  borderRadius: Radii.appTileRadius8,
                  boxShadow: [
                    Shadows.primaryShadow,
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 15, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Text(
                          buildEntity.owner,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyle.bodyTextVerySmall(Colors.grey),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        child: Text(
                          buildEntity.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyle.heading2(AppColors.accentColor),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Rp " + buildEntity.overallPrice,
                        maxLines: 1,
                        style: AppStyle.heading2(AppColors.primaryColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      Text(
                        buildEntity.cpu.toString(),
                        maxLines: 1,
                        style: AppStyle.bodyTextVerySmall(Colors.grey),
                      ),
                      SizedBox(height: 4),
                      Text(
                        buildEntity.gpu.toString(),
                        maxLines: 1,
                        style: AppStyle.bodyTextVerySmall(Colors.grey),
                      ),
                      Expanded(child: Container()),
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: Row(children: [
                          Icon(Icons.arrow_upward,color: AppColors.accentColor,size: 12,),
                          SizedBox(width: 4,),
                          Text("150", style: AppStyle.bodyTextVerySmall(AppColors.accentColor),),
                          SizedBox(width: 8,),
                          Icon(Icons.messenger_outline, color: AppColors.accentColor,size: 12,),
                          SizedBox(width: 4,),
                          Text("98", style: AppStyle.bodyTextVerySmall(AppColors.accentColor),)
                        ],),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
