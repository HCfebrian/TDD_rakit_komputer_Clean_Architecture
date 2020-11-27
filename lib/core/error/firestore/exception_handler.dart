
import 'package:rakit_komputer/core/error/firestore/exception.dart';

class FirestoreException {
  static Exception handle(e) {
    switch (e.code) {
      case "ABORTED":
        print(" handled ABORTED");
        return AbortedException();
        break;
      case "ALREADY_EXISTS":
        print(" handled ALREADY_EXISTS");
        return AlreadyExistException();
        break;
      case "CANCELLED":
        print(" handled CANCELLED");
        return CancelledException();
        break;
      case "DATA_LOSS":
        print(" handled DATA_LOSS");
        return DataLossException();
        break;
      case "DEADLINE_EXCEEDED":
        print(" handled DEADLINE_EXCEEDED");
        return DeadlineExceededException();
        break;
      case "FAILED_PRECONDITION":
        print(" handled FAILED_PRECONDITION");
        return FailedPreconditionException();
        break;
      case "INTERNAL":
        print(" handled INTERNAL");
        return InternalException();
        break;
      case "INVALID_ARGUMENT":
        print(" handled INVALID_ARGUMENT");
        return InvalidArgumentException();
        break;
      case "NOT_FOUND":
        print(" handled NOT_FOUND");
        return NotFoundException();
        break;
      case "OUT_OF_RANGE":
        print(" handled OUT_OF_RANGE");
        return OutOfRangeException();
        break;
      case "PERMISSION_DENIED":
        print(" handled PERMISSION_DENIED");
        return PermissionDeniedException();
        break;
      case "RESOURCE_EXHAUSTED":
        print(" handled RESOURCE_EXHAUSTED");
        return ResourceExhaustedException();
        break;
      case "UNAUTHENTICATED":
        print(" handled UNAUTHENTICATED");
        return UnauthenticatedException();
        break;
      case "UNAVAILABLE":
        print(" handled UNAVAILABLE");
        return UnavailableException();
        break;
      case "UNIMPLEMENTED":
        print(" handled UNIMPLEMENTED");
        return UnimplementedException();
        break;
      case "REMOTE_DATA_SOURCE_EXCEPTION":
        print(" handled REMOTE_DATA_SOURCE_EXCEPTION");
        return RemoteDataSourceException();
        break;
      case "UNKNOWN":
        print(" handled UNKNOWN");
        return UndefinedException();
        break;
      default:
        print(e);
        print(" handled UNDEFINE_EXCEPTION");
        return UndefinedException();
    }
  }
}
