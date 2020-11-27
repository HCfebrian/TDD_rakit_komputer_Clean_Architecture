import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CPUCooler extends Equatable {
  final partID,
      manufacture,
      model,
      fanRPM,
      noiseLevel,
      color,
      cpuSocket,
      waterCooled,
      fanless,
      upVote;

  CPUCooler({
    @required this.partID,
    @required this.manufacture,
    @required this.model,
    @required this.fanRPM,
    @required this.noiseLevel,
    @required this.color,
    @required this.cpuSocket,
    @required this.waterCooled,
    @required this.fanless,
    @required this.upVote,
  });

  @override
  List<Object> get props => [
        partID,
        manufacture,
        model,
        fanRPM,
        noiseLevel,
        color,
        cpuSocket,
        waterCooled,
        fanless,
        upVote
      ];
}
