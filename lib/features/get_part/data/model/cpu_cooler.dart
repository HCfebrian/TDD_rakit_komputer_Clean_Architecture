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
        manufacture: ds.data[""],
        model: ds.data[""],
        fanRPM: ds.data[""],
        noiseLevel: ds.data[""],
        color: ds.data[""],
        cpuSocket: ds.data[""],
        waterCooled: ds.data[""],
        fanless: ds.data[""],
        upVote: ds.data[""]);
  }
}
