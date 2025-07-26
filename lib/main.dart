import 'package:flutter/material.dart';
import 'package:shopper_app/features/auth/presentation/pages/login_page.dart';
import 'package:shopper_app/core/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper_app/features/auth/bloc/auth_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopper App',
      theme: AppTheme.lightTheme,
      home: BlocProvider(create: (context) => AuthBloc(), child: LoginPage()),
      debugShowCheckedModeBanner: false,
    );
  }
}
