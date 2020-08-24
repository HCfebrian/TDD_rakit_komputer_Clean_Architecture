import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CPUEntity extends Equatable {
  final partID,
      manufacture,
      model,
      coreCount,
      coreClock,
      boostClock,
      tdp,
      series,
      microArchitecture,
      coreFamily,
      socket,
      integratedGpu,
      includeCooler,
      lithography,
      upVote;

  CPUEntity({
    @required this.partID,
    @required this.coreClock,
    @required this.boostClock,
    @required this.manufacture,
    @required this.model,
    @required this.coreCount,
    @required this.tdp,
    @required this.series,
    @required this.microArchitecture,
    @required this.coreFamily,
    @required this.socket,
    @required this.integratedGpu,
    @required this.includeCooler,
    @required this.lithography,
    @required this.upVote,
  });

  @override
  List<Object> get props => [
        partID,
        manufacture,
        model,
        coreCount,
        coreClock,
        boostClock,
        tdp,
        series,
        microArchitecture,
        coreFamily,
        socket,
        integratedGpu,
        includeCooler,
        lithography,
        upVote
      ];
}
