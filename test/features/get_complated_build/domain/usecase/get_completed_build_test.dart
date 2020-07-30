import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rakit_komputer/core/error/firestore/failures.dart';
import 'package:rakit_komputer/features/get_build_list/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_build_list/domain/repository/build_repository.dart';
import 'package:rakit_komputer/features/get_build_list/domain/usecase/get_completed_build.dart';

class MockBuildRepository extends Mock implements BuildRepoAbst{}


void main(){
  MockBuildRepository mockBuildRepository;
  BuildUsecase buildUsecase;
  final BuildEntity tPcBuild = BuildEntity(buildId: "123", title: "BUILD 1", overallPrice: "2000", picURL: "facebook.com", owner: "febri");
  final List<BuildEntity> tListBuild = [tPcBuild,tPcBuild,tPcBuild,tPcBuild];
  setUp((){
    mockBuildRepository = MockBuildRepository();
    buildUsecase = BuildUsecase(buildRepository: mockBuildRepository);
  });

  test(
      "should get List Of Recommended Build Entity if succeed",
      () async {
        //arrange
        when(mockBuildRepository.getRecommendedBuild()).thenAnswer((realInvocation) async => Right(tListBuild));
        //act
        final result = await buildUsecase.getRecommendedBuild();
        //assert
        expect(result, Right(tListBuild));
      },
    );

  test(
      "should return Failure if Data source failed ",
      () async {
        //arrange
        when(mockBuildRepository.getRecommendedBuild()).thenAnswer((realInvocation) async => Left(SomeFailure()));
        //act
        final result = await buildUsecase.getRecommendedBuild();
        //assert
        expect(result, Left(SomeFailure()));
      },
    );

  test(
    "should get List Of completed build Entity if succeed",
        () async {
      //arrange
      when(mockBuildRepository.getRecommendedBuild()).thenAnswer((realInvocation) async => Right(tListBuild));
      //act
      final result = await buildUsecase.getRecommendedBuild();
      //assert
      expect(result, Right(tListBuild));
    },
  );

  test(
    "should return Failure if get completed build is failed",
        () async {
      //arrange
      when(mockBuildRepository.getCompletedBuild()).thenAnswer((realInvocation) async => Left(SomeFailure()));
      //act
      final result = await buildUsecase.getCompletedBuild();
      //assert
      expect(result, Left(SomeFailure()));
    },
  );

  test(
      "should get Featured BuildId",
      () async {
        //arrange
        when(mockBuildRepository.getFeaturedBuild()).thenAnswer((realInvocation) async => Right(tPcBuild));
        //act
        final result = await buildUsecase.getFeaturedBuild();
        //assert
        expect(result, Right(tPcBuild));
      },
    );

}