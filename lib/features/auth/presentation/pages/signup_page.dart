import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:we_care/core/routes/routes.dart';
import 'package:we_care/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:we_care/features/auth/presentation/cubit/auth_state.dart';
import 'package:we_care/features/auth/presentation/widgets/auth_appbar.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isTNCAgree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppBar(
        title: 'Create Account',
        subtitle: 'Join WeCare Today',
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            if (state.isNewUser) {
              context.go(Routes.login);
            } else {
              context.go(Routes.dashboard);
            }
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is AuthUnauthenticated) {
            // Handle logout UI
          }
        },
        builder: (context, state) {
          final cubit = context.read<AuthCubit>();
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('I agree to the Terms and Conditions'),
                    leading: Checkbox(
                      value: isTNCAgree,
                      onChanged: (value) {
                        setState(() {
                          isTNCAgree = !isTNCAgree;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: state is AuthLoading
                          ? null
                          : () {
                              if (isTNCAgree) {
                                cubit.signUpWithEmail(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                  phone: phoneController.text.trim(),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Agree Terms and Conditions"),
                                  ),
                                );
                              }
                            },
                      child: const Text('Sign Up'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
