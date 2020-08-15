import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/psu.dart';
import 'package:meta/meta.dart';

class PSUModel extends PSU {
  PSUModel(
      {@required partID,
      @required manufacture,
      @required formFactor,
      @required efficiencyRating,
      @required wattage,
      @required length,
      @required modular,
      @required color,
      @required type,
      @required fanLess,
      @required epsConnector,
      @required pcie62pinConnector,
      @required sataConnector,
      @required molex4pinConnector,
      @required upVote})
      : super(
            partID: partID,
            manufacture: manufacture,
            formFactor: formFactor,
            efficiencyRating: efficiencyRating,
            wattage: wattage,
            length: length,
            modular: modular,
            color: color,
            type: type,
            fanLess: fanLess,
            epsConnector: epsConnector,
            pcie62pinConnector: pcie62pinConnector,
            sataConnector: sataConnector,
            molex4pinConnector: molex4pinConnector,
            upVote: upVote);

  factory PSUModel.from(DocumentSnapshot ds) {
    return PSUModel(
        partID: ds.documentID,
        manufacture: ds.data["manufacture"],
        formFactor: ds.data["formFactor"],
        efficiencyRating: ds.data["efficiencyRating"],
        wattage: ds.data["wattage"],
        length: ds.data["length"],
        modular: ds.data["modular"],
        color: ds.data["color"],
        type: ds.data["type"],
        fanLess: ds.data["fanLess"],
        epsConnector: ds.data["epsConnector"],
        pcie62pinConnector: ds.data["pcie62pinConnector"],
        sataConnector: ds.data["sataConnector"],
        molex4pinConnector: ds.data["molex4pinConnector"],
        upVote: ds.data["upVote"]);
  }
}
