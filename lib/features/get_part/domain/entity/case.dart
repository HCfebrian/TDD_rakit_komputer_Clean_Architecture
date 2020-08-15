import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Case extends Equatable {
  final partID,
      manufacture,
      type,
      color,
      powerSupply,
      sidePanel,
      powerSupplyShroud,
      frontPanelUSB,
      motherboardFormFactor,
      fullHeightExpansionSlot,
      halfHeightExpansionSlot,
      maximumVideoCardLength,
      dimension,
      internal25bays,
      internal35bays,
      volume,
      upVote;

  Case(
      {@required this.partID,
      @required this.manufacture,
      @required this.type,
      @required this.color,
      @required this.powerSupply,
      @required this.sidePanel,
      @required this.powerSupplyShroud,
      @required this.frontPanelUSB,
      @required this.motherboardFormFactor,
      @required this.fullHeightExpansionSlot,
      @required this.halfHeightExpansionSlot,
      @required this.maximumVideoCardLength,
      @required this.dimension,
      @required this.internal25bays,
      @required this.internal35bays,
      @required this.volume,
      @required this.upVote});

  @override
  List<Object> get props => [
        partID,
        manufacture,
        type,
        color,
        powerSupply,
        sidePanel,
        powerSupplyShroud,
        frontPanelUSB,
        motherboardFormFactor,
        fullHeightExpansionSlot,
        halfHeightExpansionSlot,
        maximumVideoCardLength,
        dimension,
        internal25bays,
        internal35bays,
        volume,
        upVote
      ];
}
