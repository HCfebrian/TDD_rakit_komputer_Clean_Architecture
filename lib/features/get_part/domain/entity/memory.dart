import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Memory extends Equatable {
  final partID,
      manufacture,
      formFactor,
      modules,
      pricePerGB,
      color,
      firstWordLatency,
      casLatency,
      voltage,
      timing,
      eccRegistered,
      heatSpreader,
      upVote;

  Memory(
      {@required this.partID,
      @required this.manufacture,
      @required this.formFactor,
      @required this.modules,
      @required this.pricePerGB,
      @required this.color,
      @required this.firstWordLatency,
      @required this.casLatency,
      @required this.voltage,
      @required this.timing,
      @required this.eccRegistered,
      @required this.heatSpreader,
      @required this.upVote});

  @override
  List<Object> get props => [
        partID,
        manufacture,
        formFactor,
        modules,
        pricePerGB,
        color,
        firstWordLatency,
        casLatency,
        voltage,
        timing,
        eccRegistered,
        heatSpreader,
        upVote
      ];
}
