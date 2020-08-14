class CPU {
  final manufacture,
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

  CPU(
    this.coreClock,
    this.boostClock,
    this.manufacture,
    this.model,
    this.coreCount,
    this.tdp,
    this.series,
    this.microArchitecture,
    this.coreFamily,
    this.socket,
    this.integratedGpu,
    this.includeCooler,
    this.lithography,
    this.upVote,
  );
}
