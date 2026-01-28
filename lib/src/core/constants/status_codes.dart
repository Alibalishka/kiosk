/// All status codes from backend will represented here
abstract class StatusCodes {
  static const int unAuthenticated = 401;

  static const int notFound = 404;

  static const int serverError = 500;

  static const int unprocessable = 422;

  static const int updateRequired = 426;

  static const int badRequest = 400;

  StatusCodes._();
}
