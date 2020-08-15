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
}
