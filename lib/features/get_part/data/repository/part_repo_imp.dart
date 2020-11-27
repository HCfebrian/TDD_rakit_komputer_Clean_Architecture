import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/core/error/auth/failure_handler.dart';
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

class PartRepoImp implements PartRepoAbst {
  final PartRemoteDataSourceAbsct partRemoteData;

  PartRepoImp({@required this.partRemoteData});

  @override
  Future<Either<Failure, CPUEntity>> getCPU(String partID) async {
    try {
      return Right(await partRemoteData.getCPU(partID));
    } catch (e) {
      return Left(ExceptionToFailure.handle(e));
    }
  }

  @override
  Future<Either<Failure, CPUCooler>> getCPUCooler(String partID) async {
    try {
      return Right(await partRemoteData.getCPUCooler(partID));
    } catch (e) {
      return Left(ExceptionToFailure.handle(e));
    }
  }

  @override
  Future<Either<Failure, Case>> getCase(String partID) async {
    try {
      return Right(await partRemoteData.getCase(partID));
    } catch (e) {
      return Left(ExceptionToFailure.handle(e));
    }
  }

  @override
  Future<Either<Failure, GraphicCardEntity>> getGraphicCard(String partID) async {
    try {
      return Right(await partRemoteData.getGraphicCard(partID));
    } catch (e) {
      return Left(ExceptionToFailure.handle(e));
    }
  }

  @override
  Future<Either<Failure, MemoryEntity>> getMemory(String partID) async {
    try {
      return Right(await partRemoteData.getMemory(partID));
    } catch (e) {
      return Left(ExceptionToFailure.handle(e));
    }
  }

  @override
  Future<Either<Failure, Motherboard>> getMotherboard(String partID) async {
    try {
      return Right(await partRemoteData.getMotherboard(partID));
    } catch (e) {
      return Left(ExceptionToFailure.handle(e));
    }
  }

  @override
  Future<Either<Failure, PSU>> getPSU(String partID) async {
    try {
      return Right(await partRemoteData.getPSU(partID));
    } catch (e) {
      return Left(ExceptionToFailure.handle(e));
    }
  }

  @override
  Future<Either<Failure, Storage>> getStorage(String partID) async {
    try {
      return Right(await partRemoteData.getStorage(partID));
    } catch (e) {
      return Left(ExceptionToFailure.handle(e));
    }
  }
}
