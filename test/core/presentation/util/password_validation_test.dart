import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rakit_komputer/core/error/auth/failures.dart';
import 'package:rakit_komputer/core/presentation/util/password_validation.dart';

void main() {
  ValidatePassword validatePassword;
  setUp(() {
    validatePassword = ValidatePassword();
  });

  String tValidPassword = "20021997";
  String tInvalidPasswordMin = "20022";
  String tInvalidPasswordMax = "20022002200220022";

  test(
    "should return password if Valid password is given",
    () async {
      //arrange
      //act
      final resultPWLogin = validatePassword.login(tValidPassword);
      final resultPWRegister = validatePassword.register(
          password: tValidPassword, repeatPassword: tValidPassword);
      //assert
      expect(resultPWLogin, Right(tValidPassword));
      expect(resultPWRegister, Right(tValidPassword));
    },
  );

  test(
      "should return Invalid PasswordFailure when invalid password is given",
      () async {
        //arrange
        //act
        final resultPWLoginMax = validatePassword.login(tInvalidPasswordMax);
        final resultPWLoginMin = validatePassword.login(tInvalidPasswordMin);
        final resultPWRegisterMin = validatePassword.register(
            password: tInvalidPasswordMin, repeatPassword: tInvalidPasswordMin);
        final resultPWRegisterMax = validatePassword.register(
            password: tInvalidPasswordMax, repeatPassword: tInvalidPasswordMax);
        //assert

        expect(resultPWLoginMin, Left(InvalidPasswordFailure()));
        expect(resultPWLoginMax, Left(InvalidPasswordFailure()));
        expect(resultPWRegisterMax, Left(InvalidPasswordFailure()));
        expect(resultPWRegisterMin, Left(InvalidPasswordFailure()));
      },
    );

  test(
    "should return failure [Password did not match] when miss match password is given",
        () async {
      //arrange
      //act
          final resultPWRegister = validatePassword.register(
              password: tInvalidPasswordMin, repeatPassword: tInvalidPasswordMax);
      //assert
          expect(resultPWRegister, Left(PasswordDidNotMatchFailure()));
        },
  );
}
