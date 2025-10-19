import 'package:flutter/cupertino.dart';
import 'package:zillow_mini/src/core/data/app_error.dart';
import 'package:zillow_mini/src/core/presenter/extensions/context_extensions.dart';


enum ResourceContext {
  auth,
  property,
}

extension ErrorMessage on AppError {

  String getMessage(BuildContext context, {ResourceContext resourceContext = ResourceContext.property}) {
    return switch (this) {
      TimeoutError() => context.l10n.errorTimeout,
      ConnectionError() => context.l10n.errorConnection,
      UnauthorizedError() => context.l10n.errorAuthorization,
      RequestError() => context.l10n.errorRequest,
      NotFoundError() => switch(resourceContext){
        ResourceContext.auth => context.l10n.errorCredentials,
        ResourceContext.property => context.l10n.errorFilters,
      },
      ServerError() => context.l10n.errorServer,
      UnknownError() => context.l10n.errorUnknown,
    };
  }
}