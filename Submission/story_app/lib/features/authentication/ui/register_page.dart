import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:story_app/common/constants.dart';
import 'package:story_app/features/authentication/data/model/register.dart';
import 'package:story_app/features/authentication/provider/auth_provider.dart';
import 'package:story_app/localization/localization.dart';
import 'package:story_app/utils/show_snackbar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final content = AppLocalizations.of(context)!;

    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
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
                            return content.errorValidateName;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: content.textName,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: emailController,
                        validator: (value) => EmailValidator.validate(value!)
                            ? null
                            : content.errorValidateEmail,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: content.textEmail,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: content.textPassword,
                        ),
                        validator: (value) {
                          if (value == null || value.length < 8) {
                            return content.errorValidatePass;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8.0),
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
                              if (!isRegister) {
                                showSnackbar(context, provider.message);
                                Future.delayed(
                                  const Duration(seconds: 1),
                                  () => context.goNamed(Routes.login),
                                );
                              } else {
                                showSnackbar(context, provider.message);
                              }
                            }
                          } else {
                            showSnackbar(context, content.errorValidateForm);
                          }
                        },
                        child: provider.isLoading
                            ? const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: CircularProgressIndicator(),
                              )
                            : Text(content.textRegister),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () => context.goNamed(Routes.login),
                  child: Text(content.textLogin),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
  }
}
