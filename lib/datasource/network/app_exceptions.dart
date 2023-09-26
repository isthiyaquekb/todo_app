class AppExceptions implements Exception {
  final String? message;
  final String? prefix;
  final int? errorCode;

  AppExceptions([this.message, this.prefix, this.errorCode]);
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message,int? errorCode]) : super(message, 'Bad Request', errorCode);
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message, int? errorCode]) : super(message, 'Unable to process', errorCode);
}

class ApiNotRespondingException extends AppExceptions {
  ApiNotRespondingException([String? message, int? errorCode]) : super(message, 'Api not responded in time', errorCode);
}

class UnAuthorizedException extends AppExceptions {
  UnAuthorizedException([String? message, int? errorCode]) : super(message, 'UnAuthorized request', errorCode);
}

class OlderAppVersionException extends AppExceptions {
  OlderAppVersionException([message,int? errorCode]) : super(message, "Older App Version",errorCode);
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([message,int? errorCode]) : super(message, "Invalid Input. ",errorCode);
}

class NotFoundException extends AppExceptions {
  NotFoundException([message,int? errorCode]) : super(message, "Not Found. ",errorCode);
}

class InternalServerException extends AppExceptions {
  InternalServerException([message,int? errorCode])
      : super(message, "Internal Server Error. ",errorCode);
}