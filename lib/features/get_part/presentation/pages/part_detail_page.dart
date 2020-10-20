import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/features/get_part/presentation/bloc/part_detail/part_detail_bloc.dart';
import 'package:rakit_komputer/features/get_part/presentation/widget/cpu_detail/cpu_subspec.dart';
import 'package:rakit_komputer/features/get_part/presentation/widget/row_title.dart';
import 'package:rakit_komputer/features/get_part/presentation/widget/sliver_app_bar.dart';

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
        backgroundColor: AppColors.backgroundColor,
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
              delegate: SliverAppBarDelegate(
                minHeight: 70,
                maxHeight: 70,
                child: buildRow(context, state.cpu),
              ),
              pinned: true,
            ),
            SliverFixedExtentList(
              itemExtent: 50,
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return buildSubSpec(index, state.cpu);
              }, childCount: 13),
            ),
          ],
        );
      }
      return Text("empty");
    });
  }
}
