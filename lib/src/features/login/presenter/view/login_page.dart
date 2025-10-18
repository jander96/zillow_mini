import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zillow_mini/src/core/presenter/extensions/context_extensions.dart';
import 'package:zillow_mini/src/core/presenter/extensions/error_extensions.dart';
import 'package:zillow_mini/src/core/presenter/navigation/navigation.dart';
import 'package:zillow_mini/src/core/presenter/theme/color.dart';
import 'package:zillow_mini/src/core/presenter/validators/validatos.dart';
import 'package:zillow_mini/src/di.dart';
import 'package:zillow_mini/src/features/login/presenter/view_view_model/login_view_model.dart';

const gradientColors =  [AppColor.secondary, AppColor.primary, AppColor.primary];

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => LoginViewModel(getIt.get()), child: _LoginView());
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(children: [_TopGradientSection(), _LoginForm(), _SocialLoginButtons()]),
      ),
    );
  }
}

class _TopGradientSection extends StatelessWidget {
  const _TopGradientSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .3,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.3), shape: BoxShape.circle),
              child: Image.asset('assets/icons/ic_launcher.png'),
            ),
            const SizedBox(height: 10),
            Text(
              'ZILLOW MINI',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController = TextEditingController();
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final _passwordVisibilityValue = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginState>(
      listener: (context, state) {
        switch (state) {
          case LoginInitial():
            break;
          case LoginLoading():
            break;
          case LoginSuccess():
            context.go(AppRoute.home.path);
          case LoginError():
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).colorScheme.errorContainer.withValues(alpha: .6),
                content: Text(state.error.getMessage()),
              ),
            );
            break;
        }
      },
      child: Form(
        key: _formKey,
        child: Transform.translate(
          offset: const Offset(0, -50),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10, offset: const Offset(0, 5)),
              ],
            ),
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: const UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.shadow),
                    ),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                  ),
                  validator: (value) => AppValidators.email(value),
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder(
                  valueListenable: _passwordVisibilityValue,
                  builder: (_, isVisible, _) {
                    return TextFormField(
                      controller: _passwordController,
                      obscureText: !isVisible,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: const UnderlineInputBorder(),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).colorScheme.shadow),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            _passwordVisibilityValue.value = !isVisible;
                          },
                        ),
                      ),
                      validator: (value) => AppValidators.password(value),
                    );
                  },
                ),
                const SizedBox(height: 30),
                _LoginButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      context.read<LoginViewModel>().add(
                        LoginButtonPressed(_emailController.text, _passwordController.text),
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _LoginTextButton(text: 'SIGN UP'),
                    _LoginTextButton(text: 'FORGOT?'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const _LoginButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: gradientColors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: BlocBuilder<LoginViewModel, LoginState>(
        builder: (context, state) {
          return ElevatedButton(
            onPressed: state is LoginLoading ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
            child: Builder(
              builder: (context) {
                if (state is LoginLoading) {
                  return SizedBox.square(
                    dimension: 26,
                    child: CircularProgressIndicator(color: Theme.of(context).colorScheme.onPrimary),
                  );
                }
                return  Text(
                  'LOGIN',
                  style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 18, fontWeight: FontWeight.bold),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _LoginTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const _LoginTextButton({required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _SocialLoginButtons extends StatelessWidget {
  const _SocialLoginButtons();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _SocialButton(icon: Icons.facebook, color: Color(0xFF3b5998)),
          SizedBox(width: 20),
          _SocialButton(icon: Icons.search, color: Color(0xFF00acee)),
          SizedBox(width: 20),
          _SocialButton(icon: Icons.g_mobiledata, color: Color(0xFFdb4a39)),
        ],
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _SocialButton({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: color.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 28),
        onPressed: () {
          context.showDeveloperContact();
        },
      ),
    );
  }
}
