import 'package:rakit_komputer/core/values/constant.dart';

import '../failure.dart';

class AbortedFailure extends Failure {
  AbortedFailure() : super("ABORTED");
}

class AlreadyExistFailure extends Failure {
  AlreadyExistFailure() : super("ALREADY_EXISTS");
}

class CancelledFailure extends Failure {
  CancelledFailure() : super("CANCELLED");
}

class DataLossFailure extends Failure {
  DataLossFailure() : super("DATA_LOSS");
}

class DeadlineExceededFailure extends Failure {
  DeadlineExceededFailure() : super("DEADLINE_EXCEEDED");
}

class FailedPreconditionFailure extends Failure {
  FailedPreconditionFailure() : super("FAILED_PRECONDITION");
}

class InternalFailure extends Failure {
  InternalFailure() : super("INTERNAL");
}

class InvalidArgumentFailure extends Failure {
  InvalidArgumentFailure() : super("INVALID_ARGUMENT");
}

class NotFoundFailure extends Failure {
  NotFoundFailure() : super("NOT_FOUND");
}

class OutOfRangeFailure extends Failure {
  OutOfRangeFailure() : super("OUT_OF_RANGE");
}

class PermissionDeniedFailure extends Failure {
  PermissionDeniedFailure() : super("PERMISSION_DENIED");
}

class ResourceExhaustedFailure extends Failure {
  ResourceExhaustedFailure() : super("RESOURCE_EXHAUSTED");
}

class UnauthenticatedFailure extends Failure {
  UnauthenticatedFailure() : super("UNAUTHENTICATED");
}

class UnavailableFailure extends Failure {
  UnavailableFailure() : super("UNAVAILABLE");
}

class UnimplementedFailure extends Failure {
  UnimplementedFailure() : super("UNIMPLEMENTED");
}

class UndefinedFailure extends Failure {
  UndefinedFailure() : super("UNKNOWN");
}

// IDEALLY FOR TEST ONLY
class RemoteDataSourceFailure extends Failure {
  RemoteDataSourceFailure() : super("REMOTE_DATA_SOURCE_FAILURE");

  @override
  List<Object> get props => [message];
}

class SomeFailure extends Failure {
  SomeFailure() : super(SOME_FAILURE_MESSAGE);
}
