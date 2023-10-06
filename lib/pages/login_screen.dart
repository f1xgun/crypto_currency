import 'package:crypto_currency/core/extensions/build_context_extension.dart';
import 'package:crypto_currency/core/l10n/s.dart';
import 'package:crypto_currency/widgets/filled_button.dart';
import 'package:crypto_currency/widgets/form_field.dart';
import 'package:crypto_currency/widgets/outlined_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _loginInputController;
  late TextEditingController _passwordInputController;
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _loginInputController = TextEditingController();
    _passwordInputController = TextEditingController();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ColoredBox(
        color: context.colors.background,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                Expanded(
                  child: Text(
                    S.of(context).signIn,
                    style: context.textStyles.h2.copyWith(
                      color: context.colors.mainText,
                    ),
                  ),
                ),
                FieldOfForm(
                  inputController: _loginInputController,
                  height: 64,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  text: S.of(context).emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                const SizedBox(height: 10),
                FieldOfForm(
                  inputController: _passwordInputController,
                  height: 64,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  text: S.of(context).password,
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
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomFilledButton(
                        onPressed: () =>
                            Navigator.pushReplacementNamed(context, '/home'),
                        text: S.of(context).login,
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
                Text(
                  S.of(context).dontHaveAccount,
                  style: context.textStyles.h4
                      .copyWith(color: context.colors.mainText),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                CustomOutlinedButton(
                  onPressed: () {},
                  text: S.of(context).signUp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
