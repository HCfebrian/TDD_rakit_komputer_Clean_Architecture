import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rakit_komputer/core/error/firestore/failures.dart';
import 'package:rakit_komputer/core/values/constant.dart';
import 'package:rakit_komputer/features/get_build/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_build/domain/usecase/get_completed_build.dart';
import 'package:rakit_komputer/features/get_build/presentation/bloc/recommended_build/recommended_build_bloc.dart';

class MockBuildUsecase extends Mock implements BuildUsecase {}

void main() {
  MockBuildUsecase usecase;
  RecommendedBuildBloc bloc;

  final BuildEntity tBuildEntity = BuildEntity(
      buildId: "abc",
      title: "Pc Dewa",
      overallPrice: "20000000",
      picURL: "facebook.com", owner: "bahlul");
  final List<BuildEntity> tBuildList = [tBuildEntity, tBuildEntity];

  setUp(() {
    usecase = MockBuildUsecase();
    bloc = RecommendedBuildBloc(buildUsecase: usecase);
  });

  group("recommended build list", () {
    test(
      "should emmit [Loading, Loaded] when getRecommendedList is succeed",
      () async {
        //arrange
        when(usecase.getRecommendedBuild())
            .thenAnswer((realInvocation) async => Right(tBuildList));
        //assert later
        final expected = [
          RecommendedEmpty(),
          RecommendedLoading(),
          RecommendedLoaded(recommendedBuild: tBuildList),
        ];
        expectLater(bloc, emitsInOrder(expected));
        //act
        bloc.add(GetRecommendedList());
        await untilCalled(usecase.getRecommendedBuild());
      },
    );

    test(
      "should emil [Loading, Error] when getRecommendedList is failed",
      () async {
        //arrange
        when(usecase.getRecommendedBuild())
            .thenAnswer((realInvocation) async => Left(SomeFailure()));
        //assert later
        final expected = [
          RecommendedEmpty(),
          RecommendedLoading(),
          RecommendedError(message: SOME_FAILURE_MESSAGE),
        ];
        expectLater(bloc, emitsInOrder(expected));
        //act
        bloc.add(GetRecommendedList());
      },
    );
  });



}
