import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/case.dart';
import 'package:meta/meta.dart';

class CaseModel extends Case {
  CaseModel(
      {@required partID,
      @required manufacture,
      @required type,
      @required color,
      @required powerSupply,
      @required sidePanel,
      @required powerSupplyShroud,
      @required frontPanelUSB,
      @required motherboardFormFactor,
      @required fullHeightExpansionSlot,
      @required halfHeightExpansionSlot,
      @required maximumVideoCardLength,
      @required dimension,
      @required internal25bays,
      @required internal35bays,
      @required volume,
      @required upVote})
      : super(
            partID: partID,
            manufacture: manufacture,
            type: type,
            color: color,
            powerSupply: powerSupply,
            sidePanel: sidePanel,
            powerSupplyShroud: powerSupplyShroud,
            frontPanelUSB: frontPanelUSB,
            motherboardFormFactor: motherboardFormFactor,
            fullHeightExpansionSlot: fullHeightExpansionSlot,
            halfHeightExpansionSlot: halfHeightExpansionSlot,
            maximumVideoCardLength: maximumVideoCardLength,
            dimension: dimension,
            internal25bays: internal25bays,
            internal35bays: internal35bays,
            volume: volume,
            upVote: upVote);

  factory CaseModel.from(DocumentSnapshot ds) {
    return CaseModel(
      partID: ds.documentID,
      manufacture: ds.data["manufacture"],
      type: ds.data["type"],
      color: ds.data["oolor"],
      powerSupply: ds.data["powerSupply"],
      sidePanel: ds.data["sidePanel"],
      powerSupplyShroud: ds.data["powerSupplyShroud"],
      frontPanelUSB: ds.data["frontPanelUSB"],
      motherboardFormFactor: ds.data["motherboardFormFactor"],
      fullHeightExpansionSlot: ds.data["fullHeightExpansionSlot"],
      halfHeightExpansionSlot: ds.data["halfHeightExpansionSlot"],
      maximumVideoCardLength: ds.data["maximumVideoCardLength"],
      dimension: ds.data["dimension"],
      internal25bays: ds.data["internal25bays"],
      internal35bays: ds.data["internal35bays"],
      volume: ds.data["volume"],
      upVote: ds.data["upVote"],
    );
  }
}
