import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PSU extends Equatable {
  final partID,
      manufacture,
      formFactor,
      efficiencyRating,
      wattage,
      length,
      modular,
      color,
      type,
      fanLess,
      epsConnector,
      pcie62pinConnector,
      sataConnector,
      molex4pinConnector,
      upVote;

  PSU(
      {@required this.partID,
      @required this.manufacture,
      @required this.formFactor,
      @required this.efficiencyRating,
      @required this.wattage,
      @required this.length,
      @required this.modular,
      @required this.color,
      @required this.type,
      @required this.fanLess,
      @required this.epsConnector,
      @required this.pcie62pinConnector,
      @required this.sataConnector,
      @required this.molex4pinConnector,
      @required this.upVote});

  @override
  List<Object> get props => [
        partID,
        manufacture,
        formFactor,
        efficiencyRating,
        wattage,
        length,
        modular,
        color,
        type,
        fanLess,
        epsConnector,
        pcie62pinConnector,
        sataConnector,
        molex4pinConnector,
        upVote
      ];
}
