import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:story_app/common/constants.dart';
import 'package:story_app/features/authentication/data/model/register.dart';
import 'package:story_app/features/authentication/data/model/register_response.dart';
import 'package:story_app/features/authentication/provider/auth_provider.dart';
import 'package:story_app/utils/show_snackbar.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Name.';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Name",
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: emailController,
                        validator: (value) => EmailValidator.validate(value!)
                            ? null
                            : "Please enter a Valid Email",
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email",
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value == null || value.length < 8) {
                            return 'Minimal character length is 8';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 8.0),
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            final name = nameController.text.toString();
                            final email = emailController.text.toString();
                            final password = passwordController.text.toString();
                            final credentials = RegisterInfo(
                              name: name,
                              email: email,
                              password: password,
                            );

                            final isRegister =
                                await provider.registerUser(credentials);
                            if (context.mounted) {
                              if (isRegister) {
                                showSnackbar(
                                    context, provider.registerResponse.message);
                                Future.delayed(
                                  Duration(seconds: 1),
                                  () => context.goNamed(Routes.loginNamedPage),
                                );
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
                            : Text('Register'),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () => context.goNamed(Routes.loginNamedPage),
                  child: Text("Login"),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
