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
}
