import 'package:rakit_komputer/core/error/failure.dart';
import 'package:rakit_komputer/core/error/firestore/exception.dart';
import 'failures.dart';

class ExceptionToFailure {
  static Failure handle(e) {
    switch (e.runtimeType) {
      case AbortedException:
        print(" handled ABORTED");
        return AbortedFailure();
        break;

      case AlreadyExistException:
        print("failure handler  ALREADY_EXISTS");
        return AlreadyExistFailure();
        break;

      case CancelledException:
        print(" handled CANCELLED");
        return CancelledFailure();
        break;

      case DataLossException:
        print(" handled DATA_LOSS");
        return DataLossFailure();
        break;

      case DeadlineExceededException:
        print(" handled DEADLINE_EXCEEDED");
        return DeadlineExceededFailure();
        break;

      case FailedPreconditionException:
        print(" handled FAILED_PRECONDITION");
        return FailedPreconditionFailure();
        break;

      case InternalException:
        print(" handled INTERNAL");
        return InternalFailure();
        break;

      case InvalidArgumentException:
        print(" handled INVALID_ARGUMENT");
        return InvalidArgumentFailure();
        break;

      case NotFoundException:
        print(" handled NOT_FOUND");
        return NotFoundFailure();
        break;

      case OutOfRangeException:
        print(" handled OUT_OF_RANGE");
        return OutOfRangeFailure();
        break;

      case PermissionDeniedException:
        print(" handled PERMISSION_DENIED");
        return PermissionDeniedFailure();
        break;

      case ResourceExhaustedException:
        print(" handled RESOURCE_EXHAUSTED");
        return ResourceExhaustedFailure();
        break;

      case UnauthenticatedException:
        print(" handled UNAUTHENTICATED");
        return UnauthenticatedFailure();
        break;

      case UnavailableException:
        print(" handled UNAVAILABLE");
        return UnavailableFailure();
        break;

      case UnimplementedException:
        print(" handled UNIMPLEMENTED");
        return UnimplementedFailure();
        break;

      case RemoteDataSourceException:
        print(" handled REMOTE_DATA_SOURCE_EXCEPTION");
        return RemoteDataSourceFailure();
        break;

      case UndefinedException:
        print(" handled UNDEFINE_EXCEPTION");
        return UndefinedFailure();
        break;

      default:
        print(" handled UNDEFINE_EXCEPTION");
        return UndefinedFailure();
    }
  }
}
