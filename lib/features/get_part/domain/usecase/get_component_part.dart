import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:rakit_komputer/core/error/failure.dart';
import 'package:rakit_komputer/core/error/firestore/failures.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/case.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/cpu.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/cpu_cooler.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/graphic_card.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/memory.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/moterboard.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/psu.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/storage.dart';
import 'package:rakit_komputer/features/get_part/domain/repository/part_repository.dart';

class PartUsecase{
  final PartRepoAbst partRepoAbst;

  PartUsecase({@required this.partRepoAbst});


  Future<Either<Failure, dynamic>> getComponentDetail(String partID, String component)   async {
    switch (component){
      case  "GraphicCard":
        return  getGraphicCard(partID);
        break;
      case "Memory":
        return getMemory(partID);
        break;
      case "Processor":
        return getCPU(partID);
        break;
      default :
        return Left(SomeFailure());
    }
  }


  Future<Either<Failure, Case>> getCase(String partID) async{

    return await partRepoAbst.getCase(partID);
  }

  Future<Either<Failure, CPUEntity>> getCPU(String partID) async{

    return await partRepoAbst.getCPU(partID);
  }

  Future<Either<Failure, CPUCooler>> getCPUCooler(String partID) async{

    return await partRepoAbst.getCPUCooler(partID);
  }

  Future<Either<Failure, GraphicCardEntity>> getGraphicCard(String partID) async{

    return await partRepoAbst.getGraphicCard(partID);
  }

  Future<Either<Failure, MemoryEntity>> getMemory(String partID) async{

    return await partRepoAbst.getMemory(partID);
  }

  Future<Either<Failure, Motherboard>> getMotherboard(String partID) async{

    return await partRepoAbst.getMotherboard(partID);
  }

  Future<Either<Failure, PSU>> getPSU(String partID) async{

    return await partRepoAbst.getPSU(partID);
  }

  Future<Either<Failure, Storage>> getStorage(String partID) async{

    return await partRepoAbst.getStorage(partID);
  }


}