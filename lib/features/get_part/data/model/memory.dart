import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/memory.dart';
import 'package:meta/meta.dart';

class MemoryModel extends Memory {
  MemoryModel(
      {@required partID,
      @required manufacture,
      @required formFactor,
      @required modules,
      @required pricePerGB,
      @required color,
      @required firstWordLatency,
      @required casLatency,
      @required voltage,
      @required timing,
      @required eccRegistered,
      @required heatSpreader,
      @required upVote})
      : super(
            partID: partID,
            manufacture: manufacture,
            formFactor: formFactor,
            modules: modules,
            pricePerGB: pricePerGB,
            color: color,
            firstWordLatency: firstWordLatency,
            casLatency: casLatency,
            voltage: voltage,
            timing: timing,
            eccRegistered: eccRegistered,
            heatSpreader: heatSpreader,
            upVote: upVote);

  factory MemoryModel.from(DocumentSnapshot ds) {
    return MemoryModel(
        partID: ds.documentID,
        manufacture: ds.data["manufacture"],
        formFactor: ds.data["formFactor"],
        modules: ds.data["modules"],
        pricePerGB: ds.data["pricePerGB"],
        color: ds.data["color"],
        firstWordLatency: ds.data["firstWordLatency"],
        casLatency: ds.data["casLatency"],
        voltage: ds.data["voltage"],
        timing: ds.data["timing"],
        eccRegistered: ds.data["eccRegistered"],
        heatSpreader: ds.data["heatSpreader"],
        upVote: ds.data["upVote"]);
  }
}
