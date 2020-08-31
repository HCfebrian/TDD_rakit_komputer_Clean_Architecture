import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/cpu.dart';

class CPUModel extends CPUEntity {
  factory CPUModel.from(DocumentSnapshot ds) {
    return CPUModel(
        partID: ds.documentID,
        coreClock: ds.data["coreClock"],
        name: ds.data["name"],
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
        upVote: ds.data["upVote"],
        photoURL: ds.data["photoURL"]);
  }

  CPUModel(
      {@required partID,
      @required name,
      @required boostClock,
      @required coreClock,
      @required coreCount,
      @required coreFamily,
      @required integratedGpu,
      @required includeCooler,
      @required lithography,
      @required manufacture,
      @required microArchitecture,
      @required model,
      @required tdp,
      @required series,
      @required photoURL,
      @required socket,
      @required upVote})
      : super(
          partID: partID,
          name: name,
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
          photoURL: photoURL,
          upVote: upVote,
        );
}
