import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rakit_komputer/core/error/auth/failures.dart';
import 'package:rakit_komputer/core/presentation/util/email_validation.dart';

void main() {
  ValidateEmail validateEmail;

  setUp(() {
    validateEmail = ValidateEmail();
  });

  group("validate email", () {
    test(
      "should return email when valid email is given",
      () async {
        //arrange
        final tEmailAddress = "febriansyah.online@gmail.com";
        //act
        final result = validateEmail.validate(tEmailAddress);
            //assert
            expect(result, Right(tEmailAddress));
      },
    );

    test(
      "should return EmptyFailure when empty email is given",
      () async {
        //arrange
        final tEmptyEmail = "";
        //act
        final result = validateEmail.validate(tEmptyEmail);
        //assert
        expect(result, Left(EmptyEmailFailure("")));
      },
    );

    test(
      "should return InvalidInputFailure",
      () async {
        //arrange
        final tInvalidEmail = "HC Febrian";
        //act
        final result = validateEmail.validate(tInvalidEmail);
        //assert
        expect(result, Left(InvalidEmailFailure(email: tInvalidEmail)));
      },
    );
  });
}
