import 'package:flutter/foundation.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<Map<String, dynamic>> cartItems;
  CartUpdated(this.cartItems);
}
