import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rakit_komputer/core/error/auth/failures.dart';
import 'package:rakit_komputer/core/presentation/util/username_validation.dart';

void main() {
  final ValidateUsername validateUsername = ValidateUsername();

  final tValidUsername = "HeryanCF";
  final tInvalidUsername = "HCF";

  test(
    "should return username when correct username is given",
    () async {
      //arrange
      //act
      final result = validateUsername.validate(tValidUsername);
      //assert
      expect(result, Right(tValidUsername));
    },
  );

  test(
    "should return failure [InvalidUsername] when invalid username is given",
    () async {
      //arrange
      //act
      final result = validateUsername.validate(tInvalidUsername);
      //assert
      expect(result, Left(InvalidUsernameFailure()));
    },
  );


}
