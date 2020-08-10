import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/radii.dart';
import 'package:rakit_komputer/core/values/shadows.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/build_detail/presentation/pages/finished_build_detail_page.dart';
import 'package:rakit_komputer/features/get_build_list/domain/entity/build_entity.dart';

class VerticalTile extends StatelessWidget {
  final BuildEntity buildEntity;

  const VerticalTile({
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
          width: 160,
          height: 208,
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
                height: 126,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                    borderRadius: Radii.topLeftRightRadius8,
                    child: Image.network(
                      buildEntity.picURL,
                      fit: BoxFit.cover,
                    )),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.center,
                  child: Text(
                    buildEntity.title.toUpperCase(),
                    style: AppStyle.textBlackSemiBold14,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  buildEntity.overallPrice,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppStyle.textBlackBold14,
                ),
              ),
              SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
