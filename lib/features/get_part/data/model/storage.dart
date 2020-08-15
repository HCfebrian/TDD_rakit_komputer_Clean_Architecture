import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/storage.dart';
import 'package:meta/meta.dart';

class StorageModel extends Storage {
  StorageModel({
    @required partID,
    @required manufacture,
    @required capacity,
    @required pricePerGB,
    @required type,
    @required formFactor,
    @required interface,
    @required nvme,
    @required upVote,
  }) : super(
          partID: partID,
          manufacture: manufacture,
          capacity: capacity,
          pricePerGB: pricePerGB,
          type: type,
          formFactor: formFactor,
          interface: interface,
          nvme: nvme,
          upVote: upVote,
        );

  factory StorageModel.from(DocumentSnapshot ds) {
    return StorageModel(
        partID: ds.documentID,
        manufacture: ds.data["manufacture"],
        capacity: ds.data["capacity"],
        pricePerGB: ds.data["pricePerGB"],
        type: ds.data["type"],
        formFactor: ds.data["formFactor"],
        interface: ds.data["interface"],
        nvme: ds.data["nvme:"],
        upVote: ds.data["upVote`"]);
  }
}
