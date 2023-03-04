import 'package:crypto_currency/pages/rangking_screen.dart';
import 'package:crypto_currency/widgets/form_field.dart';
import 'package:crypto_currency/widgets/icon_button.dart';
import 'package:crypto_currency/widgets/outlined_button.dart';
import 'package:flutter/material.dart';

import '../app_style.dart';
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Sign in',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const FieldOfForm(
                    text: 'Email address', prefixIcon: Icons.email_outlined),
                const SizedBox(
                  height: 10,
                ),
                const FieldOfForm(
                  text: 'Password',
                  prefixIcon: Icons.security_outlined,
                  suffixIcon: Icons.visibility_off_outlined,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  onPressed: () {},
                  text: 'Login',
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                const Text(
                  'Or continue with',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CustomIconButton(
                          icon: Image.asset('assets/images/google.png'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CustomIconButton(
                          icon: Image.asset('assets/images/apple.png'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CustomIconButton(
                          icon: Image.asset('assets/images/facebook.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                CustomFilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RangkingPage(),
                      ),
                    );
                  },
                  text: 'Go Rangking',
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
            CustomOutlinedButton(onPressed: () {}, text: 'Sign up')
          ],
        ),
      ),
    );
  }
}
