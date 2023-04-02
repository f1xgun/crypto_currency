import 'package:crypto_currency/widgets/form_field.dart';
import 'package:crypto_currency/widgets/icon_button.dart';
import 'package:crypto_currency/widgets/outlined_button.dart';
import 'package:flutter/material.dart';

import '../app_styles.dart';
import '../widgets/filled_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                const Expanded(
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: const [
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
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(children: [
                    const Text(
                      'Or continue with',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        CustomIconButton(
                          icon: Image.asset('assets/images/google.png'),
                        ),
                        CustomIconButton(
                          icon: Image.asset('assets/images/apple.png'),
                        ),
                        CustomIconButton(
                          icon: Image.asset('assets/images/facebook.png'),
                        ),
                      ],
                    ),
                  ]),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    width: double.infinity,
                    color: kBackgroundColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text('Don\'t have an account?',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center),
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
