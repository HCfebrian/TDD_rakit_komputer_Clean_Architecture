import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Storage extends Equatable {
  final partID,
      manufacture,
      capacity,
      pricePerGB,
      type,
      formFactor,
      interface,
      nvme,
      upVote;

  Storage({
      @required this.partID,
      @required this.manufacture,
      @required this.capacity,
      @required this.pricePerGB,
      @required this.type,
      @required this.formFactor,
      @required this.interface,
      @required this.nvme,
      @required this.upVote});

  @override
  List<Object> get props => [
        partID,
        manufacture,
        capacity,
        pricePerGB,
        type,
        formFactor,
        interface,
        nvme,
        upVote
      ];
}
