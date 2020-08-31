import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/cpu.dart';
import 'package:rakit_komputer/features/get_part/presentation/bloc/part_detail/part_detail_bloc.dart';

import '../../../../injection_container.dart';

class PartDetailPage extends StatefulWidget {
  final partID, partType;

  const PartDetailPage(
      {Key key, @required this.partID, @required this.partType})
      : super(key: key);

  @override
  _PartDetailPageState createState() => _PartDetailPageState();
}

class _PartDetailPageState extends State<PartDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PartDetailBloc>(
      create: (BuildContext context) => sl<PartDetailBloc>(),
      child: Scaffold(
        body: SliverContent(partType: widget.partType, partID: widget.partID),
      ),
    );
  }
}

class SliverContent extends StatelessWidget {
  final partID, partType;

  const SliverContent({
    Key key,
    this.partID,
    this.partType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PartDetailBloc>(context)
        .add(GetPartEvent(partID: partID, partType: partType));

    return BlocBuilder<PartDetailBloc, PartDetailState>(
        builder: (context, state) {
      if (state is PartDetailInitial) {
        return Text("initial");
      }

      if (state is PartDetailLoading) {
        return Text("Loading");
      }

      if (state is PartDetailError) {
        return Text("Error");
      }

      if (state is PartDetailCPULoaded) {
        return CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: Icon(Icons.arrow_back_ios),
              title: Text("CPU"),
              centerTitle: true,
              pinned: true,
              backgroundColor: AppColors.secondaryElement,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  state.cpu.photoURL,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                  minHeight: 70,
                  maxHeight: 70,
                  child: buildRow(context, state.cpu)),
              pinned: true,
            ),
            SliverFixedExtentList(
              itemExtent: 50,
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return _buildSubSpec(index, state.cpu);
              }, childCount: 13),
            ),
          ],
        );
      }
      return Text("empty");
    });
  }
}

Widget _buildSubSpec(int index, CPUEntity cpuEntity) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              indexToSubCategory(index),
              style: AppStyle.textBlackLight14,
            ),
            Center(child: Text(indexToCPUSpec(index, cpuEntity))),
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

Widget buildRow(BuildContext context, dynamic partDetail) {
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
            partDetail.title,
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

String indexToSubCategory(int index) {
  switch (index) {
    case 0:
      return "Manufacture";
    case 1:
      return "Model";
    case 2:
      return "Core Count";
    case 3:
      return "Core Clock";
    case 4:
      return "Boost Clock";
    case 5:
      return "TDP";
    case 6:
      return "Series";
    case 7:
      return "Micro Architecture";
    case 8:
      return "Core Family";
    case 9:
      return "Socket";
    case 10:
      return "Integrated Graphic";
    case 11:
      return "Include Cooler";
    case 12:
      return "Lithography";
    default:
      return "unknown spec";
  }
}

dynamic indexToCPUSpec(int index, CPUEntity cpuEntity) {
  switch (index) {
    case 0:
      return cpuEntity.manufacture;
    case 1:
      return cpuEntity.model;
    case 2:
      return cpuEntity.coreCount;
    case 3:
      return cpuEntity.coreClock;
    case 4:
      return cpuEntity.boostClock;
    case 5:
      return cpuEntity.tdp;
    case 6:
      return cpuEntity.series;
    case 7:
      return cpuEntity.microArchitecture;
    case 8:
      return cpuEntity.coreFamily;
    case 9:
      return cpuEntity.socket;
    case 10:
      return cpuEntity.integratedGpu;
    case 11:
      return cpuEntity.includeCooler;
    case 12:
      return cpuEntity.lithography;
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
