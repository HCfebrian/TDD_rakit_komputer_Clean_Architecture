import 'package:dartz/dartz.dart';
import 'package:rakit_komputer/core/error/failure.dart';
import 'package:rakit_komputer/features/get_part/data/data_source/part_remote_data_abstc.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/case.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/cpu.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/cpu_cooler.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/graphic_card.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/memory.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/moterboard.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/psu.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/storage.dart';
import 'package:rakit_komputer/features/get_part/domain/repository/part_repository.dart';
import 'package:meta/meta.dart';

class PartRepoImp implements PartRepoAbst{
  final PartRemoteDataSourceAbsct partRemoteData;

  PartRepoImp({@required this.partRemoteData});

  @override
  Future<Either<Failure, CPU>> getCPU(String partID) {
    // TODO: implement getCPU
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CPUCooler>> getCPUCooler(String partID) {
    // TODO: implement getCPUCooler
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Case>> getCase(String partID) {
    // TODO: implement getCase
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, GraphicCard>> getGraphicCard(String partID) {
    // TODO: implement getGraphicCard
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Memory>> getMemory(String partID) {
    // TODO: implement getMemory
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Motherboard>> getMotherboard(String partID) {
    // TODO: implement getMotherboard
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, PSU>> getPSU(String partID) {
    // TODO: implement getPSU
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Storage>> getStorage(String partID) {
    // TODO: implement getStorage
    throw UnimplementedError();
  }
}