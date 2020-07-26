import 'package:matcher/matcher.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rakit_komputer/core/error/auth/exception.dart';
import 'package:rakit_komputer/core/error/auth/failures.dart';
import 'package:rakit_komputer/features/get_build_list/data/data_source/build_remote_data_source_impl.dart';
import 'package:rakit_komputer/features/get_build_list/data/model/computer_build_model.dart';
import 'package:rakit_komputer/features/get_build_list/data/repository/build_repo_impl.dart';
import 'package:rakit_komputer/features/get_build_list/data/repository/build_repo_impl.dart';

class MockBuildRemoteDataSourceImpl extends Mock implements BuildRemoteDataSourceImpl{}

main(){
  MockBuildRemoteDataSourceImpl mockBuildRemoteDataSourceImpl;
  BuildRepoImpl buildRepoImpl;
  final BuildModel tBuild = BuildModel(buildId: "1234", title: "test build", overallPrice: "2000", picURL: "facebook.com");
  final List<BuildModel>tBuildList = [tBuild,tBuild,tBuild];

  setUp((){
    mockBuildRemoteDataSourceImpl = MockBuildRemoteDataSourceImpl();
    buildRepoImpl = BuildRepoImpl(remoteDataSource: mockBuildRemoteDataSourceImpl);
  });

  test(
      "should return listBuildEntity when succeed",
      () async {
        //arrange
        when(mockBuildRemoteDataSourceImpl.getRecommendedBuildList()).thenAnswer((realInvocation) async => tBuildList);
        //act
        final result =  await buildRepoImpl.getRecommendedBuild();
        //assert
        expect(result, equals(Right(tBuildList)));
      },
    );


  //TODO: change exception to something  concrete
  test(
      "should return failure when some exception happened on data source",
      () async {
        //arrange
        when(mockBuildRemoteDataSourceImpl.getRecommendedBuildList()).thenThrow(SomeException());
        //act
        final result = await buildRepoImpl.getRecommendedBuild();
        //assert
        expect(result, Left(UndefinedFailure()));
      },
    );


}