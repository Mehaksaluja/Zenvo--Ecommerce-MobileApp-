import 'package:flutter/material.dart';

@immutable
abstract class AuthEvent {}

class LoginButtonPressed extends AuthEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});
}
