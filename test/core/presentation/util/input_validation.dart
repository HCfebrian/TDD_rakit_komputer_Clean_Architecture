import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rakit_komputer/core/error/failures.dart';
import 'package:rakit_komputer/core/presentation/util/email_validation.dart';


void main(){

  group("validate email", (){

    test(
        "should return email when ValidateEmail is called",
        () async {
          //arrange
          final tEmailAddress = "febriansyah.online@gmail.com";
          //act
          final result = ValidateEmail(tEmailAddress).value;
          //assert
          expect(result, Right(tEmailAddress));
        },
      );

    test(
        "should throw EmptyFailure when empty email is given",
        () async {
          //arrange
          final tEmptyEmail = null;
          //act
          final result = ValidateEmail(tEmptyEmail).value;
          //assert
          expect(result, Left(EmptyInputFailure()));
        },
      );

    test(
        "should throw InvalidInputFailure",
        () async {
          //arrange
          final tInvalidEmail = "HC Febrian";
          //act
          final result = ValidateEmail(tInvalidEmail).value;
          //assert
          expect(result, Left(InvalidInputFailure()));
        },
      );
  });
}