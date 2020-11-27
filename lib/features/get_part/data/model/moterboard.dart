import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/moterboard.dart';
import 'package:meta/meta.dart';

class MotherboardModel extends Motherboard {
  MotherboardModel(
      {@required partID,
      @required manufacture,
      @required model,
      @required socket,
      @required chipSet,
      @required memoryMax,
      @required memoryType,
      @required upVote,
      @required formFactor,
      @required memorySlot,
      @required memorySpeed,
      @required multiGpu,
      @required pciEx16slot,
      @required pciEx8slot,
      @required pciEx4slot,
      @required pciEx1slot,
      @required m2slot,
      @required mSataSlot,
      @required onBoardInternet,
      @required sata6GB,
      @required onBoardVideo,
      @required usb20,
      @required usb32,
      @required supportECC,
      @required wirelessNetworking,
      @required raidSupport})
      : super(
            partID: partID,
            manufacture: manufacture,
            model: model,
            socket: socket,
            chipSet: chipSet,
            memoryMax: memoryMax,
            memoryType: memoryType,
            upVote: upVote,
            formFactor: formFactor,
            memorySlot: memorySlot,
            memorySpeed: memorySpeed,
            multiGpu: multiGpu,
            pciEx16slot: pciEx16slot,
            pciEx8slot: pciEx8slot,
            pciEx4slot: pciEx4slot,
            pciEx1slot: pciEx1slot,
            m2slot: m2slot,
            mSataSlot: mSataSlot,
            onBoardInternet: onBoardInternet,
            sata6GB: sata6GB,
            onBoardVideo: onBoardVideo,
            usb20: usb20,
            usb32: usb32,
            supportECC: supportECC,
            wirelessNetworking: wirelessNetworking,
            raidSupport: raidSupport);

  factory MotherboardModel.from(DocumentSnapshot ds) {
    return MotherboardModel(
        partID: ds.documentID,
        manufacture: ds.data[""],
        model: ds.data["model"],
        socket: ds.data["socket"],
        chipSet: ds.data["chipSet"],
        memoryMax: ds.data["memoryMax"],
        memoryType: ds.data["memoryType"],
        upVote: ds.data["upVote"],
        formFactor: ds.data["formFactor"],
        memorySlot: ds.data["memorySlot"],
        memorySpeed: ds.data["memorySpeed"],
        multiGpu: ds.data["multiGpu"],
        pciEx16slot: ds.data["pciEx16slot"],
        pciEx8slot: ds.data["pciEx8slot"],
        pciEx4slot: ds.data["pciEx4slot"],
        pciEx1slot: ds.data["pciEx1slot"],
        m2slot: ds.data["m2slot"],
        mSataSlot: ds.data["mSataSlot"],
        onBoardInternet: ds.data["onBoardInternet"],
        sata6GB: ds.data["sata6GB"],
        onBoardVideo: ds.data["onBoardVideo"],
        usb20: ds.data["usb20"],
        usb32: ds.data["usb32"],
        supportECC: ds.data["supportECC"],
        wirelessNetworking: ds.data["wirelessNetworking"],
        raidSupport: ds.data["raidSupport"]);
  }
}