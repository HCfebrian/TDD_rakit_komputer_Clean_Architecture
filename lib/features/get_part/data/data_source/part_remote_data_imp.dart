import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rakit_komputer/core/error/auth/exception_handler.dart';
import 'package:rakit_komputer/features/get_part/data/data_source/part_remote_data_abstc.dart';
import 'package:rakit_komputer/features/get_part/data/model/case.dart';
import 'package:rakit_komputer/features/get_part/data/model/cpu.dart';
import 'package:rakit_komputer/features/get_part/data/model/cpu_cooler.dart';
import 'package:rakit_komputer/features/get_part/data/model/graphic_card.dart';
import 'package:rakit_komputer/features/get_part/data/model/memory.dart';
import 'package:rakit_komputer/features/get_part/data/model/moterboard.dart';
import 'package:rakit_komputer/features/get_part/data/model/psu.dart';
import 'package:rakit_komputer/features/get_part/data/model/storage.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/case.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/cpu.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/cpu_cooler.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/graphic_card.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/memory.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/moterboard.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/psu.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/storage.dart';
import 'package:meta/meta.dart';

class PartRemoteDataSourceImpl extends PartRemoteDataSourceAbsct {
  final Firestore firestoreInstance;

  PartRemoteDataSourceImpl({@required this.firestoreInstance});

  @override
  Future<CPUEntity> getCPU(String partID) async {
    try {
      final refPart =
          firestoreInstance.collection("part_data/processor/processors");
      final ds = await refPart.document(partID).get();
      return CPUModel.from(ds);
    } catch (e) {
      print("error getCPUDataSource" + e);
      throw FirebaseException.handle(e);
    }
  }

  @override
  Future<CPUCooler> getCPUCooler(String partID) async {
    try {
      final refPart =
          firestoreInstance.collection("part_data/cpu_cooler/cpu_coolers");
      final ds = await refPart.document(partID).get();
      return CPUCoolerModel.from(ds);
    } catch (e) {
      print("error getCPUCoolerSource" + e);
      throw FirebaseException.handle(e);
    }
  }

  @override
  Future<Case> getCase(String partID) async {
    try {
      final refPart = firestoreInstance.collection("part_data/case/cases");
      final ds = await refPart.document(partID).get();
      return CaseModel.from(ds);
    } catch (e) {
      print("error getCaseSource" + e);
      throw FirebaseException.handle(e);
    }
  }

  @override
  Future<GraphicCardEntity> getGraphicCard(String partID) async {
    try {
      final refPart = firestoreInstance.collection("part_data/gpu/gpus");
      final ds = await refPart.document(partID).get();
      return GraphicCardModel.from(ds);
    } catch (e) {
      print("error getGraphicCardSource" + e);
      throw FirebaseException.handle(e);
    }
  }

  @override
  Future<MemoryEntity> getMemory(String partID) async {
    try {
      final refPart = firestoreInstance.collection("part_data/memory/memories");
      final ds = await refPart.document(partID).get();
      return MemoryModel.from(ds);
    } catch (e) {
      print("error getMemorySource " + e);
      throw FirebaseException.handle(e);
    }
  }

  @override
  Future<Motherboard> getMotherboard(String partID) async {
    try {
      final refPart =
          firestoreInstance.collection("part_data/motherboard/motherboards");
      final ds = await refPart.document(partID).get();
      return MotherboardModel.from(ds);
    } catch (e) {
      print("error getMotherboardSource " + e);
      throw FirebaseException.handle(e);
    }
  }

  @override
  Future<PSU> getPSU(String partID) async {
    try {
      final refPart = firestoreInstance.collection("part_data/psu/psus");
      final ds = await refPart.document(partID).get();
      return PSUModel.from(ds);
    } catch (e) {
      print("error getPSUDataSource " + e);
      throw FirebaseException.handle(e);
    }
  }

  @override
  Future<Storage> getStorage(String partID) async {
    try {
      final refPart = firestoreInstance.collection("part_data/storage/storage");
      final ds = await refPart.document(partID).get();
      return StorageModel.from(ds);
    } catch (e) {
      print("error getStorageDataSource " + e);
      throw FirebaseException.handle(e);
    }
  }
}
