import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper_app/features/auth/bloc/auth_bloc.dart';
import 'package:shopper_app/features/auth/bloc/auth_event.dart';
import 'package:shopper_app/features/auth/bloc/auth_state.dart';
import 'package:shopper_app/features/products/presentation/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get text styles from the current theme for consistency.
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      // We don't need an AppBar for a modern login screen.
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is AuthSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            // Show a full-screen loading indicator
            if (state is AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // The main UI
            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // 1. Header Section
                      const SizedBox(height: 60),
                      Text(
                        'Welcome Back!',
                        textAlign: TextAlign.center,
                        style: textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Sign in to continue to your account',
                        textAlign: TextAlign.center,
                        style: textTheme.bodyLarge?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 50),

                      // 2. Email & Password Fields
                      Text('Email', style: textTheme.labelLarge),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'youremail@example.com',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      Text('Password', style: textTheme.labelLarge),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Your password',
                        ),
                      ),
                      const SizedBox(height: 40),

                      // 3. Sign In Button
                      FilledButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(
                            LoginButtonPressed(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                        },
                        child: const Text('Sign In'),
                      ),
                      const SizedBox(height: 50),

                      // 4. "Or continue with" Divider
                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Text('OR', style: textTheme.labelMedium),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // 5. Social Login Buttons
                      OutlinedButton.icon(
                        icon: const Icon(
                          Icons.apple,
                        ), // Replace with a proper logo if available
                        onPressed: () {
                          /* Social login logic goes here */
                        },
                        label: const Text('Continue with Apple'),
                      ),
                      const SizedBox(height: 16),
                      OutlinedButton.icon(
                        icon: const Icon(
                          Icons.g_mobiledata,
                        ), // Replace with a proper logo
                        onPressed: () {
                          /* Social login logic goes here */
                        },
                        label: const Text('Continue with Google'),
                      ),

                      const SizedBox(height: 40),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: textTheme.bodyMedium,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Sign Up'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
