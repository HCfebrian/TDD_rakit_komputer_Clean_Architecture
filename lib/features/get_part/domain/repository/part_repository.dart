import 'package:dartz/dartz.dart';
import 'package:rakit_komputer/core/error/failure.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/case.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/cpu.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/cpu_cooler.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/graphic_card.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/memory.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/moterboard.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/psu.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/storage.dart';

abstract class PartRepoAbst {
  Future<Either<Failure, Case>> getCase();

  Future<Either<Failure, CPU>> getCPU();

  Future<Either<Failure, CPUCooler>> getCPUCooler();

  Future<Either<Failure, GraphicCard>> getGraphicCard();

  Future<Either<Failure, Memory>> getMemory();

  Future<Either<Failure, Motherboard>> getMotherboard();

  Future<Either<Failure, PSU>> getPSU();

  Future<Either<Failure, Storage>> getStorage();
}
