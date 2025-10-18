import 'package:zillow_mini/src/core/data/app_error.dart';

extension ErrorMessage on AppError {

  String getMessage() {
    return switch (this) {
      TimeoutError() => 'Response is taking too long',
      ConnectionError() => 'Please check your internet connexion',
      UnauthorizedError() => 'You are not authorized to perform this action',
      RequestError() => 'Your request could not be processed',
      NotFoundError() => 'Invalid password or email',
      ServerError() => 'The server is not responding',
      UnknownError() => 'Something went wrong',
    };
  }
}