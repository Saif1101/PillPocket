abstract class AuthException implements Exception {
  String message;

  AuthException(this.message);
}

class InvalidPasswordException extends AuthException {
  InvalidPasswordException(String message) : super(message);
}

class InvalidOtpException extends AuthException {
  InvalidOtpException(String message) : super(message);
}

class InvalidEmailException extends AuthException {
  InvalidEmailException(String message) : super(message);
}
