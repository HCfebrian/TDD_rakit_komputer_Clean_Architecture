import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/graphic_card.dart';
import 'package:meta/meta.dart';

class GraphicCardModel extends GraphicCardEntity {
  GraphicCardModel(
      {@required partID,
      @required manufacture,
      @required chipSet,
      @required memory,
      @required memoryType,
      @required coreClock,
      @required boostClock,
      @required effectiveMemClock,
      @required interface,
      @required color,
      @required frameSync,
      @required length,
      @required tdp,
      @required dvi,
      @required hdmi,
      @required miniHdmi,
      @required displayPort,
      @required miniDisplayPort,
      @required expansionSlotWidth,
      @required cooling,
      @required externalPower,
      @required upVote})
      : super(
            partID: partID,
            manufacture: manufacture,
            chipSet: chipSet,
            memory: memory,
            memoryType: memoryType,
            coreClock: coreClock,
            boostClock: boostClock,
            effectiveMemClock: effectiveMemClock,
            interface: interface,
            color: color,
            frameSync: frameSync,
            length: length,
            tdp: tdp,
            dvi: dvi,
            hdmi: hdmi,
            miniHdmi: miniHdmi,
            displayPort: displayPort,
            miniDisplayPort: miniDisplayPort,
            expansionSlotWidth: expansionSlotWidth,
            cooling: cooling,
            externalPower: externalPower,
            upVote: upVote);

  factory GraphicCardModel.from(DocumentSnapshot ds) {
    return GraphicCardModel(
        partID: ds.documentID,
        manufacture: ds.data["manufacture"],
        chipSet: ds.data["chipSet"],
        memory: ds.data["memory"],
        memoryType: ds.data["memoryType"],
        coreClock: ds.data["coreClock"],
        boostClock: ds.data["boostClock"],
        effectiveMemClock: ds.data["effectiveMemClock"],
        interface: ds.data["interface"],
        color: ds.data["color"],
        frameSync: ds.data["frameSync"],
        length: ds.data["length"],
        dvi: ds.data["dvi"],
        hdmi: ds.data["hdmi"],
        miniHdmi: ds.data["miniHdmi"],
        displayPort: ds.data["displayPort"],
        miniDisplayPort: ds.data["miniDisplayPort"],
        expansionSlotWidth: ds.data["expansionSlotWidth"],
        cooling: ds.data["cooling"],
        externalPower: ds.data["externalPower"],
        upVote: ds.data["upVote"],
        tdp: ds.data["tdp"]);
  }
}
