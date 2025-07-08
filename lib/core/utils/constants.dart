class Constants {
  Constants._();

  static const String bearer = 'Bearer ';
  static const String token = 'token';
  static const String authorization = 'Authorization';

  // Validation Messages
  static const String emailCannotBeEmpty = 'Email cannot be empty';
  static const String enterValidEmail = 'Enter a valid email';
  static const String passwordCannotBeEmpty = 'Password cannot be empty';
  static const String invalidPassword =
      'Password must contain at least 8 characters, including uppercase, lowercase, number, and special character';
  static const String confirmPasswordMustMatch = 'Passwords do not match';
  static const String nameCannotBeEmpty = 'Name cannot be empty';
  static const String invalidName = 'Name contains invalid characters';

  // API Error Messages
  static const String noInternetConnection = 'No internet connection';
  static const String dataParsingError = 'Data parsing error';
  static const String unexpectedError = 'Unexpected error';
  static const String invalidCertificate = 'Invalid certificate';
  static const String unexpectedServerError = 'Unexpected server error';
  static const String requestCancelled = 'Request cancelled';
  static const String connectionFailed = 'Connection failed';

  static const String connectionTimeout = 'Connection timeout';
  static const String sendTimeout = 'Send timeout';
  static const String receiveTimeout = 'Receive timeout';
  static const String timeoutOccurred = 'A timeout occurred';

  // Firebase Specific
  static const String authenticationError = 'Authentication failed';
  static const String firebaseError = 'Firebase operation failed';
}
