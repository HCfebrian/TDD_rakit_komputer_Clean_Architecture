import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rakit_komputer/core/error/firestore/failures.dart';
import 'package:rakit_komputer/core/values/constant.dart';
import 'package:rakit_komputer/features/get_build_list/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_build_list/presentation/bloc/completed_build/completed_build_bloc.dart';

import 'recommended_build_bloc_test.dart';

void main(){

  MockBuildUsecase usecase;
  CompletedBuildBloc bloc;

  final BuildEntity tBuildEntity = BuildEntity(
      buildId: "abc",
      title: "Pc Dewa",
      overallPrice: "20000000",
      picURL: "facebook.com", owner: "bahlul");
  final List<BuildEntity> tBuildList = [tBuildEntity, tBuildEntity];

  setUp(() {
    usecase = MockBuildUsecase();
    bloc = CompletedBuildBloc(buildUsecase: usecase);
  });
  group("completed build list", () {
    test(
      "should emmit [Loading, Loaded] when getRecommendedList is succeed",
          () async {
        //arrange
        when(usecase.getCompletedBuild())
            .thenAnswer((realInvocation) async => Right(tBuildList));
        //assert later
        final expected = [
          CompletedBuildEmpty(),
          CompletedBuildLoading(),
          CompletedBuildLoaded(completedBuild: tBuildList),
        ];
        expectLater(bloc, emitsInOrder(expected));
        //act
        bloc.add(GetCompletedBuildList());
      },
    );

    test(
      "should emil [Loading, Error] when getRecommendedList is failed",
          () async {
        //arrange
        when(usecase.getCompletedBuild())
            .thenAnswer((realInvocation) async => Left(SomeFailure()));
        //assert later
        final expected = [
          CompletedBuildEmpty(),
          CompletedBuildLoading(),
          CompletedBuildError(message: SOME_FAILURE_MESSAGE),
        ];
        expectLater(bloc, emitsInOrder(expected));
        //act
        bloc.add(GetCompletedBuildList());
      },
    );
  });

}