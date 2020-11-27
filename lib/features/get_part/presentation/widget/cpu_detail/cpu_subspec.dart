
import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/cpu.dart';

Widget buildSubSpec(int index, CPUEntity cpuEntity) {
  return Container(
    color: AppColors.backgroundColor,
    padding: EdgeInsets.symmetric(horizontal: 20),
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