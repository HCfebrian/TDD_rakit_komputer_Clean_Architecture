import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rakit_komputer/features/get_completed_build/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_completed_build/domain/repository/build_repository.dart';
import 'package:rakit_komputer/features/get_completed_build/domain/usecase/get_completed_build.dart';

class MockBuildRepository extends Mock implements BuildRepoAbst{}


void main(){
  MockBuildRepository mockBuildRepository;
  BuildUsecase buildUsecase;
  final BuildEntity singleBuild = BuildEntity(buildId: "123", title: "BUILD 1", price: "2000", picURL: "facebook.com");
  final List<BuildEntity> tListBuild = [singleBuild,singleBuild,singleBuild,singleBuild];
  setUp((){
    mockBuildRepository = MockBuildRepository();
    buildUsecase = BuildUsecase(buildRepository: mockBuildRepository);
  });

  test(
      "should get List Of Build Entity if succeed",
      () async {
        //arrange
        when(mockBuildRepository.getRecommendedBuild()).thenAnswer((realInvocation) async => Right(tListBuild));
        //act
        final result = await buildUsecase.getRecommendedBuild();
        //assert
        expect(result, Right(tListBuild));
      },
    );

}