import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:story_app/common/constants.dart';
import 'package:story_app/features/authentication/data/local/auth_local_data_source.dart';
import 'package:story_app/features/authentication/data/model/login.dart';
import 'package:story_app/features/authentication/provider/auth_provider.dart';
import 'package:story_app/utils/result_state.dart';
import 'package:story_app/utils/show_snackbar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});



  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Icon(
                      Icons.account_box,
                      size: 256,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            controller: emailController,
                            validator: (value) =>
                                EmailValidator.validate(value!)
                                    ? null
                                    : 'Please Enter your email',
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Email",
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password.';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 8.0),
                          ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                final email = emailController.text.toString();
                                final password =
                                passwordController.text.toString();
                                final credentials = LoginInfo(
                                  email: email,
                                  password: password,
                                );
                                final isLogin =
                                await provider.loginUser(credentials);
                                if (context.mounted) {
                                  if (isLogin) {
                                    context.goNamed(Routes.root);
                                  } else {
                                    showSnackbar(context, provider.message);
                                  }
                                }
                              } else {
                                showSnackbar(context, 'Please Check Again');
                              }
                            },
                            child: provider.isLoading
                                ? Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: CircularProgressIndicator(),
                                  )
                                : Text('Login'),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                        onPressed: () =>
                            context.pushNamed(Routes.registerNamedPage),
                        child: Text("Register"))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
