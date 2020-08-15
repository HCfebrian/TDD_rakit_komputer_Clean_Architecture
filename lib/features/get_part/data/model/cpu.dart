import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/cpu.dart';

class CPUModel extends CPU {
  CPUModel(
      {@required partID,
      @required coreClock,
      @required boostClock,
      @required manufacture,
      @required model,
      @required coreCount,
      @required tdp,
      @required series,
      @required microArchitecture,
      @required coreFamily,
      @required socket,
      @required integratedGpu,
      @required includeCooler,
      @required lithography,
      @required upVote})
      : super(
            partID: partID,
            coreClock: coreClock,
            boostClock: boostClock,
            manufacture: manufacture,
            model: model,
            coreCount: coreCount,
            tdp: tdp,
            series: series,
            microArchitecture: microArchitecture,
            coreFamily: coreFamily,
            socket: socket,
            integratedGpu: integratedGpu,
            includeCooler: includeCooler,
            lithography: lithography,
            upVote: upVote);

  factory CPUModel.from(DocumentSnapshot ds) {
    return CPUModel(
        partID: ds.documentID,
        coreClock: ds.data["coreClock"],
        boostClock: ds.data["boostClock"],
        manufacture: ds.data["manufacture"],
        model: ds.data["model"],
        coreCount: ds.data["coreCount"],
        tdp: ds.data["tdp"],
        series: ds.data["series"],
        microArchitecture: ds.data["microArchitecture"],
        coreFamily: ds.data["coreFamily"],
        socket: ds.data["socket"],
        integratedGpu: ds.data["integratedGpu"],
        includeCooler: ds.data["includeCooler"],
        lithography: ds.data["lithography"],
        upVote: ds.data["upVote"]);
  }
}
