sealed class AppError {
  const AppError(this.code, {this.message});
  final String? message;
  final int? code;
}

class TimeoutError extends AppError {
  const TimeoutError({super.message}) : super(null);

}

class ConnectionError extends AppError {
  const ConnectionError({super.message}) : super(0);
}

class RequestError extends AppError {
  const RequestError({super.message}) : super(400);
}

class NotFoundError extends AppError {
  const NotFoundError({super.message}) : super(404);
}

class ServerError extends AppError {
  const ServerError({super.message}) : super(500);
}

class UnknownError extends AppError {
  const UnknownError({super.message}) : super(null);
}
