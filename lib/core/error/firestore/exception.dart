class AbortedException implements Exception{
    String code = "ABORTED";
}

class AlreadyExistException implements Exception{
    String code = "ALREADY_EXISTS";

}

class CancelledException implements Exception{
    String code = "CANCELLED";
}

class DataLossException implements Exception{
    String code = "DATA_LOSS";
}

class DeadlineExceededException implements Exception{
    String code = "DEADLINE_EXCEEDED";
}


class FailedPreconditionException implements Exception{
    String code = "FAILED_PRECONDITION";

}

class InternalException implements Exception{
    String code = "INTERNAL";
}

class InvalidArgumentException implements Exception{
    String code = "INVALID_ARGUMENT";

}

class NotFoundException implements Exception{
    String code = "NOT_FOUND";

}

class OutOfRangeException implements Exception{
    String code = "OUT_OF_RANGE";

}

class PermissionDeniedException implements Exception{
    String code = "PERMISSION_DENIED";

}

class ResourceExhaustedException implements Exception{
    String code = "RESOURCE_EXHAUSTED";
}

class UnauthenticatedException implements Exception{
    String code = "UNAUTHENTICATED";
}

class UnavailableException implements Exception{
    String code = "UNAVAILABLE";
}

class UnimplementedException implements Exception{
    String code = "UNIMPLEMENTED";
}

class UndefinedException implements Exception{
    String code = "UNKNOWN";
}


// IDEALLY FOR TEST ONLY
class RemoteDataSourceException implements Exception {
    String code = "REMOTE_DATA_SOURCE_EXCEPTION";
}

class SomeException implements Exception{
}

