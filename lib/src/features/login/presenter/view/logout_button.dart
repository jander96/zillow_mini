import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zillow_mini/src/core/presenter/extensions/context_extensions.dart';
import 'package:zillow_mini/src/core/presenter/extensions/error_extensions.dart';
import 'package:zillow_mini/src/di.dart';
import 'package:zillow_mini/src/features/login/presenter/view_view_model/logout_view_model.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, this.buttonBuilder});

  final Widget Function(BuildContext context, Function()? onPressed, LogoutState state)? buttonBuilder;

  void _logout(BuildContext context) {
    context.read<LogoutViewModel>().add(LogoutButtonPressed());
  }

  @override
  Widget build(_) {
    return BlocProvider(
      create: (_) => LogoutViewModel(getIt.get()),
      child: Builder(
        builder: (context) {
          return BlocConsumer<LogoutViewModel, LogoutState>(
            listener: (context, state) {
              switch (state) {
                case LogoutInitial():
                  break;
                case LogoutLoading():
                  break;
                case LogoutSuccess():
                  context.showSnackbar('Success logout');
                  break;
                case LoginError():
                  context.showSnackbar(state.error.getMessage(context, resourceContext: ResourceContext.auth));
                  break;
              }
            },
            builder: (context, state) {
              return buttonBuilder?.call(context, () => _logout(context), state) ??
                  ElevatedButton(onPressed: () => _logout(context), child: Text('Logout'));
            },
          );
        },
      ),
    );
  }
}
