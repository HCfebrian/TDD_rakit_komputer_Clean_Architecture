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
  Future<Either<Failure, Case>> getCase(String partID);

  Future<Either<Failure, CPUEntity>> getCPU(String partID);

  Future<Either<Failure, CPUCooler>> getCPUCooler(String partID);

  Future<Either<Failure, GraphicCardEntity>> getGraphicCard(String partID);

  Future<Either<Failure, MemoryEntity>> getMemory(String partID);

  Future<Either<Failure, Motherboard>> getMotherboard(String partID);

  Future<Either<Failure, PSU>> getPSU(String partID);

  Future<Either<Failure, Storage>> getStorage(String partID);
}
