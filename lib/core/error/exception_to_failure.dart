import 'package:rakit_komputer/core/error/exception.dart';
import 'package:rakit_komputer/core/error/failures.dart';

class GetFailureFrom{
    static Failure call(Exception e){
      switch (e.runtimeType){
        case EmailAlreadyExistException:
          return EmailAlreadyExistFailure();
          break;

      }
    }
}