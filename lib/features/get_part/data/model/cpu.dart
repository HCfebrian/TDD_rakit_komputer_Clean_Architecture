import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/cpu.dart';

class CPUModel extends CPUEntity {
  factory CPUModel.from(DocumentSnapshot ds) {
    return CPUModel(
        partID: ds.documentID,
        coreClock: ds.data["core_clock"],
        name: ds.data["name"],
        boostClock: ds.data["boost_clock"],
        manufacture: ds.data["manufacture"],
        model: ds.data["model"],
        coreCount: ds.data["core_count"],
        tdp: ds.data["tdp"],
        series: ds.data["series"],
        microArchitecture: ds.data["micro_architecture"],
        coreFamily: ds.data["core_family"],
        socket: ds.data["socket"],
        integratedGpu: ds.data["integrated_gpu"],
        includeCooler: ds.data["include_cooler"],
        lithography: ds.data["lithography"],
        upVote: ds.data["upvote"],
        photoURL: ds.data["photo_url"]);
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
