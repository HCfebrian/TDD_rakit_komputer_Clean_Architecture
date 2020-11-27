import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/cpu_cooler.dart';
import 'package:meta/meta.dart';

class CPUCoolerModel extends CPUCooler {
  CPUCoolerModel({
    @required partID,
    @required manufacture,
    @required model,
    @required fanRPM,
    @required noiseLevel,
    @required color,
    @required cpuSocket,
    @required waterCooled,
    @required fanless,
    @required upVote,
  }) : super(
          partID: partID,
          manufacture: manufacture,
          model: model,
          fanRPM: fanRPM,
          noiseLevel: noiseLevel,
          color: color,
          cpuSocket: cpuSocket,
          waterCooled: waterCooled,
          fanless: fanless,
          upVote: upVote,
        );

  factory CPUCoolerModel.from(DocumentSnapshot ds) {
    return CPUCoolerModel(
        partID: ds.documentID,
        manufacture: ds.data["manufacture"],
        model: ds.data["model"],
        fanRPM: ds.data["fanRPM"],
        noiseLevel: ds.data["noiseLevel"],
        color: ds.data["color"],
        cpuSocket: ds.data["cpuSocket"],
        waterCooled: ds.data["waterCooled"],
        fanless: ds.data["fanless"],
        upVote: ds.data["upVote"]);
  }
}
