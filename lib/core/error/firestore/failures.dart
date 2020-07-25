import '../failure.dart';

class AbortedFailure extends Failure {
  final String message = "ABORTED";

  @override
  List<Object> get props => [message];
}

class AlreadyExistFailure extends Failure {
  final String message = "ALREADY_EXISTS";

  @override
  List<Object> get props => [message];
}

class CancelledFailure extends Failure {
  final String message = "CANCELLED";

  @override
  List<Object> get props => [message];
}

class DataLossFailure extends Failure {
  final String message = "DATA_LOSS";

  @override
  List<Object> get props => [message];
}

class DeadlineExceededFailure extends Failure {
  final String message = "DEADLINE_EXCEEDED";

  @override
  List<Object> get props => [message];
}

class FailedPreconditionFailure extends Failure {
  final String message = "FAILED_PRECONDITION";

  @override
  List<Object> get props => [message];
}

class InternalFailure extends Failure {
  final String message = "INTERNAL";

  @override
  List<Object> get props => [message];
}

class InvalidArgumentFailure extends Failure {
  final String message = "INVALID_ARGUMENT";

  @override
  List<Object> get props => [message];
}

class NotFoundFailure extends Failure {
  final String message = "NOT_FOUND";

  @override
  List<Object> get props => [message];
}

class OutOfRangeFailure extends Failure {
  final String message = "OUT_OF_RANGE";

  @override
  List<Object> get props => [message];
}

class PermissionDeniedFailure extends Failure {
  final String message = "PERMISSION_DENIED";

  @override
  List<Object> get props => [message];
}

class ResourceExhaustedFailure extends Failure {
  final String message = "RESOURCE_EXHAUSTED";

  @override
  List<Object> get props => [message];
}

class UnauthenticatedFailure extends Failure {
  final String message = "UNAUTHENTICATED";

  @override
  List<Object> get props => [message];
}

class UnavailableFailure extends Failure {
  final String message = "UNAVAILABLE";

  @override
  List<Object> get props => [message];
}

class UnimplementedFailure extends Failure {
  final String message = "UNIMPLEMENTED";

  @override
  List<Object> get props => [message];
}

class UndefinedFailure extends Failure {
  final String message = "UNKNOWN";

  @override
  List<Object> get props => [message];
}

// IDEALLY FOR TEST ONLY
class RemoteDataSourceFailure extends Failure {
  final String message = "REMOTE_DATA_SOURCE_Failure";

  @override
  List<Object> get props => [message];
}

class SomeFailure extends Failure {}
