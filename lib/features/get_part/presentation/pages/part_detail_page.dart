import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'dart:math' as math;

class PartDetailPage extends StatefulWidget {
  @override
  _PartDetailPageState createState() => _PartDetailPageState();
}

class _PartDetailPageState extends State<PartDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SliverContent();
  }
}

class SliverContent extends StatelessWidget {
  const SliverContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: Icon(Icons.arrow_back_ios),
            title: Text("Graphic Card"),
            centerTitle: true,
            pinned: true,
            backgroundColor: AppColors.secondaryElement,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://image.shutterstock.com/z/stock-photo-mountains-during-sunset-beautiful-natural-landscape-in-the-summer-time-407021107.jpg",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: _SliverAppBarDelegate(
                minHeight: 70, maxHeight: 70, child: buildRow(context)),
            pinned: true,
          ),
          SliverFixedExtentList(
            itemExtent: 50,
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return _buildSubSpec(index);
            }, childCount: 13),
          ),
        ],
      ),
    );
  }
}

class ScaffoldWithoutSliver extends StatelessWidget {
  const ScaffoldWithoutSliver({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text("GPU"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: AppColors.secondaryElement,
            height: 200,
            child: Image.network(
                "https://image.shutterstock.com/z/stock-photo-mountains-during-sunset-beautiful-natural-landscape-in-the-summer-time-407021107.jpg"),
          ),
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  margin: EdgeInsets.only(top: 24, left: 24, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      buildRow(context),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: AppColors.secondaryElement,
                            size: 15,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "4.5",
                            style: AppStyle.textBlackBold14,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "(300 votes)",
                            style: AppStyle.textBlackLight12,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Spesifikasi",
                        style: AppStyle.textBlackBold16,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 2,
                        color: AppColors.secondaryElement,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Manufacture",
                        style: AppStyle.textBlackLight14,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Model",
                        style: AppStyle.textBlackLight14,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Core Count",
                        style: AppStyle.textBlackLight14,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Core Clock",
                        style: AppStyle.textBlackLight14,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Boost Clock",
                        style: AppStyle.textBlackLight14,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "TDP",
                        style: AppStyle.textBlackLight14,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Series",
                        style: AppStyle.textBlackLight14,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Microarchitecture",
                        style: AppStyle.textBlackLight14,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Core Family",
                        style: AppStyle.textBlackLight14,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Socket",
                        style: AppStyle.textBlackLight14,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Integrated Graphic",
                        style: AppStyle.textBlackLight14,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Include Cooler",
                        style: AppStyle.textBlackLight14,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      _buildSubSpec(1),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildSubSpec(int index) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Lithography",
              style: AppStyle.textBlackLight14,
            ),
            Center(child: Text("7 nm")),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 1,
          color: Colors.grey,
        ),
      ],
    ),
  );
}

Widget buildRow(BuildContext context) {
  return Container(
    color: Colors.white,
    margin: EdgeInsets.symmetric(horizontal: 20),
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: (MediaQuery.of(context).size.width * 0.4),
          child: Text(
            "Geforce GTX 1080 Ti",
            style: AppStyle.textBlackSemiBold22,
            maxLines: 2,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "Cari Harga Di marchant",
          style: AppStyle.textBlackLight12,
        )
      ],
    ),
  );
}

String indexToSubSpec(int index){
  switch(index){
    case 1:
      return "Manufacture";
    case 2:
      return "Model";
    case 3:


  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
