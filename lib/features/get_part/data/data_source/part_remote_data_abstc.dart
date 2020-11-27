import 'package:rakit_komputer/features/get_part/domain/entity/case.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/cpu.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/cpu_cooler.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/graphic_card.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/memory.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/moterboard.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/psu.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/storage.dart';

abstract class PartRemoteDataSourceAbsct{
  Future<CPUEntity> getCPU(String partID);
  Future<Case> getCase(String partID);
  Future<CPUCooler> getCPUCooler(String partID);
  Future<GraphicCardEntity> getGraphicCard(String partID);
  Future<MemoryEntity> getMemory(String partID);
  Future<Motherboard> getMotherboard(String partID);
  Future<PSU> getPSU(String partID);
  Future<Storage> getStorage(String partID);
}