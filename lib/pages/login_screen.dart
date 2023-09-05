import 'package:crypto_currency/core/extensions/build_context_extension.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: context.colors.background,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                Expanded(
                  child: Text(
                    'Sign in',
                    style: context.textStyles.h2.copyWith(
                      color: context.colors.mainText,
                    ),
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      FieldOfForm(
                          text: 'Email address',
                          prefixIcon: Icons.email_outlined),
                      SizedBox(height: 10),
                      FieldOfForm(
                        text: 'Password',
                        prefixIcon: Icons.security_outlined,
                        suffixIcon: Icons.visibility_off_outlined,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomFilledButton(
                        onPressed: () =>
                            Navigator.pushReplacementNamed(context, '/home'),
                        text: 'Login',
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Forgot Password?',
                        style: context.textStyles.bold
                            .copyWith(color: context.colors.dark70),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(children: [
                    Text(
                      'Or continue with',
                      style: context.textStyles.caption1
                          .copyWith(color: context.colors.mainText),
                      textAlign: TextAlign.center,
                    ),
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
                  ]),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    width: double.infinity,
                    color: context.colors.background,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: context.textStyles.h4
                              .copyWith(color: context.colors.mainText),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 15),
                        CustomOutlinedButton(onPressed: () {}, text: 'Sign up'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
