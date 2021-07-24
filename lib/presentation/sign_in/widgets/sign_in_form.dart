import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../application/auth/auth_module.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    Key? key,
    required this.authModule,
  }) : super(key: key);

  final AuthModule authModule;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Form(
        autovalidateMode: authModule.autovalidate
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
              ),
              autocorrect: false,
              onChanged: (value) => authModule.emailChanged(emailStr: value),
              validator: (_) => authModule.emailAddress?.value.fold(
                (f) => f.maybeMap(
                    invalidEmail: (_) => 'Invalid Email',
                    shortPassword: (_) => null,
                    orElse: () {}),
                (r) => null,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Password',
              ),
              autocorrect: false,
              obscureText: true,
              onChanged: (value) =>
                  authModule.passwordChanged(passwordStr: value),
              validator: (_) => authModule.password?.value.fold(
                (f) => f.maybeMap(
                    invalidEmail: (_) => 'Short password',
                    shortPassword: (_) => null,
                    orElse: () {}),
                (r) => null,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      authModule.signInWithEmailAndPasswordPresses();
                    },
                    child: const Text('SIGN IN'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      authModule.registerWithEmailAndPasswordPresses();
                    },
                    child: const Text('REGISTER'),
                  ),
                )
              ],
            ),
            if (authModule.isSubmitting) ...[
              const SizedBox(height: 8),
              const LinearProgressIndicator(),
            ]
          ],
        ),
      ),
    );
  }
}
