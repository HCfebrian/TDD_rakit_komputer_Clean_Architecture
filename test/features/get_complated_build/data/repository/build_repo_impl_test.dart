import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';
import 'package:rakit_komputer/core/error/auth/exception.dart';
import 'package:rakit_komputer/core/error/auth/failures.dart';
import 'package:rakit_komputer/features/get_build/data/data_source/build_remote_data_source_abstract.dart';
import 'package:rakit_komputer/features/get_build/data/model/computer_build_model.dart';
import 'package:rakit_komputer/features/get_build/data/repository/build_repo_impl.dart';

class MockBuildRemoteDataSource extends Mock implements BuildRemoteDataSourceAbstc{}

main(){
  MockBuildRemoteDataSource mockBuildRemoteDataSource;
  BuildRepoImpl buildRepoImpl;
  final BuildModel tBuild = BuildModel(buildId: "1234", title: "test build", overallPrice: "2000", picURL: "facebook.com", owner: "mamat");
  final List<BuildModel>tBuildList = [tBuild,tBuild,tBuild];

  setUp((){
    mockBuildRemoteDataSource = MockBuildRemoteDataSource();
    buildRepoImpl = BuildRepoImpl(remoteDataSource: mockBuildRemoteDataSource);
  });

  test(
      "should return listBuildEntity when succeed",
      () async {
        //arrange
        when(mockBuildRemoteDataSource.getRecommendedBuildList()).thenAnswer((realInvocation) async => tBuildList);
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
        when(mockBuildRemoteDataSource.getRecommendedBuildList()).thenThrow(SomeException());
        //act
        final result = await buildRepoImpl.getRecommendedBuild();
        //assert
        expect(result, Left(UndefinedFailure()));
      },
    );

  test(
    "should return list Completed Build Entity when succeed",
        () async {
      //arrange
      when(mockBuildRemoteDataSource.getCompletedBuildList()).thenAnswer((realInvocation) async => tBuildList);
      //act
      final result =  await buildRepoImpl.getCompletedBuild();
      //assert
      expect(result, equals(Right(tBuildList)));
    },
  );

  //TODO: change exception to something  concrete
  test(
    "should return failure when some exception happened on data source",
        () async {
      //arrange
      when(mockBuildRemoteDataSource.getCompletedBuildList()).thenThrow(SomeException());
      //act
      final result = await buildRepoImpl.getCompletedBuild();
      //assert
      expect(result, Left(UndefinedFailure()));
    },
  );
  
  test(
      "should should get fetured Build",
      () async {
        //arrange
        when(mockBuildRemoteDataSource.getFeaturedBuild()).thenAnswer((realInvocation) async => tBuild);
        //act
        final result = await buildRepoImpl.getFeaturedBuild();
        //assert
        expect(result, Right(tBuild));
      },
    );

  //TODO: change exception to something  concrete
  test(
    "should return failure when some exception happened on data source",
        () async {
      //arrange
      when(mockBuildRemoteDataSource.getFeaturedBuild()).thenThrow(SomeException());
      //act
      final result = await buildRepoImpl.getFeaturedBuild();
      //assert
      expect(result, Left(UndefinedFailure()));
    },
  );


}