import 'package:crypto_currency/core/extensions/build_context_extension.dart';
import 'package:crypto_currency/core/l10n/s.dart';
import 'package:crypto_currency/core/router/router.dart';
import 'package:crypto_currency/core/widgets/filled_button.dart';
import 'package:crypto_currency/core/widgets/form_field.dart';
import 'package:crypto_currency/core/widgets/outlined_button.dart';
import 'package:crypto_currency/features/auth/presentation/pages/registration_page.dart';
import 'package:crypto_currency/features/auth/presentation/providers/auth_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends StatefulWidget {
  static String get routeName => 'login';
  static String get routeLocation => '/login';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailInputController;
  late TextEditingController _passwordInputController;
  bool _isPasswordVisible = false;
  bool _allFieldsNotEmpty = false;

  @override
  void initState() {
    super.initState();
    _emailInputController = TextEditingController();
    _passwordInputController = TextEditingController();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void checkAllFieldsNotEmpty() {
    if (_allFieldsNotEmpty !=
        (_emailInputController.text.isNotEmpty &&
            _passwordInputController.text.isNotEmpty)) {
      setState(() {
        _allFieldsNotEmpty = !_allFieldsNotEmpty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: context.colors.background,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 40),
                Text(
                  S.of(context).signIn,
                  style: context.textStyles.h2.copyWith(
                    color: context.colors.mainText,
                  ),
                ),
                const SizedBox(height: 40),
                FieldOfForm(
                  textInputType: TextInputType.emailAddress,
                  onChanged: (_) => checkAllFieldsNotEmpty(),
                  inputController: _emailInputController,
                  height: 64,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  placeholderText: S.of(context).emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                const SizedBox(height: 10),
                FieldOfForm(
                  onChanged: (_) => checkAllFieldsNotEmpty(),
                  inputController: _passwordInputController,
                  height: 64,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  placeholderText: S.of(context).password,
                  prefixIcon: const Icon(Icons.security_outlined),
                  suffixIcon: GestureDetector(
                    child: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: context.colors.suffixInput,
                    ),
                    onTap: _togglePasswordVisibility,
                  ),
                  isPassword: _isPasswordVisible,
                ),

                const SizedBox(height: 28),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Consumer(
                      builder: (context, ref, child) {
                        final authController =
                            ref.read(authControllerProvider.notifier);
                        return CustomFilledButton(
                          onPressed: () => authController.signIn(
                            email: _emailInputController.text,
                            password: _passwordInputController.text,
                          ),
                          text: S.of(context).login,
                          isActive: _allFieldsNotEmpty,
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      S.of(context).forgotPassword,
                      style: context.textStyles.bold
                          .copyWith(color: context.colors.dark70),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                // Expanded(
                //   flex: 2,
                //   child: Column(children: [
                //     Text(
                //       'Or continue with',
                //       style: context.textStyles.caption1
                //           .copyWith(color: context.colors.mainText),
                //       textAlign: TextAlign.center,
                //     ),
                // const SizedBox(height: 24),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   mainAxisSize: MainAxisSize.max,
                //   children: <Widget>[
                //     CustomIconButton(
                //       icon: Image.asset('assets/images/google.png'),
                //     ),
                //     CustomIconButton(
                //       icon: Image.asset('assets/images/apple.png'),
                //     ),
                //     CustomIconButton(
                //       icon: Image.asset('assets/images/facebook.png'),
                //     ),
                //   ],
                // ),
                //   ]),
                // ),
                const SizedBox(height: 300),
                Text(
                  S.of(context).dontHaveAccount,
                  style: context.textStyles.h4
                      .copyWith(color: context.colors.mainText),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                Consumer(
                  builder: (context, ref, child) {
                    return CustomOutlinedButton(
                      onPressed: () => ref
                          .read(routerProvider)
                          .go(RegistrationPage.routeLocation),
                      text: S.of(context).signUp,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailInputController.dispose();
    _passwordInputController.dispose();
  }
}
